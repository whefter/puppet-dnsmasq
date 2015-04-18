class dnsmasq::install {
  package { $::dnsmasq::params::package_name:
    ensure => 'installed',
  }

  file { $::dnsmasq::params::config_dir:
    ensure => 'directory',
  }
  
  file { $::dnsmasq::params::config_file:
    ensure => file,
    mode   => '0644',
#    source => 'puppet:///modules/dnsmasq/dnsmasq.conf',
  }
}
