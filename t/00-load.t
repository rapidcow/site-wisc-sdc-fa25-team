#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
	use_ok( 'App::RequestPull::CGI' ) || print "Bail out!\n";
}

diag( "Testing App::RequestPull::CGI $App::RequestPull::CGI::VERSION, Perl $], $^X" );
