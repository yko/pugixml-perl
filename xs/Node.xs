MODULE = PugiXML    PACKAGE = PugiXML::Node
PROTOTYPES: DISABLE

#define XSOBJ_TYPE xml_node
#define DO_PREINIT GET_DOC_FROM_SELF

INCLUDE: xs/NodeTemplate.xs

#undef XSOBJ_TYPE
#undef DO_PREINIT
