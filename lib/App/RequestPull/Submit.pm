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

sub check_payload
{
	my $self = shift;
	# Skip this check if the secret is unknown
	$self->{GITHUB_WEBHOOK_SECRET} or return 1;

	# But if we have secret, then in this case
	# we MUST have X-Hub-Signature-256.
	my $sig256 = $ENV{HTTP_X_HUB_SIGNATURE_256};
	$sig256 or return 0;

	require Digest::SHA;  # SHAW???
	my $payload = shift;
	my $secret = $self->{GITHUB_WEBHOOK_SECRET};

	my $got256 = Digest::SHA::hmac_sha256_hex($payload, $secret);
	$sig256 eq $got256;
}

1;

__END__

=pod

=head1 NAME

App::RequestPull::Submit - CGI webhook implementation

=head1 SEE ALSO

L<App::RequestPull>, L<App::RequestPull::Commit>

=cut
