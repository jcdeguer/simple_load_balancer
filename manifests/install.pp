class simple_load_balancer::install inherits simple_load_balancer::params {
  exec { 'install_nginx':
    command => '/usr/bin/yum -y install nginx',
   }
 }
