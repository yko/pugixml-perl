MODULE = PugiXML    PACKAGE = PugiXML::Document
PROTOTYPES: DISABLE


xml_document *
xml_document::new()
OUTPUT:
    RETVAL sv_setref_pv( ST(0) = sv_newmortal(), PERL_PKG_xml_document, (void*)RETVAL );

void
xml_document::DESTROY()

xml_parse_result
xml_document::load(const char *contents, ...);
PREINIT:
    SELF_IS_DOC;

xml_node
xml_document::child(const char * name)
PREINIT:
    SELF_IS_DOC;

xpath_node
xml_document::select_single_node(const char *xpath)
PREINIT:
    SELF_IS_DOC;

xpath_node_set
xml_document::select_nodes(const char *xpath)
PREINIT:
    SELF_IS_DOC;

