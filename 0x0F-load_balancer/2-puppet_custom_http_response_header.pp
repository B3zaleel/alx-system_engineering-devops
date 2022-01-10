# Nginx web server setup and configuration
exec { 'apt-get-update':
  command => 'bash -c "apt-get update; echo"',
  path    => '/usr/bin:/usr/sbin:/bin'
}

package { 'nginx':
  ensure          => installed,
  provider        => 'apt',
  install_options => ['-y'],
  require         => Exec['apt-get-update']
}

file { 'Static-Files':
  ensure => directory,
  path   => '/var/www/',
  mode   => '0666',
  owner  => 'www-data'
}

file { 'HTML-Pages':
  ensure  => directory,
  path    => '/var/www/html',
  mode    => '0666',
  owner   => 'www-data',
  require => File['Static-Files']
}

file { 'Error-Pages':
  ensure  => directory,
  path    => '/var/www/error',
  mode    => '0666',
  owner   => 'www-data',
  require => File['Static-Files']
}

file { 'Home-Page':
  ensure  => file,
  path    => '/var/www/html/index.html',
  mode    => '0666',
  owner   => 'www-data',
  content => "Hello World!\n",
  require => File['HTML-Pages']
}

file { '404-Page':
  ensure  => file,
  path    => '/var/www/error/404.html',
  mode    => '0666',
  owner   => 'www-data',
  content => "Ceci n'est pas une page\n",
  require => File['Error-Pages']
}

file { 'Nginx-Config':
  ensure  => file,
  path    => '/etc/nginx/sites-enabled/default',
  mode    => '0666',
  owner   => 'www-data',
  content =>
"server {
	listen 80 default_server;
	listen [::]:80 default_server;

	root /var/www/html;
	index index.html index.htm index.nginx-debian.html;

	server_name _;

	location / {
		try_files \$uri \$uri/ =404;
		add_header X-Served-By \$hostname;
	}

	if (\$request_filename ~ redirect_me){
		rewrite ^ https://sketchfab.com/bluepeno/models permanent;
	}

	error_page 404 /404.html;
	location = /404.html {
		root /var/www/error/;
		internal;
		add_header X-Served-By \$hostname;
	}
}
",
  require => [File['Home-Page'], File['404-Page']]
}

service { 'nginx':
  ensure  => running,
  require => [Package['nginx'], File['Nginx-Config']]
}
