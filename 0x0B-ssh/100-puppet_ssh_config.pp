# Client configuration
exec { 'Turn off passwd auth':
  command => 'bash -c "echo PasswordAuthentication no >> /etc/ssh/ssh_config"',
  path    => '/usr/bin:/usr/sbin:/bin'
}
exec { 'Declare identity file':
  command => 'bash -c "echo IdentityFile \'~/.ssh/school\' >> /etc/ssh/ssh_config"',
  path    => '/usr/bin:/usr/sbin:/bin'
}
exec { 'Turn on pubkey auth':
  command => 'bash -c "echo PubkeyAuthentication yes >> /etc/ssh/ssh_config"',
  path    => '/usr/bin:/usr/sbin:/bin'
}
