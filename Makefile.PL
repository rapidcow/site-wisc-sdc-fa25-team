use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME             => 'App::RequestPull',
	VERSION          => '0.25.10',
	AUTHOR           => 'Ethan Meng <devel@rapidcow.org>',
	ABSTRACT         => '/cgi-bin/request-pull.cgi implementation',
	LICENSE          => 'artistic_2',
	MIN_PERL_VERSION => '5.020',
	CONFIGURE_REQUIRES => {
		# Note: >=6.64 is recommended
		'ExtUtils::MakeMaker' => '0',
	},
	TEST_REQUIRES => {
		'Test::More' => '0',
	},
	PREREQ_PM => {
		'CGI'      => '0',
		'String::Compare::ConstantTime' => '0',
		'JSON::XS' => '0',

		# Encode is core since v5.7.3
		'Encode'   => '0',
	},
	EXE_FILES => [ qw( script/request-pull.cgi ) ],
	dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
	clean => { FILES => 'App-RequestPull-CGI-*' },
);
