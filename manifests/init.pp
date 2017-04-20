# == Class: simple_load_balancer
# Full description of class simple_load_balancer here.
#
# === Parameters
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#  class { 'simple_load_balancer':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
# Deguer, Juan Carlos <juan.deguer@gmail.com>
#
# === Copyright
# Copyright 2017 Your name here, unless otherwise noted.
#
class simple_load_balancer (
  $estado_del_balanceo          = $::simple_load_balancer::params::estado_del_balanceo,
  $servicio_a_clusterizar       = $::simple_load_balancer::params::servicio_a_clusterizar,
  $full_fqdn_server1            = $::simple_load_balancer::params::full_fqdn_server1,
  $full_fqdn_server2            = $::simple_load_balancer::params::full_fqdn_server2,
  $puerto_usado_app             = $::simple_load_balancer::params::puerto_usado_app,
  $keepalive_timeout            = $::simple_load_balancer::params::keepalive_timeout,
  $usuario                      = $::simple_load_balancer::params::usuario,
  $log_de_errores               = $::simple_load_balancer::params::log_de_errores,
  $id_de_proceso                = $::simple_load_balancer::params::id_de_proceso,
  $modulos_incluidos            = $::simple_load_balancer::params::modulos_incluidos,
  $worker_processes             = $::simple_load_balancer::params::worker_processes,
  $worker_rlimit_nofile         = $::simple_load_balancer::params::worker_rlimit_nofile,
  $accept_mutex                 = $::simple_load_balancer::params::accept_mutex,
  $accept_mutex_delay           = $::simple_load_balancer::params::accept_mutex_delay,
  $worker_connections           = $::simple_load_balancer::params::worker_connections,
  $puerto                       = $::simple_load_balancer::params::puerto,
  $directorio_raiz              = $::simple_load_balancer::params::directorio_raiz,

) inherits simple_load_balancer::params {
  include simple_load_balancer::install
  include simple_load_balancer::config
  Class['simple_load_balancer::install'] -> Class['simple_load_balancer::config'] -> Exec ['nginx-service']
  exec { 'nginx-service':
    command => '/usr/sbin/service nginx start',
  }
}
