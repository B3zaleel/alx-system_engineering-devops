# Nginx web server setup and configuration
exec { 'update-apt':
  command => '/usr/bin/apt-get update'
}

package { 'nginx':
  ensure  => installed,
  require => Exec['update-apt']
}

file_line { 'Redirection':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  after   => 'listen 80 default_server;',
  line    => 'rewrite ^/redirect_me https://sketchfab.com/bluepeno/models permanent;',
  require => Package['nginx']
}

file_line { 'Custom-Header':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  after   => 'listen 80 default_server;',
  line    => 'add_header X-Served-By $hostname;',
  require => Package['nginx']
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
  require => Package['nginx']
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx']
}
