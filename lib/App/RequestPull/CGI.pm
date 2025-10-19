package App::RequestPull::CGI;

use 5.016;
use strict;
use warnings;

use Scalar::Util qw(blessed);
use CGI;
use Encode;
use JSON::XS;
use Socket qw(:crlf);
use App::RequestPull::Submit;

# See Makefile.PL
our $VERSION = '0.25.10';

my @HTTP_TEXT = (
	-type => 'text/plain; charset="UTF-8"',
);
my @HTTP_ACCEPT = (
	-accept => 'application/json',
);

sub usage { sprintf "Usage: POST %s HTTP/1.1$CRLF", @_ }

sub answer
{
	my ($q, $status, $mesg) = @_;
	print $q->header(
		@HTTP_TEXT, @HTTP_ACCEPT,
		-status => $status,
	);
	print $mesg;
}

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
		return answer($q, '405 Method Not Allowed',
			usage($prog));
	}

	# We are technically supposed to treat the absence of
	# a Content-Type header as application/octet-stream,
	# but... since I'm feeling nice, and I don't want to
	# make my own debugging life hell, pretend it is the
	# type we want :)  Hopefully Nginx will be smart enough
	# to set it to application/octet-stream for misbehaving
	# user agents...
	my $mimetype = $q->content_type() // 'application/json';
	unless ($mimetype eq 'application/json') {
		return answer($q, '415 Unsupported Media Type',
			"Please use application/json$CRLF");
	}

	my $event = $ENV{'HTTP_X_GITHUB_EVENT'};
	unless (defined $event) {
		return answer($q, '400 Bad Request',
			"Missing X-GitHub-Event$CRLF");
	}

	$event eq 'ping' and return answer($q,
		'202 Accepted' => "Ping!$CRLF"
	);
	$event eq 'push' or return answer($q,
		'202 Accepted' => "Thanks, but I won't be handling $event :)$CRLF"
	);

	# Validate payload, since it can be dangerous...
	my $payload = $q->param('POSTDATA');
	unless ($ctx->check_payload($payload)) {
		return answer($q, '403 Forbidden', '');
	}
	# JSON isn't very type-strict, and under strict ref we
	# may explode with a runtime error if we are not careful.
	# So throw these two bad actors out -- all at once...
	my $json = eval { decode_json($payload) };
	if ($@ || ref($json) ne 'HASH') {
		return answer($q, '400 Bad Request',
			"Invalid JSON${CRLF}");
	}
	# Don't want to show this even for debugging....
	delete $json->{hook}->{config}->{secret};

	# XXX: Not a real handler, but I'm curious to see what happens
	$ctx->submit(%$json);

	my $payback = encode_json $json;
	return answer($q, '202 Accepted', '');
}

1;

__END__

=pod

=head1 NAME

App::RequestPull::CGI - /cgi-bin/request-pull.cgi implementation

=head1 SYNOPSIS

    use App::RequestPull::CGI;

    App::RequestPull::CGI::run;

    # explicitly...
    App::RequestPull::CGI::run(\*STDIN);

=head1 DESCRIPTION

This module defines one subroutine, C<run>, which executes
the CGI script.  It accepts the same arguments as C<CGI->new>;
namely, you can pass a file handle for the HTTP request body.

Note that C<run> is not a method but a regular subroutine.
Do not use the arrow operator to pass the __PACKAGE__, or
you will be very sorry like I was.

=head1 SEE ALSO

L<CGI>

=cut
