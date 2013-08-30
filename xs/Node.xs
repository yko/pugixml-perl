MODULE = PugiXML    PACKAGE = PugiXML::Node
PROTOTYPES: DISABLE

void
xml_parse_result::is_ok()
OVERLOAD: bool
PPCODE:
    ST(0) = *THIS == true ? &PL_sv_undef : newSViv(1);
    XSRETURN(1);

xml_node
xml_node::child(const char * name)
PREINIT:
    GET_DOC_FROM_SELF;

const char_t*
xml_node::child_value()

const char_t*
xml_node::name()

const char_t*
xml_node::value()

xml_attribute
xml_node::attribute(const char *name)
PREINIT:
    GET_DOC_FROM_SELF;

xpath_node
xml_node::select_single_node(const char *xpath)
PREINIT:
    GET_DOC_FROM_SELF;

xpath_node_set
xml_node::select_nodes(const char *xpath)
PREINIT:
    GET_DOC_FROM_SELF;

const char_t*
xml_node::as_string()
CODE:
    xml_string_writer w;
    THIS->print(w);
    RETVAL = w.result.data();
OUTPUT:
    RETVAL
