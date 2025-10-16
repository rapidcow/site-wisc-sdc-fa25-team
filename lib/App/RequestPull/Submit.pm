package App::RequestPull::Submit;

use 5.016;
use JSON::XS;

BEGIN {
	require App::RequestPull;
	our @ISA = qw(App::RequestPull);
}

sub submit
{
	my $self = shift;
	my %job = @_;
	my $conn = $self->{REQUEST_QUEUE_FILE};
	open my $fh, '>+', $conn or die "open $conn: $!\n";
	print $fh encode_json(\%job) && $fh->flush()
		or die "write $conn: $!\n";
	close $fh;
}

1;

__END__

=pod

=head1 NAME

App::RequestPull::Submit - CGI webhook implementation

=head1 SEE ALSO

L<App::RequestPull>, L<App::RequestPull::Commit>

=cut
