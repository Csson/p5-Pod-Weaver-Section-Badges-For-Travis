use strict;
use warnings;

use Test::More;
use Test::Differences;
use Path::Tiny;
use Dist::Zilla::Tester;

use if $ENV{'AUTHOR_TESTING'}, 'Test::Warnings';

BEGIN {
	use_ok 'Pod::Weaver::Section::Badges::For::Travis';
}

use lib path('t/corpus//lib')->absolute->stringify;

my $zilla = Dist::Zilla::Tester->from_config({ dist_root => 't/corpus' });
$zilla->build;

unified_diff;
eq_or_diff path($zilla->tempdir->subdir('build'))->child(qw/lib TesterFor Badges.pm/)->slurp_utf8, expected(), 'Section added to pod';

done_testing;

sub expected {
    return qq{package TesterFor::Badges;

# ABSTRACT: ...

1;

__END__

=pod

=head1 BUILD

=begin HTML

<p><a href="https://travis-ci.org/Csson/p5-Pod-Weaver-Section-Badges"><img src="https://api.travis-ci.org/Csson/p5-Pod-Weaver-Section-Badges.svg?branch=master" /></a></p>

=end HTML

=cut
};
}


