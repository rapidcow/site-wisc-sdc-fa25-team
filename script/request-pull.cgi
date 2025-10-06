#!perl

use 5.016;
use strict;
use warnings;

use App::RequestPull::CGI;
use Socket qw(:crlf);

eval { App::RequestPull::CGI->run(\*STDIN) };
if ($@) {
	require UUID;
	UUID::uuid7
	# Assume are in "production"; do not reveal
	# more than what's necessary
	print map { "${_}CRLF" }, (
		, "Status: 500 Internal Server Error"
		, 'Content-Type: text/plain; charset="UTF-8"'
		, ""
		, "Something went wrong on my end, sorry."
		, "This incidence will be logged."
		, ""
		, "date="
	);
}

__END__

=head1 NAME

request-pull - the actual /cgi-bin/request-pull.cgi

=cut
