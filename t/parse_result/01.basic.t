use strict;
use warnings;
use FindBin '$Bin';
use Test::More tests => 13;

use_ok( 'PugiXML::Document' );
use_ok( 'PugiXML::XMLParseResult' );

my $doc = new_ok 'PugiXML::Document';

diag "valid XML";
my $xml = '<foo>bar</foo>';

my $retval = $doc->load($xml);

isa_ok($retval, 'PugiXML::XMLParseResult');

ok !$retval->is_error, "PugiXML::XMLParseResult is_error";
ok !!$retval == !!$retval->is_error, "PugiXML::XMLParseResult bool overload";

is $retval->description, 'No error', "description is 'No error'";

is $retval->offset, 0, 'zero offset';

diag "invalid XML";

$xml = '<foo><bar</foo>';
$retval = $doc->load($xml);

isa_ok($retval, 'PugiXML::XMLParseResult');

ok $retval->is_error, "PugiXML::XMLParseResult is an error";
is !!$retval, !!$retval->is_error, "PugiXML::XMLParseResult bool overload";

like $retval->description, qr/Error parsing/, "description contans error message";

cmp_ok $retval->offset, '!=', 0, 'non-zero offset';
