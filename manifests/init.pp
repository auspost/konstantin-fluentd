# Class fluentd
# install, configures and manages the fluentd (td-agent) service.
#
class fluentd (
  $package_name           = $::fluentd::params::package_name,
  $package_ensure         = $::fluentd::params::package_ensure,
  $service_name           = $::fluentd::params::service_name,
  $service_ensure         = $::fluentd::params::service_ensure,
  $service_enable         = $::fluentd::params::service_enable,
  $service_provider       = $::fluentd::params::service_provider,
  $config_file            = $::fluentd::params::config_file,
  $config_path            = $::fluentd::params::config_path,
  $config_owner           = $::fluentd::params::config_owner,
  $config_group           = $::fluentd::params::config_group,
  $configs                = $::fluentd::params::configs,
  $plugins                = $::fluentd::params::plugins,
  $plugin_ensure          = $::fluentd::params::plugin_ensure,
  $plugin_source          = $::fluentd::params::plugin_source,
  $plugin_install_options = $::fluentd::params::plugin_install_options,
  $plugin_provider        = $::fluentd::params::plugin_provider,
) inherits fluentd::params {

  contain fluentd::install
  contain fluentd::service

  Class['Fluentd::Install'] ~> Class['Fluentd::Service']
  Class['Fluentd::Install'] -> Fluentd::Config <| |>
  Class['Fluentd::Install'] -> Fluentd::Plugin <| |>
  Fluentd::Config <| |> ~> Class['Fluentd::Service']
  Fluentd::Plugin <| |> ~> Class['Fluentd::Service']

  create_resources('fluentd::plugin', $plugins)
  create_resources('fluentd::config', $configs)
}
