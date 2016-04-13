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

  file { $storm_conf_dir:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
  }

  file { "${storm_conf_dir}/${storm_conf_file}":
    # require => Package['storm'],
    require => File[$storm_conf_dir],
    ensure  => present,
    content => template('storm/storm.yaml.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
  }

  file { '/etc/default/storm':
    # require => Package['storm'],
    ensure  => present,
    content => template('storm/default.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
  }

  file { "${storm_home}/log4j2/worker.xml":
    # require => Package['storm'],
    require => File[$storm_home],
    ensure  => present,
    purge   => false,
    content => template('storm/worker.xml.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
  }

}
