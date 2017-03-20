# Define fluentd::plugin
# installs a fluentd 3rd party plugin
#
define fluentd::plugin (
  $plugin_ensure          = $fluentd::plugin_ensure,
  $plugin_source          = $fluentd::plugin_source,
  $plugin_install_options = $fluentd::plugin_install_options,
  $plugin_provider        = $fluentd::plugin_provider,
){

  package { $title:
    ensure          => $plugin_ensure,
    source          => $plugin_source,
    install_options => $plugin_install_options,
    provider        => $plugin_provider,
  }
}
