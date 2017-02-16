define fluentd::plugin{
  package { $title:
    ensure          => $fluentd::params::plugin_ensure,
    source          => $fluentd::params::plugin_source,
    install_options => $fluentd::params::plugin_install_options,
    provider        => $fluentd::params::plugin_provider,
    notify          => Class['Fluentd::Service'],
    require         => Class['Fluentd::Install'],
  }
}
