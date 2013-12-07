# Class: gcc
#
# This class installs gcc
#
# Parameters:
#
# Actions:
#   - Install the gcc package
#
# Requires:
#
# Sample Usage:
#
class gcc {
 
  include gcc::params

  each($gcc::params::gcc_package) |$package| {
    if ! defined(Package[$package])  {
      package { $package:
        ensure => installed
      }
    }
  }
}
