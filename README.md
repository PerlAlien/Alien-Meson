# NAME

Alien::Meson - Find or build meson build tool

# SYNOPSIS

Command line tool:

    use Alien::Meson;
    use Env qw( @PATH );

    unshift @PATH, Alien::Meson->bin_dir;
    system "@{[ Alien::Meson->exe ]}";

Use in [alienfile](https://metacpan.org/pod/alienfile):

    share {
      requires 'Alien::Meson';
      requires 'Alien::Ninja';
      # ...
      my $build_dir = '_build';
      build [
        sub {
          my $build = shift;
          Alien::Build::CommandSequence->new([
            Alien::Meson->exe, 'setup',
              '--prefix=%{.install.prefix}',
              $build_dir,
          ])->execute($build);
        },
        [ '%{ninja}', qw(-C), $build_dir, "test" ],
        [ '%{ninja}', qw(-C), $build_dir, 'install' ],
      ];
    }

# DESCRIPTION

This distribution provides meson so that it can be used by other
Perl distributions that are on CPAN.  It does this by first trying to
detect an existing install of meson on your system.  If found it
will use that.  If it cannot be found, the source code will be downloaded
from the internet and it will be installed in a private share location
for the use of other modules.

# METHODS

## exe

    Alien::Meson->exe

Returns the command name for running meson.

## \_apply\_destdir\_prefix\_hack

    use alienfile;

    eval {
      require Alien::Meson;
      Alien::Meson->_apply_destdir_prefix_hack;
    };

    share { ... }

Applies a hack to fix how the `DESTDIR` and prefix are joined to follow the
approach that Meson takes. See issue at [https://github.com/PerlAlien/Alien-Build/issues/407](https://github.com/PerlAlien/Alien-Build/issues/407)
for more information.

**WARNING**: This is a hack. It is not expected to work long-term and if a
better solution is possible, it will be deprecated then removed.

# HELPERS

## meson

    %{meson}

**WARNING**: This interpolation is deprecated. This will be removed in a future
version as some share installs of Meson are not callable as a single executable
(they need to be prefixed with the Python interpreter). Instead use
`Alien::Meson->exe` directly.

Returns 'meson', 'meson.py', or appropriate command for
platform.

# SEE ALSO

- [Meson](https://mesonbuild.com/)

    The Meson Build system home page.

- [Alien](https://metacpan.org/pod/Alien)

    Documentation on the Alien concept itself.

- [Alien::Base](https://metacpan.org/pod/Alien%3A%3ABase)

    The base class for this Alien.

- [Alien::Build::Manual::AlienUser](https://metacpan.org/pod/Alien%3A%3ABuild%3A%3AManual%3A%3AAlienUser)

    Detailed manual for users of Alien classes.
