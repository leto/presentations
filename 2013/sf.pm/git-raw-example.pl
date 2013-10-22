use Git::Raw;

my $url  = 'git://github.com/git/git.git';
my $repo = Git::Raw::Repository->clone($url,
            'git', { bare => 0 });
# print all the tags of the repository
for my $tag (@{ $repo -> tags }) {
    say $tag -> name;
}
