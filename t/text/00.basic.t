use strict;
use warnings;

use Test::More tests => 9;
use PugiXML::Document;

my $doc = PugiXML::Document->new;

my $retval = $doc->load('<foo baz="true">bar</foo><bar />');

ok $retval, "loaded ok";

my $node = $doc->child("foo");
isa_ok $node, 'PugiXML::Node';

my $text = $node->text;
isa_ok $text, "PugiXML::XMLText";

ok !$text->empty, "node text not empty";
is $text->get, "bar", "node text ok";

$node = $doc->child("bar");
isa_ok $node, 'PugiXML::Node';

$text = $node->text;
isa_ok $text, "PugiXML::XMLText";

ok $text->empty, "node text empty";
is $text->get, "", "node text empty ok";

