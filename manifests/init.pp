class role inherits role::params {
  include apt
  include bash
  include common
  include dpkg
  include grub
  include hosts
  include monit
  include motd
  include resolv
  include screen
  include sudo
  include vim
}
