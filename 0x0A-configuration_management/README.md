# Configuration Management

This project contains tasks for learning about configuration management using Puppet (the Ruby gem).

## Tasks To Complete

+ [x] 0\. Create a file<br/>_**[0-create_a_file.pp](0-create_a_file.pp)**_ creates a file in `/tmp` using Puppet.
  + Requirements:
    + File path is `/tmp/school`.
    + File permission is `0744`.
    + File owner is `www-data`.
    + File group is `www-data`.
    + File contains `I love Puppet`.

+ [x] 1\. Install a package<br/>_**[1-install_a_package.pp](1-install_a_package.pp)**_ installs `puppet-lint` using Puppet.
  + Requirements:
    + Install `puppet-lint`.
    + Version must be `2.5.0`.

+ [x] 2\. Execute a command<br/>_**[2-execute_a_command.pp](2-execute_a_command.pp)**_ creates a manifest that kills a process named `killmenow` using Puppet.
  + Requirements:
    + Must use the `exec` Puppet resource.
    + Must use `pkill`.
