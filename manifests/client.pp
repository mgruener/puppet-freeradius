define freeradius::client (
  $secret,
  $hostname = $title,
  $nas_type = 'other',
  $require_message_authenticator = 'no',
  $proto = undef,
  $netmask = undef,
  $ipaddr = undef,
  $ipv6addr = undef,
  $shortname = undef,
  $login = undef,
  $password = undef,
  $virtual_server = undef,
  $coa_server = undef,
  $limits = undef,
) {
  concat::fragment { "radius_client-${title}":
    target  => 'radius_clients_conf',
    content => template("${module_name}/client.erb"),
  }
}
