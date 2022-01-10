# Nginx web server setup and configuration
# Software installations
class software_resources {
  # exec { 'Update the apt repository':
  #   command => 'apt-get -q update',
  #   path    => '/usr/bin:/usr/sbin:/bin'
  # }
  exec { 'Install the web server':
    command => 'apt-get -q -y install nginx',
    path    => '/usr/bin:/usr/sbin:/bin'
  }
}

# The static files
class static_files {
  # resources
  file { 'The static files directory':
    ensure => directory,
    path   => '/var/www/',
    mode   => '0666',
    owner  => 'www-data'
  }

  file { 'The static files HTML pages directory':
    ensure => directory,
    path   => '/var/www/html',
    mode   => '0666',
    owner  => 'www-data'
  }

  file { 'The static files error pages directory':
    ensure => directory,
    path   => '/var/www/error',
    mode   => '0666',
    owner  => 'www-data'
  }

  file { 'The home page':
    ensure  => file,
    path    => '/var/www/html/index.html',
    mode    => '0666',
    owner   => 'www-data',
    content => "Hello World!\n"
  }

  file { 'The 404 page':
    ensure  => file,
    path    => '/var/www/error/404.html',
    mode    => '0666',
    owner   => 'www-data',
    content => "Ceci n'est pas une page\n"
  }
}

# configuration files
class config_files {
  file { 'Nginx server config file':
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
"
  }
}

# Essential processes
class essential_services {
  service { 'nginx':
    ensure => running
  }
}

include software_resources
include static_files
include config_files
include essential_services
