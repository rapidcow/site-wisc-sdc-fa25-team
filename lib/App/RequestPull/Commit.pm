package App::RequestPull::Commit;

use 5.016;
use strict;
use warnings;

use IPC::Open2;

BEGIN {
	require App::RequestPull;
	our @ISA = qw(App::RequestPull);
}

sub commit
{
	my $self = shift;
	my ($repo, $tree, $par1, $par2, $mesg) = @_;

	my $name = $self->{GIT_USER_NAME};
	my $email = $self->{GIT_USER_EMAIL};
	my ($time, $zone) = $self->git_time();

	my $pid = open2(my $stdout, my $stdin, 'git', -C => $repo, qw(
		hash-object -t commit -w --stdin
	));
	print $stdin <<COMMIT;
<<COMMIT
tree $tree
parent $par1
parent $par2
author $name $email $time $zone
committer $name $email $time $zone
COMMIT
	if ($self->{OPENPGP_KEY_FILE}) {
		my $sig = $self->sign($mesg);
		$sig =~ s/^/ /gm;
		print $stdin "gpgsig$sig";
	}

	print $stdin "\n";
	print $stdin $mesg;
	close $stdin;

	my $commit = <$stdout>;

	waitpid $pid, 0;
	my $ret = $? << 8;
	$ret and die "git hash-object died with code $ret\n";

	$commit;
}
