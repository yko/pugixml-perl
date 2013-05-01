package PugiXML::Node;

use strict;
use warnings;

require PugiXML::XPathNodeSet;

use PugiXML;

use overload '""' => sub { $_[0]->as_string };

1;
