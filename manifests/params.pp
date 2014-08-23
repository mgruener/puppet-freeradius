class freeradius::params {
  if $::kernel != 'Linux' {
    fail("${module_name} is only supported on Linux")
  }

  # no debian support at the moment...
  case $::operatingsystem {
    /^Fedora/: {
        $package = 'freeradius'
        $service = 'radiusd.service'
        $service_provider = 'systemd'
        $config_basepath = '/etc/raddb'
      }
    /^RedHat|^CentOS/: {
        case $::operatingsystemmajrelease {
          '5','6': {
              $package = 'freeradius'
              $service = 'radiusd'
              $service_provider = 'redhat'
              $config_basepath = '/etc/raddb'
            }
          '7': {
              $package = 'freeradius'
              $service = 'radiusd.service'
              $service_provider = 'systemd'
              $config_basepath = '/etc/raddb'
            }
          default: { fail("${module_name} is not supported on ${::operatingsystem} ${::opertingsystemmajrelease}") }
        }
      }
    default: { fail("${module_name} is not supported on ${::operatingsystem}") }
  }
}
