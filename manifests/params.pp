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
      }
    /^RedHat|^CentOS/: {
        case $::operatingsystemmajrelease {
          '5','6': {
              $package = 'freeradius'
              $service = 'radiusd'
              $service_provider = 'redhat'
            }
          '7': {
              $package = 'freeradius'
              $service = 'radiusd.service'
              $service_provider = 'systemd'
            }
          default: { fail("${module_name} is not supported on ${::operatingsystem} ${::opertingsystemmajrelease}") }
        }
      }
    default: { fail("${module_name} is not supported on ${::operatingsystem}") }
  }
}
