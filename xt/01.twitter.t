use strict;
use warnings;
use FindBin '$Bin';
use Test::More tests => 1;
use LWP::Simple;
use HTML::Tidy;

use PugiXML::Document;

my $doc = PugiXML::Document->new;

my $twitter = get("http://twitter.com");

my $tidy = HTML::Tidy->new(
    {   "output-xml"         => 1,
        "literal-attributes" => 1,
        "add-xml-space"      => "no",
        "wrap"               => 0,
        "bare"               => "yes"
    }
);

my $clean_twitter = $tidy->clean($twitter);
my $retval = $doc->load($clean_twitter);

my $xpath_nodes = $doc->select_nodes('//div');

isa_ok($xpath_nodes, 'PugiXML::XPathNodeSet');

foreach my $node (@$xpath_nodes) {
    print $node->name, "\n";
}

diag "Got " . $xpath_nodes->size() . " divs from Twitter\n";

