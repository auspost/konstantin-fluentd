class fluentd::service {

  service { $fluentd::params::service:
    ensure    => $fluentd::params::service_ensure,
    enable    => $fluentd::params::service_enable,
    provider  => $fluentd::params::service_provider,
    require   => Class['Fluentd::Install'],
    hasstatus  => true,
    hasrestart => true,
  }
}
