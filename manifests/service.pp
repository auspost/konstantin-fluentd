# Class fluentd::service
# manages the fluentd service
#
class fluentd::service {

  service { $fluentd::service_name:
    ensure     => $fluentd::service_ensure,
    enable     => $fluentd::service_enable,
    provider   => $fluentd::service_provider,
    hasstatus  => true,
    hasrestart => true,
  }
}
