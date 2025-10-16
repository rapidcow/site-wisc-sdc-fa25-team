#!perl

use 5.006;
use strict;
use warnings;

use Test::More tests => 1;
use App::RequestPull::CGI;
use File::Spec;
use File::Temp;
use Socket qw(:crlf);

use FindBin;
use lib "$FindBin::Bin/lib";
use MyTest::Util;

my ($out, $cnf, $dbf);

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
	$ENV{REQUEST_METHOD} = 'POST';
	$ENV{CONTENT_TYPE} = 'application/json';
	$ENV{CONTENT_LENGTH} = 1593;
	$ENV{HTTP_X_GITHUB_EVENT} = 'push';
	# Hashed with -secret "s3cret123"
	$ENV{HTTP_X_HUB_SIGNATURE_256} = 'sha256=a560d2212e16862a38ca60bd057b68fa41c23aea23d508aae10c6cdd1a7d667e';

	{
		local (*STDIN, *STDOUT);

		# In-memory buffer shouldn't fail...
		open STDIN, '<', \<<'JSON' or die "open <SCALAR failed: $!\n";
{
  "ref": "refs/heads/MY",
  "before": "0000000000000000000000000000000000000000",
  "after": "06ad86554c898f467dc24a835026b2e758ae9234",
  "repository": {
    "name": "site-wisc-sdc-fa25-team",
    "full_name": "eyzmeng/site-wisc-sdc-fa25-team",
    "html_url": "https://github.com/eyzmeng/site-wisc-sdc-fa25-team",
    "created_at": 1759597805,
    "updated_at": "2025-10-16T02:51:05Z",
    "pushed_at": 1760595477,
    "default_branch": "OUR",
    "stargazers": 0,
    "master_branch": "OUR"
  },
  "pusher": {
    "name": "eyzmeng",
    "email": "ethan@rapidcow.org"
  },
  "sender": {
    "login": "eyzmeng",
    "type": "User"
  },
  "created": true,
  "deleted": false,
  "forced": false,
  "base_ref": "refs/heads/OUR",
  "compare": "https://github.com/eyzmeng/site-wisc-sdc-fa25-team/compare/MY",
  "commits": [

  ],
  "head_commit": {
    "id": "06ad86554c898f467dc24a835026b2e758ae9234",
    "tree_id": "3ff0fc053b5aa6bd10ae05fdf234d92f99afe966",
    "distinct": true,
    "message": "the parentheticals are unnecessary\n\nfor some reason my sentences today are short???? :o wot (impossible)",
    "timestamp": "2025-10-15T21:50:20-05:00",
    "url": "https://github.com/eyzmeng/site-wisc-sdc-fa25-team/commit/06ad86554c898f467dc24a835026b2e758ae9234",
    "author": {
      "name": "Ethan Meng",
      "email": "uwisc@endfind.me",
      "username": "eyzmeng"
    },
    "committer": {
      "name": "Ethan Meng",
      "email": "uwisc@endfind.me",
      "username": "eyzmeng"
    },
    "added": [

    ],
    "removed": [

    ],
    "modified": [
      "README.md"
    ]
  }
}
JSON
		open STDOUT, '>', \$out or die "open >SCALAR failed: $!\n";
		App::RequestPull::CGI->run;
	};

	print $out, "\n";
	ok 1;
}
