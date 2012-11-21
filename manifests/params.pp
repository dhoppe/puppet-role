class role::params {
  case $::lsbdistcodename {
    'squeeze', 'natty': {
    }
    default: {
      fail("Module ${module_name} does not support ${::lsbdistcodename}")
    }
  }
}
