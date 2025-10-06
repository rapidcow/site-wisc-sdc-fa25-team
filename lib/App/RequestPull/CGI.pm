package App::RequestPull::CGI;

use 5.016;
use strict;
use warnings;

use CGI;
use Encode;
use Socket qw(:crlf);

# See Makefile.PL
our $VERSION = '0.25.10';

my @HTTP_TEXT = (
	-type => 'text/plain; charset="UTF-8"',
);

sub usage { sprintf "Usage: POST %s HTTP/1.1$CRLF", @_ }

sub run
{
	my $q = CGI->new();

	my $prog = $q->request_uri() // $q->script_name();
	$prog or ($prog) = ($0 =~ m![^/\\]+\z!g);
	$prog or $prog = '/request-pull.cgi';

	my $method = $q->request_method();
	defined $method or die "E: Missing REQUEST_METHOD\n";

	if ($method ne 'POST') {
		print $q->header(
			@HTTP_TEXT,
			-status => '405 Method Not Allowed',
		);
		print usage($prog);
		return;
	}

	print $q->header(
		@HTTP_TEXT,
		-status => '200 OK',
	);
	print "Hello from $prog$CRLF";
}

1;

__END__

=pod

=head1 NAME

App::RequestPull::CGI - /cgi-bin/request-pull.cgi implementation

=head1 SYNOPSIS

    use App::RequestPull::CGI;

    App::RequestPull::CGI->run;

=head1 DESCRIPTION

This module defines one subroutine, C<run>, which executes
the CGI script.

=cut
