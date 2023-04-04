#puppet advance
exec { 'update':
  command  => 'sudo apt-get update',
  provider => shell,
}
-> package {'nginx':
  ensure => present,
}
-> file_line { 'header line':
  ensure => present,
  path   => '/etc/nginx/nginx.conf',
  line   => "\tadd_header X-Served-By ${hostname};",
  after  => 'http{',
}
-> exec { 'restart service':
  command  => 'sudo /usr/sbin/service nginx restart',
  provider => shell,
}`
