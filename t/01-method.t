#!perl

use 5.006;
use strict;
use warnings;

use Test::More tests => 2;
use App::RequestPull::CGI;
use Capture::Tiny qw(:all);
use File::Spec;
use File::Temp;
use Socket qw(:crlf);

use FindBin;
use lib "$FindBin::Bin/lib";
use MyTest::Util;

my ($out, $err);
my ($cnf, $dbf);

my @tmp = map File::Temp->new(), 1..2;
$cnf = $tmp[0]->filename;
$dbf = $tmp[1]->filename;

{
	require Data::Dumper;
	open my $fh, '>', $cnf or die "open >temp ($cnf): $!\n";
	print $fh Data::Dumper->new([
		{ REQUEST_QUEUE_FILE => $dbf }
	])->Terse(1)->Dump and $fh->flush()
	or die "write temp ($cnf): $!\n";
	close $fh;
}

my %cgi_env = (
	REQ_PULL_CONF     => $cnf,
	# The following are stolen from CGI-4.70/t/upload.t
	# Matching sections of the CGI specs (RFC 3875) to the right:
	GATEWAY_INTERFACE => 'CGI/1.1',                # 4.1.4
	REQUEST_METHOD    => 'GET',                    # 4.1.12
	SCRIPT_NAME       => '/request-pull.cgi',      # 4.1.13
	SERVER_NAME       => 'rapidcow.org',           # 4.1.14
	SERVER_PORT       => '80',                     # 4.1.15
	SERVER_PROTOCOL   => 'HTTP/1.1',               # 4.1.16
	SERVER_SOFTWARE   => 'nginx/1.24.0 (Ubuntu)',  # 4.1.17
	# Common in fastcgi_params
	REQUEST_URI     => '/request-pull.cgi',
);

{
	local %ENV = %cgi_env;
	$ENV{REQUEST_METHOD} = 'GET';

	($out, $err) = capture {
		App::RequestPull::CGI->run;
	};
}

is($out, treol(CRLF, <<HTTP), "HTTP GET -> 405");
Status: 405 Method Not Allowed
Accept: application/json
Content-Type: text/plain; charset="UTF-8"

Usage: POST /request-pull.cgi HTTP/1.1
HTTP

{
	local $TODO = "Now it Doesn't really work without GitHub Webhook event";
{
	local %ENV = %cgi_env;
	$ENV{REQUEST_METHOD} = 'POST';

	($out, $err) = capture {
		App::RequestPull::CGI->run;
	};
}

is($out, treol(CRLF, <<HTTP), "HTTP POST -> 200");
Status: 200 OK
Accept: application/json
Content-Type: text/plain; charset="UTF-8"

Hello from /request-pull.cgi
HTTP
}
