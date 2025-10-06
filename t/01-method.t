#!perl

use 5.006;
use strict;
use warnings;

use Test::More tests => 2;
use App::RequestPull::CGI;
use Capture::Tiny qw(:all);
use Socket qw(:crlf);

use FindBin;
use lib "$FindBin::Bin/lib";
use MyTest::Util;

my ($out, $err);

my %cgi_env = (
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
Content-Type: text/plain; charset="UTF-8"

Usage: POST /request-pull.cgi HTTP/1.1
HTTP

{
	local %ENV = %cgi_env;
	$ENV{REQUEST_METHOD} = 'POST';

	($out, $err) = capture {
		App::RequestPull::CGI->run;
	};
}

is($out, treol(CRLF, <<HTTP), "HTTP POST -> 200");
Status: 200 OK
Content-Type: text/plain; charset="UTF-8"

Hello from /request-pull.cgi
HTTP
