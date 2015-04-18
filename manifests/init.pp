class dnsmasq
(
  $confs        = {},
  $tag          = 'dnsmasq-host',
  $storeconfigs = true,
) {
  include dnsmasq::params

  anchor { 'dnsmasq::start': }

  class { 'dnsmasq::install':
    require => Anchor['dnsmasq::start'],
  }

  class { 'dnsmasq::service':
    subscribe => [
      Class['dnsmasq::install'],
      Class['dnsmasq::config'],
    },
  }

  anchor { 'dnsmasq::end':
    require => Class['dnsmasq::service'],
  }

  create_resources( dnsmasq::conf, $confs )

  if $storeconfigs {
    Dnsmasq::Conf <<| tag == $tag |>>
  }
}
