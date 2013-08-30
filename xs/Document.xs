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

#define XSOBJ_TYPE xml_document
#define DO_PREINIT SELF_IS_DOC

INCLUDE: xs/NodeTemplate.xs

#undef XSOBJ_TYPE
#undef DO_PREINIT
