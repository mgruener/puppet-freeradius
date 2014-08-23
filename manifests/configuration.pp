class freeradius::configuration (
  $config_basepath = $::freeradius::params::config_basepath,
  $config_owner = $::freeradius::params::config_owner,
  $config_group = $::freeradius::params::config_group,
) {
  concat { 'radius_clients_conf':
    ensure         => present,
    path           => "${config_basepath}/clients.conf",
    mode           => '0650',
    owner          => $config_owner,
    group          => $config_group,
    warn           => true,
    force          => true,
    ensure_newline => true,
  }
}
