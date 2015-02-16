use 5.14.0;
use strict;
use warnings;
use Moops;

# PODCLASSNAME

class Pod::Weaver::Section::Badges::For::Travis using Moose with Pod::Weaver::Section::Badges::Badge {

    # VERSION
    # ABSTRACT: Insert travis badge in your pod

    has user => (
        is => 'ro',
        isa => Str,
        required => 1,
    );
    has repo => (
        is => 'ro',
        isa => Str,
        required => 1,
    );
    has branch => (
        is => 'ro',
        isa => Str,
        required => 1,
    );

    method create_badge {

        my $link_href = sprintf 'https://travis-ci.org/%s/%s', $self->user, $self->repo;
        my $image_href = sprintf 'https://api.travis-ci.org/%s/%s.svg?branch=%s', $self->user, $self->repo, $self->branch;

        return sprintf q{<a href="%s"><img src="%s" /></a>}, $link_href, $image_href;

    }
}

1;

__END__

=pod

=head1 SYNOPSIS

    use Pod::Weaver::Section::Badges::For::Travis;

=head1 DESCRIPTION

Pod::Weaver::Section::Badges::For::Travis is ...

=head1 SEE ALSO

=cut
