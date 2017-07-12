# Ansible Best Practices #

* Infrastructure as Code: Portability
* CI/CD: One playbook, multiple inventories
* Security: Host access and privilege escalation
* Unresolved security issues
* Application Security: ansible-vault
* Idempotence
* Naming conventions
* Playbook layout
* Keep it simple and readable
* Write playbooks in pairs


## Infrastructure as Code: Portability ##

In our "Infrastructure as code" efforts, Ansible playbooks should be managed as
code according to the following guidelines:

* Playbooks and roles must be checked into subversion and kept current
* Playbooks should be self-contained and portable, easily checked out and run,
  where appropriate, by any developer, tester or DevOps team member
* As much as practicable, ansible roles should be generic and reusable
* All binaries and artifacts should be pulled from either an artifactory or
  native repository.

**Note:** As a temporary stop-gap, symlinks to directories outside the playbook,
e.g. /software, may be used as long as the link, and not the artifact, is
checked into subversion. Again playbooks should absolutely NOT include any
binaries in their directory structure (packages, tar files or other compressed
or binary artifacts)

**Note:** At least one central generic artifactory will be created for installer
packages or other binaries as a practical alternative to the "/software"
directory currently used on some ansible control hosts.


## CI/CD: One playbook, multiple inventories ##

As much as possible, ansible playbooks should be developed and refined
alongside the target application following the continuous integration model.
This means an application playbook collection should reliably provision,
configure, deploy and update that app across multiple environments with each
environment represented by a well organized ansible inventory and group_vars
directory structure.

**CI Pipeline:**
```
    Developers/Testers/DevOps       |                Devops-only
Development -> QA -> Performance -> | -> Grinder -> Integration Lab -> Production
                                    |
```

## Security: Host access and privilege escalation ##

Playbooks should be written according to the least privilege principle using
the lowest access possible to accomplish a task or role using privilege
escalation only when necessary.

By default ansible uses ssh to access a host then sudo for privilege
escalation. Unless otherwise directed, ansible will ssh via the current user's
Linux account/gid when executing playbooks. Most maintenance and update
playbooks should work primarily via functional accounts using the "become" and
"become_user" directives. Global security policy should ensure that
developers and testers should be able to run these types of playbooks only in
the following CI pipeline stages:

* Development
* QA
* Performance

... while DevOps team members, who may run a playbook in any environment,
should be the only ones who run playbooks for:

* Grinder
* Integration Lab (nee NSX Lab)
* Production

RBAC policy/netgroup membership should enforce this automatically
meaning if developers or testers attempt to execute a playbook against
production, for example, the attempt will fail due to lack of sudo access.

## Unresolved security issues ##

1. **Sudo-to-root excludes shell access** - For DevOps, security policy
   explicitly excludes all common command-line shells. This breaks several
   ansible modules needed for the initial provisioning of a typical application
   host when the root account is used via the become directive.  Workarounds
   involve either vastly more complicated, labor-intensive, sub-optimal
   playbooks, or directly accessing the root account. We are awaiting a reply
   from GS on our request to remove this restriction.

1. **Functional accounts are set to nologin** - Again, the "nologin" option
   prevents some functional account from using a shell which in turn breaks
   some ansible modules that need prvilige escalation. Workaounds involve more
   complicated playbooks, directly invoking sudo via scripts instead of using
   modules and disabling Puppet which antuomatically maintains this setting. We
   are awaiting a reply from GS on our request to remove this restriction.

1. **Continuous Integration functional Accounts needed** - For CI/CD, Jenkins,
   via the jenkins Linux account, must check out playbooks from subversion then
   execute them for post-build deployments. This means the jenkins account
   needs ssh access and sudo in the Development, QA and performance stages of
   the CI pipeline the way developers and testers do. Currently, jenkins
   accounts exist only on our build servers, not in AD. Remediation will be to
   create a jenkins user in the ad.syniverse.com with membership in the
   api_dev_dev netgroup. This request has not yet been made.

