package PugiXML::XPathNodeSet;

use strict;
use warnings;

use PugiXML;

use overload '@{}' => \&as_arrayref;

1;
