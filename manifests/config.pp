# Class: storm::config
#
# This module manages the storm configuration directories
#
# Parameters: None
#
# Actions: None
#
# Requires: storm::install, storm
#
# Sample Usage: include storm::config
#
class storm::config inherits storm {
  require storm::install

  file { '/etc/storm':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
  }

  file { '/etc/storm/storm.yaml':
    # require => Package['storm'],
    content => template('storm/storm.yaml.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
  }

  file { '/etc/default/storm':
    # require => Package['storm'],
    content => template('storm/default.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
  }

}

