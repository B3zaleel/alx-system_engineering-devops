# Fixes an nginx site that can't handle multiple concurrent requests
exec { 'fix--for-nginx':
  command => 'bash -c "sed -iE s/#\s*multi_accept on;/multi_accept on;/ \
/etc/nginx/nginx.conf; sed -iE s/worker_processes [a-z0-9]*/worker_processes 15/ \
/etc/nginx/nginx.conf; service nginx restart"',
  path    => '/usr/bin:/usr/sbin:/bin'
}
