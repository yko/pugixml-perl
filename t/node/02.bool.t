use strict;
use warnings;
use Test::More tests => 5;

use_ok('PugiXML::Node');
use_ok('PugiXML::Document');

my $doc = new_ok 'PugiXML::Document';

my $xml = '<foo baz="true">bar</foo>';

$doc->load($xml);

my $node = $doc->child("foo");
ok !!$node, "node found";

$node = $doc->child("bar");
ok !$node, "node not found";
