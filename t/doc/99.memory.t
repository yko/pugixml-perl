use strict;
use warnings;
use FindBin '$Bin';
use Test::More;

plan skip_all => "Set DO_MEMORY_TEST to run this test"
  unless $ENV{DO_MEMORY_TEST};

plan tests => 7;

use_ok('PugiXML::Document');

my $data = join '', <DATA>;

for (1 .. 10000) {

    my $doc = PugiXML::Document->new;

    my $retval = $doc->load($data);

    my $xpath_node = $doc->select_single_node("//bar");

    my $node  = $xpath_node->node;
    my $name  = $node->name;
    my $value = $node->child_value;
}

print "Did I leak? [sleeping]\n";

sleep;

__DATA__

<foo>
  <bar>
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
  </bar>
  <bar>
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
  </bar>
  <bar>
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
  </bar>
  <bar>
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
  </bar>
  <bar>
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
  </bar>
  <bar>
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
  </bar>
  <bar>
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
    content content content content content content content content content content content content content content 
  </bar>
</foo>
