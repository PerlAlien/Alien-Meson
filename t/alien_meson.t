use Test2::V0;
use Test::Alien;
use Test::Alien::Diag;
use Alien::Meson;

alien_diag 'Alien::Meson';
alien_ok 'Alien::Meson';

run_ok([ qw(meson.py --version) ])
  ->success
  ->out_like(qr/[0-9\.]+/);

done_testing;
