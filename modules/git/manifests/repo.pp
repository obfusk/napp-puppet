# --                                                            ; {{{1
#
# File        : modules/git/manifests/repo.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-08-07
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

define git::repo (
  $source,
  $path     = $title,
  $branch   = undef,
  $checkout = undef, # [branch, tag_or_commit]
  $pull     = false,
  $log      = true,
) {
  if $branch == undef {
    $branch_arg = ''
  } else {
    $branch_sh  = shellquote($branch)
    $branch_arg = "-b ${branch_sh}"
  }

  $clone_args = shellquote($source, $path)

  realize Package['git']

  exec { "[git clone] ${path}":
    command   => "git clone ${branch_arg} ${clone_args}",
    creates   => "${path}/.git",
    logoutput => on_failure,
    require   => Package['git'],
  }

  if $pull == true {
    exec { "[git pull] ${path}":
      command   => 'git pull',
      cwd       => $path,
      logoutput => $log,
      require   => Exec["[git clone] ${path}"],
    }
  }

  if $checkout != undef {
    $checkout_branch = shellquote($checkout[0])
    $checkout_commit = shellquote($checkout[1])

    exec { "[git checkout] ${path}":
      command   => "git checkout -b ${checkout_branch} ${checkout_commit}",
      unless    => "test \"$( git symbolic-ref HEAD )\" = 'refs/heads/'${checkout_branch}",
      cwd       => $path,
      logoutput => $log,
      require   => Exec["[git clone] ${path}"],
    }
  }
}

# vim: set tw=0 sw=2 sts=2 et fdm=marker :
