use strict;
use warnings;
use FindBin '$Bin';
use Test::More tests => 4;

use_ok( 'PugiXML::Node' );
use_ok( 'PugiXML::Document' );
use_ok( 'PugiXML::XMLParseResult' );

diag( "Testing PugiXML $PugiXML::VERSION" );

my $doc = new_ok 'PugiXML::Document';
