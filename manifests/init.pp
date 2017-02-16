# Class fluentd install, configures and manages the fluentd (td-agent)
# service.
#
class fluentd {
  contain fluentd::params
  contain fluentd::install
  contain fluentd::service

  Class['Fluentd::Params']      -> Class['Fluentd::Install']
  Class['Fluentd::Install']     -> Class['Fluentd::Service']

  create_resources('fluentd::plugin', $fluentd::params::plugins)
  create_resources('fluentd::config', $fluentd::params::configs)
}
