package PugiXML::Document;

use strict;
use warnings;

use PugiXML;

use parent 'PugiXML::Node';

1;

__END__

=head1 NAME

PugiXML::Document - XML Document representation


=head1 SYNOPSIS

    use PugiXML::Document;
    my $doc = PugiXML::Document->new;

    my $error = $doc->load('<foo>bar</foo>');
    if ($error) {
        die "Bad thing jsut happened: $error";
    }

=head1 DESCRIPTION

TBD

=head1 METHODS

L<PugiXML::Document> implements following methods:

=head2 C<new>

    my $obj = Class->new;
    my $obj = Class->new(name => 'value');
    my $obj = Class->new({name => 'value'});

This base class provides a basic object constructor.
You can pass it either a hash or a hash reference with attribute values.

=head1 SEE ALSO

=over

=item * L<PugiXML::Node>

=item * L<PugiXML::XMLParseResult>

=back
