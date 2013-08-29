MODULE = PugiXML    PACKAGE = PugiXML::XPathNode
PROTOTYPES: DISABLE

xml_node
xpath_node::node()
PREINIT:
    GET_DOC_FROM_SELF;

xml_node
xpath_node::parent()
PREINIT:
    GET_DOC_FROM_SELF;

