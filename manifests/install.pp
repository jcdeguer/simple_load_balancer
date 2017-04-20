class nginx_load_balancer::install
inherits nginx_load_balancer::params {
  case $::osfamily {
    'Debian': {
      exec { 'install_nginx':
        command => '/usr/bin/apt-get -y install nginx',
      }
    }
    'RedHat': {
      exec { 'install_nginx':
        command => '/usr/bin/yum -y install nginx',
      }
    }
  }
}
