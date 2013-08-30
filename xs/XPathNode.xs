MODULE = PugiXML    PACKAGE = PugiXML::XPathNode
PROTOTYPES: DISABLE

void
xml_parse_result::is_ok()
OVERLOAD: bool
PPCODE:
    ST(0) = *THIS == true ? &PL_sv_undef : newSViv(1);
    XSRETURN(1);

xml_node
xpath_node::node()
PREINIT:
    GET_DOC_FROM_SELF;

xml_node
xpath_node::parent()
PREINIT:
    GET_DOC_FROM_SELF;

