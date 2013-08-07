# --                                                            ; {{{1
#
# File        : modules/python/manifests/venv.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-08-07
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

define python::venv (
  $path = $title,
  $bin  = undef,
  $pull = false,
) {
  include python

  git::repo { $path:
    source  => 'https://github.com/obfusk/venv.git',
    pull    => $pull,
  }

  if $bin != undef {
    mkdir_p::dirname { $bin: }

    file { $bin:
      ensure  => link,
      target  => "{$path}/venv",
      require => Exec["[mkdir_p::dirname] ${bin}"],
    }
  }
}

# vim: set tw=0 sw=2 sts=2 et fdm=marker :
