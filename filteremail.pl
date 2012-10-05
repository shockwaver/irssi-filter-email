use strict;
use warnings;

# This is a common method of declaring package scoped variables before the
# 'our' keyword was introduced.  You should pick one form or the other, but
# generally speaking, the our $var is preferred in new code.

use Irssi;

our $VERSION = '1.00';
our %IRSSI = (
  authors     => 'Chris Taylor',
  contact     => 'irssi@shockwaver.org',
  name        => 'Filter Email',
  description => 'Script to automatically replace @ in email address to prevent autokicks, '
			  .  'example@domain.com -> example[@]domain.com',
  license     => 'Public Domain',
);