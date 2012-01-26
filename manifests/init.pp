class role::default {
	include apt
	include bash
	include common
	include dpkg
	include monit
	include motd
	include resolv
	include screen
	include sudo
	include vim
}

class role::extern {
	include fail2ban
	monit::service { "fail2ban": }
}

class role::server {
	include apticron
	include icinga
	if $::lsbdistcodename == "lenny" {
		monit::service { "nrpe.lenny": }
	} else {
		monit::service { "nrpe.common": }
		sudo::service { "icinga": }
	}
	include metche
}

# vim: tabstop=3
