package App::RequestPull;

use 5.016;
use strict;
use warnings;

sub load
{
	my $class = shift;
	my $cnf = shift;
	my $hash;
	unless ($hash = do $cnf) {
		die "load: couldn't parse config file $cnf: $@" if $@;
		die "load: couldn't parse config file $cnf: $!\n" unless defined $hash;
	}
	if (ref($hash) ne 'HASH') {
		die "load: config file did not return a hash ref\n";
	}

	# Validation
	unless ($hash->{REQUEST_QUEUE_FILE}) {
		die "load: missing REQUEST_QUEUE_FILE\n";
	}

	# Default stuff
	{
		my $zone = $hash->{GIT_USER_TIMEZONE} ||= '-0000';
		if ($zone !~ /([-+])([0-9][0-9])([0-9][0-9])/) {
			die "load: invalid GIT_USER_TIMEZONE: $zone\n";
		}
		$hash->{GIT_USER_TIMEZONE} = $zone;
	}

	bless $hash, $class;
}

sub git_time
{
	time, shift->{GIT_USER_TIMEZONE};
}

1;

__END__

=pod

=head1 NAME

App::RequestPull - base class of the request-pull model

=head1 SEE ALSO

L<App::RequestPull::Commit>, L<App::RequestPull::Submit>

=cut