### Application Security: ansible-vault ###

It is often necessary to store application-level auth tokens or passwords in
ansible group_vars. SII, PSM, SSL certificate stores, WebLogic and wso2 are
some examples. For the Integration lab and production, auth tokens and
passwords stored in a playbook must differ from other pipeline stages and must
be encrypted via ansible-vault so that the plain-text passwords are never
checked into subversion. That the ansible-vault encryption password should be
shared with the team and changed if a team member leaves.

## Idempotence ##

As much as possible, playbooks should be idempotent, meaning that if no changes
are needed then none are made. Ideally, running the same playbook repeatedly
should not change anything.

* The command, script and raw modules should only be used as a last resort,
  especially raw which is inherenltly dangerous and non-idempotent. e.g.
    Instead of a curl script, use the uri module
    Instead of scripting grep or sed, use the lineinfile module
    Instead of scrpting rpm, use the yum module

* If the command or script modules must be used (e.g. for WebLogic scripts),
  then use the "creates" directive whenever possible
* Use handlers to manage manage post-configuration events

## Naming conventions ##

* Name files according to their format

e.g.
 - yaml files should end in yml or yaml, e.g "main.yml"
 - inventories user the ini format and should end in .ini, e.g.
   "production.ini" or "hosts.ini"
 - Jinja2 templates should end in ".j2" e.g. "ntp.conf.j2" or "settings.xml.j2"

 * Avoid the minus sign when naming variables, roles, tasks, etc. since it is a
   reserved character for yaml definitions.
 
 - use "my_variable_name" instead of "my-variable-name"

 * Use descriptive task and variable names
 e.g.
 - "sii_bulk_upsert" instead of "sii_prov"
 - "update_java_preferences" instead of "run_groovy"



## Playbook layout ##

In order to store the fewest number of variables, avoid duplications,
facilitate portability and modularity, and to foster a familiar design
language that we all grow to recognize, playbooks should adhere to the
following layout strategy:

Each CI stage (which we may use interchangeably with "environment") should have
its own ansible inventory, e.g.

```sample_playbook
├── group_vars   <---      "Global variables go here..."
│   ├── all.yml            "all apps, all instances"
│   ├── app1.yml           "all instances of app1"
│   └── app2.yml           "all instances of app2"
│ 
│ 
├── hosts                  "Inventories"
│   ├── development        
│   │   └── group_vars     "Development-only variables"
│   │       ├── all.yml    "For all apps in the dev environment"
│   │       ├── app1.ym2   "app1 variables in dev"
│   │       └── app2.yml   "app2 variables in dev"
│   ├── integration
│   │   └── group_vars
│   │       ├── all.yml
│   │       ├── app1.yml
│   │       └── app2.yml
│   └── production
│       └── group_vars
│           ├── all.yml
│           ├── app1.yml
│           └── app2.yml
│ 
│ 
├── my_playbook.yml        "The actual playbook"
│ 
│ 
└── roles                  "Roles are units of functionality"
    ├── role1
    │   ├── files
    │   │   └── my_file.txt
    │   ├── tasks
    │   │   └── main.yml
    │   └── templates
    │       └── my_template.ext.j2
    └── role2
        ├── files
        │   └── my_file.txt
        ├── tasks          "At minimum, a role hast this dirctory"
        │   └── main.yml   "At minimum, a role hast one main.yml"
        └── templates
            └── my_template.ext.j2
```


## Keep it simple and readable ##

* Impress with flow, descriptive task names and concise, useful comments
* Elegance and simplicity trump complexity
* Avoid empty directories, e.g. templates, files, group_vars and handlers.


## Write playbooks in pairs ##
* Application install playbooks should be bundled with an uninstall playbook,
  the roles from these may be used during upgrades and rollbacks.
* Alternatively or in addition to install/uninstalls whenever possible, upgrade
  playbooks should be created with a path for downgrades to ensure smooth
  rollbacks.
