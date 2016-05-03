#Install MariaDB

class mariadb::install {

  $password = 'vagrant'

  package { [
      'MariaDB-client',
      'MariaDB-server',
    ]:
    ensure => installed,
  }

  exec { 'Set MySQL server\'s root password':
    subscribe   => [
      Package['MariaDB-server'],
      Package['MariaDB-client'],
    ],
    refreshonly => true,
    unless      => "mysqladmin -uroot -p${password} status",
    command     => "mysqladmin -uroot password ${password}",
  }

}

