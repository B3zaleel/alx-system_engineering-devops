# SSH

This project contains tasks for learning about using SSH to connect to a remote server.

## Tasks To Complete

+ [x] 0\. Use a private key<br/>_**[0-use_a_private_key](0-use_a_private_key)**_ contains a Bash script that uses `ssh` to connect to a server using the private key `~/.ssh/school` with the user `ubuntu`.
  + Requirements:
    + Only use `ssh` single-character flags.
    + You cannot use `-l`.
    + You do not need to handle the case of a private key protected by a passphrase.

+ [x] 1\. Create an SSH key pair<br/>_**[1-create_ssh_key_pair](1-create_ssh_key_pair)**_ contains a Bash script that creates an RSA key pair.
  + Requirements:
    + Name of the created private key must be `school`.
    + Number of bits in the created key to be created 4096.
    + The created key must be protected by the passphrase `betty`.

+ [x] 2\. Client configuration file<br/>_**[2-ssh_config](2-ssh_config)**_ contains an SSH client configuration that is configured so that someone can connect to the server without typing a password.
  + Requirements:
    + The SSH client configuration must be configured to use the private key `~/.ssh/school`.
    + The SSH client configuration must be configured to refuse to authenticate using a password.

+ [x] 3\. Let me in!<br/>Add the SSH public key below to the server so that others can connect using the `ubuntu` user.
  ```yaml
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNdtrNGtTXe5Tp1EJQop8mOSAuRGLjJ6DW4PqX4wId/Kawz35ESampIqHSOTJmbQ8UlxdJuk0gAXKk3Ncle4safGYqM/VeDK3LN5iAJxf4kcaxNtS3eVxWBE5iF3FbIjOqwxw5Lf5sRa5yXxA8HfWidhbIG5TqKL922hPgsCGABIrXRlfZYeC0FEuPWdr6smOElSVvIXthRWp9cr685KdCI+COxlj1RdVsvIo+zunmLACF9PYdjB2s96Fn0ocD3c5SGLvDOFCyvDojSAOyE70ebIElnskKsDTGwfT4P6jh9OBzTyQEIS2jOaE5RQq4IB4DsMhvbjDSQrP0MdCLgwkN
  ```

+ [x] 4\. Client configuration file (w/ Puppet)<br/>_**[100-puppet_ssh_config.pp](100-puppet_ssh_config.pp)**_ contains an SSH client configuration that is configured so that someone can connect to the server without typing a password using Puppet.
  + Requirements:
    + The SSH client configuration must be configured to use the private key `~/.ssh/school`.
    + The SSH client configuration must be configured to refuse to authenticate using a password.
