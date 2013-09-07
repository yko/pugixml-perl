package PugiXML::XMLParseResult;

use strict;
use warnings;

use PugiXML;

use overload 'bool' => sub { $_[0]->is_error };

1;
