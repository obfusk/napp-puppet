# --                                                            ; {{{1
#
# File        : modules/lein/manifests/init.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-08-07
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

define lein (
  $path     = $title,
  $version  = '2.2.0',
  $sha512   = '9a9272f8203d6416e223ac0c2a7a7965d24d0e226c50c7a4a6e5e45b1b22459717ca4366faeeec9550b51377cb1f0038ff5944befe8e23f792975fae864ee2d9',
  $url      = 'https://raw.github.com/technomancy/leiningen/__VERSION__/bin/lein',
) {
  $args = shellquote($path, $version, $sha512, $url)

  package { 'curl': ensure => 'installed' }

  exec { "[leiningen] ${path}":
    command   => "pp-install-leiningen ${args}",
    unless    => "grep -F 'export LEIN_VERSION=\"${version}\"' ${path}",
    logoutput => true,
    require   => Package['curl'],
  }

  file { $path:
    mode    => '+x',
    require => Exec["[leiningen] ${path}"],
  }
}

# vim: set tw=0 sw=2 sts=2 et fdm=marker :
