# Class: nginx::params
#
class nginx_load_balancer::params {
  $estado_del_balanceo          = false
  $servicio_a_clusterizar       = 'servicio_a_clusterizar'
  $full_fqdn_server1            = 'full_fqdn_server1'
  $full_fqdn_server2            = 'full_fqdn_server2'
  $puerto_usado_app             = 'puerto_usado_app'
  $keepalive_timeout            = '10'
  $usuario                      = 'nginx'
  $log_de_errores               = '/var/log/nginx/error.log'
  $id_de_proceso                = '/run/nginx.pid'
  $modulos_incluidos            = '/usr/share/nginx/modules/*.conf'
  $worker_processes             = 1
  $worker_rlimit_nofile         = 1024
  $accept_mutex                 = 'on'
  $accept_mutex_delay           = '500ms'
  $worker_connections           = 1024
  $puerto                       = 80
  $directorio_raiz              = '/'
}
