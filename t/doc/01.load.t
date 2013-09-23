use strict;
use warnings;
use FindBin '$Bin';
use Test::More tests => 6;

use_ok( 'PugiXML::Document' );
use_ok( 'PugiXML::Node' );

diag( "Testing PugiXML $PugiXML::VERSION" );

my $doc = new_ok 'PugiXML::Document';

my $xml = '<foo> bar <baz>hello</baz> </foo>';

my $retval = $doc->load($xml);

isa_ok($retval, 'PugiXML::XMLParseResult');

isa_ok $doc->document_element, 'PugiXML::Node';
is $doc->document_element->name, 'foo';
