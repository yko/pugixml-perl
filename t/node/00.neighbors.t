use strict;
use warnings;
use Test::More tests => 21;

use_ok('PugiXML::Node');
use_ok('PugiXML::Document');

my $doc = new_ok 'PugiXML::Document';

my $xml = <<'EOF';
<parent_tag>
    <child>first</child>
    <child>second</child>
    <child>third</child>
</parent_tag>
EOF

my $retval = $doc->load($xml);

isa_ok($retval, 'PugiXML::XMLParseResult');

my $node = $doc->select_single_node("//parent_tag")->node;

is $node->name, "parent_tag", "node name";
is $node->first_child->node->child_value, "first", "first_child";
is $node->last_child->node->child_value,  "third", "last_child";

$node = $doc->select_single_node("//parent_tag/child[1]")->node;

isa_ok($node, 'PugiXML::Node');

is $node->name,        "child", "node name";
is $node->child_value, "first", "selected first node";
is $node->parent->node->name,              'parent_tag', 'parent';
is $node->next_sibling->node->child_value, 'second',     'next_sibling';
is $node->previous_sibling->node->name, '', 'empty previous_sibling';

$node = $doc->select_single_node("//parent_tag/child[2]")->node;

is $node->name,        "child",  "node name";
is $node->child_value, "second", "selected second node";
is $node->next_sibling->node->child_value, 'third', 'next_sibling';
is $node->previous_sibling->node->child_value,    'first', 'previous_sibling';

$node = $doc->select_single_node("//parent_tag/child[3]")->node;

is $node->name,        "child", "node name";
is $node->child_value, "third", "selected third node";
is $node->next_sibling->node->child_value, '',       'empty next_sibling';
is $node->previous_sibling->node->child_value,    'second', 'previous_sibling';
