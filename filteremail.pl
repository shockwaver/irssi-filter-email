# This script will automatically replace the @ in email address you send to the server with [@]
# so example@domain.com -> example[@]domain.com

use warnings;
use Irssi;

our $VERSION = '1.00';
our %IRSSI = (
  authors     => 'shockwaver',
  contact     => 'irssi@shockwaver.org',
  name        => 'Filter Email',
  description => 'Script to automatically replace @ in email address to prevent autokicks, '
			  .  'example@domain.com -> example[@]domain.com',
  license     => 'Public Domain',
);

Irssi::signal_add_first 'send text', 'filter_email';

sub filter_email {
    my ($text, $server, $win_item) = @_;
	# check for email address
	if ($text=~m/[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/) {
		# replace @ with [@]
		$text=~s/@/\[@\]/g;
	}
	Irssi::signal_continue($text, $server, $win_item);
}

my $help = "Filter Email - \n -- This script replaced the @ in emails you type with [@]";

Irssi::command_bind('help', sub {
	  if ($_[0] eq 'filteremail') {
		  Irssi::print($help, MSGLEVEL_CLIENTCRAP);
		  Irssi::signal_stop;
	  }
}
);