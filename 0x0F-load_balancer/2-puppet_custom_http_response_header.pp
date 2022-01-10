# Nginx web server setup and configuration
exec { 'apt-get-update':
  command => 'bash -c "apt-get update; echo"',
  path    => '/usr/bin:/usr/sbin:/bin'
}

exec { 'install-nginx':
  command => 'bash -c "apt-get -y -q install nginx; echo"',
  path    => '/usr/bin:/usr/sbin:/bin',
  require => Exec['apt-get-update']
}

file { 'Home-Page':
  ensure  => file,
  path    => '/var/www/html/index.html',
  content => "Hello World!\n"
}

file { '404-Page':
  ensure  => file,
  path    => '/var/www/html/404.html',
  content => "Ceci n'est pas une page\n"
}

file_line { 'Nginx-Config':
  ensure  => present,
  path    => '/etc/nginx/sites-available/default',
  after   => 'server_name _;',
  line    => "\tadd_header X-Served-By \$hostname;",
  require => [File['Home-Page'], File['404-Page'], Exec['install-nginx']]
}
-> service { 'nginx':
  ensure  => running
}
