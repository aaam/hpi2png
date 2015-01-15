Package {
  ensure => 'installed',
}

$pkgs = ['perlmagick','imagemagick','perl']

package { $pkgs: }

