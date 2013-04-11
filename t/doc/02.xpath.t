use strict;
use warnings;
use FindBin '$Bin';
use Test::More tests => 13;

use_ok( 'PugiXML::Document' );

my $doc = new_ok 'PugiXML::Document';

my $xml = '<foo>bar<baz> baz content </baz> <baz> baz content 2 </baz> </foo>';

my $retval = $doc->load($xml);

isa_ok($retval, 'PugiXML::XMLParseResult');

my $xpath_node = $doc->select_single_node("//baz");

isa_ok($xpath_node, 'PugiXML::XPathNode');

my $node = $xpath_node->node;

isa_ok($node, 'PugiXML::Node');
is $node->name, 'baz', 'node name';
is $node->child_value, ' baz content ', 'node content';

my $xpath_nodeset = $doc->select_nodes("//baz");

isa_ok($xpath_nodeset, 'PugiXML::XPathNodeSet');
is scalar(@$xpath_nodeset), 2, "nodeset length";

$node = $xpath_nodeset->[0];
is $node->name, 'baz', 'node name';
is $node->child_value, ' baz content ', 'node content';

$node = $xpath_nodeset->[1];
is $node->name, 'baz', 'node name';
is $node->child_value, ' baz content 2 ', 'node content';
