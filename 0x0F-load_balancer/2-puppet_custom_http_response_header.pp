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
  mode    => '0666',
  owner   => 'www-data',
  content => 'Hello World!'
}

# file { '404-Page':
#   ensure  => file,
#   path    => '/var/www/error/404.html',
#   mode    => '0666',
#   owner   => 'www-data',
#   content => "Ceci n'est pas une page\n"
# }

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
	index index.html index.nginx-debian.html;

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
  require => [File['Home-Page']]
}

service { 'nginx':
  ensure  => running,
  require => [Exec['install-nginx'], File['Nginx-Config']]
}

Service['nginx']
