# NAME

Alien::Meson - Find or build meson build tool

# SYNOPSIS

Command line tool:

    use Alien::Meson;
    use Env qw( @PATH );

    unshift @PATH, Alien::Meson->bin_dir;
    system "@{[ Alien::Meson->exe ]}";

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

# HELPERS

## meson

    %{meson}

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
