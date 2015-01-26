# manage the values of a certain config section.
# this is just a wrapper to shuffle data around
define influxdb::config_section_values(
  $values,
) {
  if $name =~ /@/ and !($name =~ /^default@/) {
    $tmp = split($name,'@')
    $section = $tmp[0]
    $setting = $tmp[1]
  } else {
    $section = ''
    if $name =~ /^default@/ {
      $tmp = split($name,'@')
      $setting = $tmp[1]
    } else {
      $setting = $name
    }
  }
  influxdb::config_value{
    $name:
      section => $section,
      setting => $setting,
      value   => $values[$setting]
  }
}
