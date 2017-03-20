# Classs fluentd::params
# param defaults
#
class fluentd::params {

  $package_name   = 'td-agent'
  $package_ensure = present

  $service_name   = 'td-agent'
  $service_ensure = running
  $service_enable = true
  $service_manage = true

  $config_file    = '/etc/td-agent/td-agent.conf'
  $config_path    = '/etc/td-agent/conf.d'
  $config_owner   = 'td-agent'
  $config_group   = 'td-agent'
  $config_mode    = '0644'

  $plugin_ensure   = present
  $plugin_source   = 'https://rubygems.org'
  $plugin_install_options = []
  $plugin_provider = 'tdagent'
  $agent_user      = 'root'
  $agent_group     = 'root'


  case $::osfamily {
    'RedHat' : {
      $service_provider = 'redhat'
    }
    default : {
      notify {"Warning: OS Family ${::osfamily} not supported in class fluentd":}
    }
  }

  $configs = {}
  $plugins = {}

}
