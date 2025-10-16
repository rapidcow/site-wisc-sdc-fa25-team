package App::RequestPull::CGI;

use 5.016;
use strict;
use warnings;

use CGI;
use Encode;
use Socket qw(:crlf);
use App::RequestPull::Submit;

# See Makefile.PL
our $VERSION = '0.25.10';

my @HTTP_TEXT = (
	-type => 'text/plain; charset="UTF-8"',
);

sub usage { sprintf "Usage: POST %s HTTP/1.1$CRLF", @_ }

sub run
{
	# An optional input file handle passed to CGI
	my $q = CGI->new(@_);
	# Read config from REQ_PULL_CONF; die if otherwise
	my $cnf = $ENV{'REQ_PULL_CONF'} or die "E: Missing REQ_CONF\n";
	my $ctx = App::RequestPull::Submit->load($cnf);

	my $prog = $q->request_uri() // $q->script_name();
	$prog or ($prog) = ($0 =~ m![^/\\]+\z!g);
	$prog or $prog = '/request-pull.cgi';

	my $method = $q->request_method();
	defined $method or die "E: Missing REQUEST_METHOD\n";

	unless ($method eq 'POST') {
		print $q->header(
			@HTTP_TEXT,
			-status => '405 Method Not Allowed',
		);
		print usage($prog);
		return;
	}

	my $mimetype = $q->content_type();
	unless ($mimetype eq 'application/x-www-form-urlencoded') {
		print $q->header(
			@HTTP_TEXT,
			-status => '415 Unsupported Media Type',
		);
		print "Please use application/x-www-form-urlencoded$CRLF";
		return;
	}

	print $q->header(
		@HTTP_TEXT,
		-status => '202 Accepted',
	);
	print "Didn't read a single word$CRLF";
	print "Thank you for your submission anyways!$CRLF";
	return;
}

1;

__END__

=pod

=head1 NAME

App::RequestPull::CGI - /cgi-bin/request-pull.cgi implementation

=head1 SYNOPSIS

    use App::RequestPull::CGI;

    App::RequestPull::CGI->run;

    # explicitly...
    App::RequestPull::CGI->run(\*STDIN);

=head1 DESCRIPTION

This module defines one subroutine, C<run>, which executes
the CGI script.  It accepts the same arguments as C<CGI->new>;
namely, you can pass a file handle for the HTTP request body.

=head1 SEE ALSO

L<CGI>

=cut
