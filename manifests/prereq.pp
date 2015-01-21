Package {
  ensure => 'installed',
}

if ! $::osfamily {
  case $::operatingsystem {
    'RedHat', 'Fedora', 'CentOS', 'Scientific', 'SLC', 'Ascendos', 'CloudLinux', 'PSBM', 'OracleLinux', 'OVS', 'OEL': {
      $osfamily = 'RedHat'
    }
    'ubuntu', 'debian': {
      $osfamily = 'Debian'
    }
    'SLES', 'SLED', 'OpenSuSE', 'SuSE': {
      $osfamily = 'Suse'
    }
    'Solaris', 'Nexenta': {
      $osfamily = 'Solaris'
    }
    default: {
      $osfamily = $::operatingsystem  
    }
  }
}
$perlmagick = 'perlmagick'
$perlmagick = $::osfamily ? {
  'RedHat' => 'ImageMagick-perl',
  'Suse'   => 'perl-PerlMagick',
}

$pkgs = ['imagemagick',$perlmagick,'perl']

package { $pkgs: }
