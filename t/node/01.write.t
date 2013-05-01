use strict;
use warnings;
use FindBin '$Bin';
use Test::More tests => 7;

use_ok( 'PugiXML::Node' );
use_ok( 'PugiXML::Document' );

my $doc = new_ok 'PugiXML::Document';

my $xml = '<foo baz="true">bar</foo>';

my $retval = $doc->load($xml);

isa_ok($retval, 'PugiXML::XMLParseResult');

my $node = $doc->child("foo");

isa_ok($node, 'PugiXML::Node');

# Writer adds carriage return in the end
like $node->as_string, qr/^\s*\Q$xml\E\s*$/s, "node as string";;

# Overload uses as_string
is "$node", $node->as_string, "node stringified";;
