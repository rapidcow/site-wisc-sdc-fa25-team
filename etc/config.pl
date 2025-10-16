# This is a configuration file for App::RequestPull
use strict;

{
	# Will be used to validate the request if possible.
	# A 'X-Hub-Signature-256' HTTP header MUST be present
	# if that is the case.
	GITHUB_WEBHOOK_SECRET => undef,

	# Database for things to pull.  Each line is a JSON
	# object that follows the format {"ref":REF, "oid":OID,
	# "origin":URI}.  All fields are mandatory (ref is used
	# for fetch and oid is used for integrity check.)
	REQUEST_QUEUE_FILE => '/srv/www/var/request-pull/todo.txt',

	# Path to OpenPGP secret key and passphrase; for merge
	# commits.  Commits will not be signed without KEY_FILE.
	OPENPGP_KEY_FILE => undef,
	OPENPGP_KEY_PASS => 'abcdefg',

	# Git author + committer user information
	GIT_USER_NAME => 'CGI Webhook',
	GIT_USER_EMAIL => 'cgi@rapidcow.org'
	GIT_USER_TIMEZONE => '-0000',
};
