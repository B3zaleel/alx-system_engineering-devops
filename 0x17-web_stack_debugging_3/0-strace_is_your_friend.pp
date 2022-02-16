# Fixes a faulty wordpress site
exec { 'fix-wordpress':
  command => [
    '/usr/bin/bash -c',
    "'sed -i",
    's/class-wp-locale.phpp/class-wp-locale.php/',
    '/var/www/html/wp-settings.php',
    "; service apache2 restart'",
  ].join(' ')
}
