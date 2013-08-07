# --                                                            ; {{{1
#
# File        : modules/nodejs/manifests/init.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-08-07
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

define nodejs (
  $path       = $title,
  $bin        = undef,
  $npm        = undef,
  $version    = '0.10.15',
  $sha512_x64 = 'd845a678d57daf38b96e3cbcb824157f3feda5d05c16d9de8314d3e4aa9d4c3bc73deeae568c5e665430a6806bc5b78341a46ba6efda03a3b925f0726edf78f2',
  $sha512_x86 = '39c6b425f37b4e3d1bf31dace4b797f33646bd66034d004426515ce7fe04e74c166679fd877cf2ba3a3bebc50de54bd1a2fb06c5cb9798366649eacb3da0eeb8',
  $url        = 'http://nodejs.org/dist/v__VERSION__/node-v__VERSION__-linux-__ARCH__.tar.gz',
) {
  $arch = $architecture ? { 'i386' => 'x86', 'amd64' => 'x64', default => undef }
  if $arch == undef { fail("unknown architecture: ${architecture}") }

  $sha512 = $arch ? { 'x86' => $sha512_x86, default => $sha512_x64 }
  $args   = shellquote($path, $version, $arch, $sha512, $url)

  realize Package['curl']

  exec { "[nodejs] ${path}":
    command   => "pp-install-nodejs ${args}",
    unless    => "head -n1 ${path}/ChangeLog | grep -F 'Version ${version} '",
    logoutput => true,
    require   => Package['curl'],
  }

  if $bin != undef {
    mkdir_p::dirname { $bin: }

    file { $bin:
      ensure  => link,
      target  => "${path}/bin/node",
      require => Exec["[mkdir_p::dirname] ${bin}"],
    }
  }

  if $npm != undef {
    mkdir_p::dirname { $npm: }

    file { $npm:
      ensure  => link,
      target  => "${path}/bin/npm",
      require => Exec["[mkdir_p::dirname] ${npm}"],
    }
  }
}

# vim: set tw=0 sw=2 sts=2 et fdm=marker :
