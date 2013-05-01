use strict;
use warnings;

use inc::Module::Install;

use Module::Install::XSUtil;

all_from    'lib/PugiXML.pm';

cc_append_to_inc 'pugixml/src';
cc_include_paths 'pugixml/src';

use_ppport;

requires_cplusplus;

cc_src_paths 'pugixml/src/pugixml.cpp', 'PugiXML.xs';

WriteMakefile(
    CC       => 'g++',
    LD       => '$(CC)',
    TYPEMAPS => ['pugixml.map'],
);
