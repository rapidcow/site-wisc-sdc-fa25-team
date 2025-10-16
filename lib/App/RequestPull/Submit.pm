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
	my $time = time;
	my $conn = $self->{REQUEST_QUEUE_FILE};
	# Sort the output, so that we can reasonaly unit-test this :)
	my $json = JSON::XS->new->canonical;
	open my $fh, '+>', $conn or die "open $conn: $!\n";

	print $fh $time;
	print $fh " ";
	print $fh $json->encode(\%job) and $fh->flush()
		or die "write $conn: $!\n";
	print $fh "\n";
	close $fh;
}

sub check_payload
{
	my $self = shift;
	# Skip this check if the secret is unknown
	$self->{GITHUB_WEBHOOK_SECRET} or return 1;

	# But if we have secret, then in this case
	# we MUST have X-Hub-Signature-256.
	my $hdr256 = $ENV{HTTP_X_HUB_SIGNATURE_256};
	# SHA-256 is 256 = 2^8 bits, or 64 = 2^6 nybbles...
	$hdr256 and $hdr256 =~ /^sha256=([0-9a-f]{64})$/i or return 0;
	my $sig256 = $1;

	require Digest::SHA;  # SHAW???
	require String::Compare::ConstantTime;
	my $payload = shift;
	my $secret = $self->{GITHUB_WEBHOOK_SECRET};

	my $got256 = Digest::SHA::hmac_sha256_hex($payload, $secret);
	String::Compare::ConstantTime::equals($sig256, $got256);
}

1;

__END__

=pod

=head1 NAME

App::RequestPull::Submit - CGI webhook implementation

=head1 SEE ALSO

L<App::RequestPull>, L<App::RequestPull::Commit>

=cut
