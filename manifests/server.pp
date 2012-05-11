class role::server {
  include apticron

  include icinga
  if $::lsbdistcodename == 'lenny' {
    monit::service { 'nrpe-lenny': }
  } else {
    monit::service { 'nrpe-common': }
    sudo::service { 'icinga': }
  }

  include metche

  include ntp
  icinga::service::services { 'ntp':
    command => 'check_ntp_time',
  }
  monit::service { 'ntp': }

  include postfix
  icinga::service::services { 'mailq':
    command => 'nrpe_check_mailq!5!10',
    group   => 'mailq',
  }
  monit::service { 'postfix': }

  include puppet
  icinga::service::services { 'puppet':
    command => 'nrpe_check_puppet!2700!3600',
  }
  monit::service { 'puppet-agent': }

  include rsyslog
  monit::service { 'rsyslog': }

  include ssh
  icinga::service::services { 'ssh':
    command => 'check_ssh',
  }
  monit::service { 'ssh': }
}