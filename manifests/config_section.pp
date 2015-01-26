# manage the different config sections
# this is just a wrapper to shuffle data around
define influxdb::config_section(
  $values,
){
  $names = prefix(keys($values[$name]),"${name}@")
  influxdb::config_section_values{
    $names:
      values => $values[$name]
  }
}
