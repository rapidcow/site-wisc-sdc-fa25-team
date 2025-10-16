#!perl
# cpanfile - list of CPAN module dependencies,
# Format as specified in:
# https://metacpan.org/dist/Module-CPANfile/view/lib/cpanfile.pod

# Only needed for signing commits (but it counts as required for ME!)
requires 'Crypt::GpgME';
requires 'CGI';
requires 'JSON::XS';
requires 'String::Compare::ConstantTime';
requires 'UUID';

feature 'hacker', "Development deps" => sub {
	# These are all core...?
	requires 'File::Find';
	requires 'File::Spec';  # since 5.00405
	requires 'IPC::Open3';
	requires 'Test::CheckManifest', '>= 0.9';
}
