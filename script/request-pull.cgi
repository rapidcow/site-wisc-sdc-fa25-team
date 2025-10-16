#!perl

use 5.016;
use strict;
use warnings;

use App::RequestPull::CGI;
use Socket qw(:crlf);

eval { App::RequestPull::CGI->run };
if (my $mesg = $@) {
	require UUID;
	require POSIX;
	# Assume are in "production"; do not reveal
	# more than what's necessary
	my $uuid = UUID::uuid7();
	UUID::parse($uuid, my $buid);
	my $time = int UUID::time($buid);
	POSIX::setlocale(&POSIX::LC_TIME, "C");
	my $date = POSIX::strftime("%c", gmtime($time));
	print map { "${_}$CRLF" } (
		  "Status: 500 Internal Server Error"
		, 'Content-Type: text/plain; charset="UTF-8"'
		, ""
		, "Something went wrong on my end, sorry."
		, "This incidence will be logged."
		, ""
		, "date=@{[ $date ]} uuid=@{[ $uuid ]}"
	);
	chomp $mesg;
	print STDERR "date=@{[ $time ]} uuid=@{[ $uuid ]} $mesg\n";
}

__END__

=head1 NAME

request-pull - the actual /cgi-bin/request-pull.cgi

=cut
