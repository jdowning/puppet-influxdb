define input_plugin($enabled = true) {
  $plugin = $title
  ini_setting { "${plugin}_enabled":
    section => "input_plugins.${plugin}",
    setting => 'enabled',
    value   => $enabled
  }
}
