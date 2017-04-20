class nginx_load_balancer::config {
  file { '/etc/nginx/nginx.conf':
      ensure  => present,
      owner => nginx,
      group => nginx,
      mode => 0550,
      content => template ('nginx_load_balancer/nginx.conf.erb'),
  }
}
