#!perl
# cpanfile - list of CPAN module dependencies,
# Format as specified in:
# https://metacpan.org/dist/Module-CPANfile/view/lib/cpanfile.pod

requires 'Capture::Tiny';
requires 'CGI';
requires 'JSON::XS';

feature 'hacker', "Development deps" => sub {
	# These are all core...?
	requires 'File::Find';
	requires 'File::Spec';  # since 5.00405
	requires 'IPC::Open3';
	requires 'Test::CheckManifest', '>= 0.9';
}
