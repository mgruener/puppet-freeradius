class freeradius (
  $ensure             = running,
  $enable             = true,
  $package            = $::freeradius::params::package,
  $service            = $::freeradius::params::service,
  $service_provider   = $::freeradius::params::service_provider,
) inherits freeradius::params {
  package { $package: }

  service { $service:
    ensure   => $ensure,
    enable   => $enable,
    provider => $service_provider,
    require  => Package[$package],
  }

  include freeradius::configuration
}
