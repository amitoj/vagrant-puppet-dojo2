class composer::install {

  exec { 'install composer':
    command => 'wget -qO- https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer',
    environment => ["COMPOSER_HOME=/root"],
    require => Package['php5'],
    unless => "[ -f /usr/local/bin/composer ]"
  }

  exec { 'global composer':
    command => "sudo mv /usr/local/bin/composer.phar /usr/local/bin/composer",
    require => Exec['install composer'],
    unless => "[ -f /usr/local/bin/composer ]"
  }

}

