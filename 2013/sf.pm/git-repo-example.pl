
use Git::Repository;

my $url  = 'git://github.com/git/git.git';
my $dir  = 'git';
Git::Repository->run( clone => $url => $dir );

my $r = Git::Repository->new( $dir );

# run an arbitrary Git command
my $command   = "stash";
my @arguments = '';
my $options   = {};

$r->run( $command => @arguments, $options );
