package MyTest::Util;

use 5.006;
use strict;
use warnings;

use Socket qw(:crlf);

=head1 NAME

MyTest::Util - my test utilities!

=head1 SYNOPSIS

    use FindBin;
    use lib "$FindBin::Bin/lib";

    use Socket qw(:crlf);
    use MyTest::Util;
    treol(CRLF, "Mess\nage");

=head1 EXPORT

Everything.  This is MY package, so naturally I want to
save MY-self from some typing!

=cut

our @ISA;
our @EXPORT;

BEGIN {
	require Exporter;
	@ISA = 'Exporter';
	@EXPORT = qw(treol);
}

=head1

=head1 SUBROUTINES

=head2 treol(EOL, STR)

Translate all end-of-line sequences in B<STR> into B<EOL>,
where B<EOL> is commonly the CRLF sequence.  The only
recognized sequences are LF and CRLF since they are the
Unix and Internet standard end-of-line respectively.
(The hope is that our source files end their lines with LF.)

=cut

sub treol
{
	my ($eol, $str) = @_;
	$str =~ s/(?:\Q$CR\E)?\Q$LF\E/$eol/g;
	return $str;
}

__END__
