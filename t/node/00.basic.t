use strict;
use warnings;
use FindBin '$Bin';
use Test::More tests => 9;

use_ok( 'PugiXML::Node' );
use_ok( 'PugiXML::Document' );

my $doc = new_ok 'PugiXML::Document';

my $xml = '<foo baz="true">bar</foo>';

my $retval = $doc->load($xml);

isa_ok($retval, 'PugiXML::XMLParseResult');

my $node = $doc->child("foo");

isa_ok($node, 'PugiXML::Node');

is $node->name, "foo", "node name";;
is $node->value, "", "node value empty";;
is $node->child_value, "bar", "node child value";;

is $node->attribute("baz"), "true", "attribute";;
