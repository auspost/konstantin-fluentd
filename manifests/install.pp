# Class fluentd::install
# installs fluentd td-agent and config
#
class fluentd::install {

  package { $fluentd::package_name:
    ensure => $fluentd::package_ensure,
  } ->

  file { $fluentd::config_path:
    ensure  => directory,
    owner   => $fluentd::config_owner,
    group   => $fluentd::config_group,
    mode    => '0750',
    recurse => true,
    force   => true,
    purge   => true,
  } ->

  file { $fluentd::config_file:
    ensure => file,
    source => 'puppet:///modules/fluentd/td-agent.conf',
    owner  => $fluentd::config_owner,
    group  => $fluentd::config_group,
    mode   => '0640',
  } ->

  file {"/etc/init.d/${fluentd::service_name}":
    ensure  => file,
    mode    => '0755',
    content => template('fluentd/td-agent.erb'),
    owner   => $fluentd::agent_user,
    group   => $fluentd::agent_group,
  }
}
