# Source: https://launchpad.net/~james-page/+archive/ubuntu/junk
#
class undine_memcached::package {

  undine_apt::ppa { 'james-page/memcached':
    ppa_user => 'james-page',
    ppa_name => 'junk',
    source_list_d_filename => 'memcached-ppa-precise.list',
    source_list_d_source => 'puppet:///modules/undine_memcached/memcached-ppa-precise.list',
  }

  package { 'memcached':
    require => Undine_apt::Ppa['james-page/memcached'],
    ensure => installed,
  }

  package { "php53-memcache":
    require => Undine_apt::Ppa['aoe/php'],
    ensure => installed,
    notify => [ Service['apache2'], ],
  }

}
