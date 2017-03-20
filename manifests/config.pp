# Class fluentd::config
#
define fluentd::config (
  $config
) {

  file { "${fluentd::config_path}/${title}":
    ensure  => file,
    content => fluent_config($config),
  }
}
