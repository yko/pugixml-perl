use strict;
use warnings;
use FindBin '$Bin';
use Test::More tests => 4;

use_ok( 'PugiXML::Document' );
use_ok( 'PugiXML::Node' );

diag( "Testing PugiXML $PugiXML::VERSION" );

my $doc = new_ok 'PugiXML::Document';

my $xml = '<foo>bar</foo>';

my $retval = $doc->load($xml);

isa_ok($retval, 'PugiXML::XMLParseResult');
