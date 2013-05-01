#include "pugixml.hpp"
#include "typemap.h"
#include <string>

#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#ifdef __cplusplus
}
#endif


#include "ppport.h"

struct xml_string_writer : pugi::xml_writer
{
    std::string result;

    virtual void write(const void* data, size_t size)
    {
        result += std::string(static_cast<const char*>(data), size);
    }
};

using namespace pugi;

MODULE = PugiXML    PACKAGE = PugiXML::Node
PROTOTYPES: DISABLE


xml_node *
xml_node::new()

xml_node
xml_node::child(const char * name)

const char_t*
xml_node::child_value()

const char_t*
xml_node::name()

const char_t*
xml_node::value()

xml_attribute
xml_node::attribute(const char *name)

xpath_node
xml_node::select_single_node(const char *xpath)

xpath_node_set
xml_node::select_nodes(const char *xpath)

const char_t*
xml_node::as_string()
CODE:
    xml_string_writer w;
    THIS->print(w);
    RETVAL = w.result.data();
OUTPUT:
    RETVAL

MODULE = PugiXML    PACKAGE = PugiXML::Document
PROTOTYPES: DISABLE


xml_document *
xml_document::new()

void
xml_document::DESTROY()

xml_parse_result
xml_document::load(const char *contents, ...);


MODULE = PugiXML    PACKAGE = PugiXML::XMLParseResult
PROTOTYPES: DISABLE

const char *
xml_parse_result::description()

int
xml_parse_result::offset()
CODE:
    RETVAL = THIS->offset;

void
xml_parse_result::DESTROY()

MODULE = PugiXML    PACKAGE = PugiXML::XPathNode
PROTOTYPES: DISABLE

xml_node
xpath_node::node()

xml_node
xpath_node::parent()

MODULE = PugiXML    PACKAGE = PugiXML::XPathNodeSet
PROTOTYPES: DISABLE

void
xpath_node_set::as_arrayref(...)
    CODE:
        AV *nodes = (AV *)sv_2mortal((SV *)newAV());;

        for (pugi::xpath_node_set::const_iterator it = THIS->begin(); it != THIS->end(); ++it)
        {
            SV * node_sv = newSV(0);
            xpath_node * tmp = new xpath_node();
            *tmp = *it;
            sv_setref_pv( node_sv, PERL_PKG_xml_node, (void*)tmp );
            av_push(nodes, node_sv);
        }

        ST(0)= newRV((SV *)nodes);
        XSRETURN(1);
