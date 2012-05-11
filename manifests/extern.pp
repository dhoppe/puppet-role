class role::extern {
  include fail2ban
  monit::service { 'fail2ban': }
}