# --                                                            ; {{{1
#
# File        : modules/git/manifests/repo.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-08-06
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

define git::repo (
  $source,              # repo
  $path     = $title,   # path
  $branch   = undef,    # branch to clone
  $checkout = undef,    # [branch, tag/commit] to checkout
  $pull     = false,    # true => pull
  $log      = true,     # log output for pull/checkout
) {
  if $branch == undef {
    $branch_opt = ''
  } else {
    $branch_opt = "-b $branch"
  }

  $clone_args = shellquote($branch_opt, $source, $path)

  exec { "git clone => $path":
    command   => "git clone $clone",
    creates   => "$path/.git",
    logoutput => on_failure,
  }

  if $pull == true {
    exec { "git pull => $path":
      command   => 'git pull',
      cwd       => $path,
      logoutput => $log,
      require   => "git clone => $path",
    }
  }

  if $checkout == true {
    $checkout_branch = shellquote($checkout[0])
    $checkout_commit = shellquote($checkout[1])

    exec { "git checkout => $path":
      command   => "git checkout -b $checkout_branch $checkout_commit"
      unless    => "test \"$( git symbolic-ref HEAD )\" == 'refs/heads/'$checkout_branch"
      cwd       => $path,
      logoutput => $log,
      require   => "git clone => $path",
    }
  }
}

# vim: set tw=0 sw=2 sts=2 et fdm=marker :
