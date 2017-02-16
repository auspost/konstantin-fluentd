class fluentd::install {

  package { $fluentd::params::package_name:
    ensure => $fluentd::params::package_ensure,
  } ->

  file { $fluentd::params::config_path:
    ensure  => directory,
    owner   => $fluentd::params::config_owner,
    group   => $fluentd::params::config_group,
    mode    => '0750',
    recurse => true,
    force   => true,
    purge   => true,
  } ->

  file { $fluentd::params::config_file:
    ensure => present,
    source => 'puppet:///modules/fluentd/td-agent.conf',
    owner  => $fluentd::params::config_owner,
    group  => $fluentd::params::config_group,
    mode   => '0640',
  } ->

  file {"/etc/init.d/${fluentd::params::service}":
    ensure   => present,
    mode     => '0755',
    content  => template('fluentd/td-agent.erb'),
    owner    => 'root',
    group    => 'root',
  }
}
