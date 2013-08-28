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

#define GET_DOC_FROM_SV(sv)                           \
SV *doc;                                              \
{                                                     \
    MAGIC *mg = mg_find(SvRV(sv), PERL_MAGIC_ext);    \
    doc = mg ? mg->mg_obj : &PL_sv_undef;             \
}                                                     \

#define GET_DOC_FROM_SELF                             \
    GET_DOC_FROM_SV(ST(0))

#define SELF_IS_DOC                                   \
    SV *doc = SvRV(ST(0));

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

MODULE = PugiXML    PACKAGE = PugiXML::XMLParseResult
PROTOTYPES: DISABLE

const char *
xml_parse_result::description()

int
xml_parse_result::offset()
CODE:
    RETVAL = THIS->offset;
OUTPUT:
    RETVAL

void
xml_parse_result::DESTROY()

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

MODULE = PugiXML    PACKAGE = PugiXML::XPathNodeSet
PROTOTYPES: DISABLE

SV *
xpath_node_set::as_arrayref(SV * right, SV *swap)
PREINIT:
    GET_DOC_FROM_SELF;
CODE:
    AV *nodes = (AV *)sv_2mortal((SV *)newAV());;

    for (pugi::xpath_node_set::const_iterator it = THIS->begin(); it != THIS->end(); ++it)
    {
        SV * node_sv = sv_newmortal();
        xpath_node * tmp = new xpath_node();
        Newx(tmp, 1, xpath_node);
        *tmp = *it;

        sv_setref_pv( node_sv, PERL_PKG_xml_node, (void*)tmp );
        sv_magic(SvRV(node_sv), SvRV(doc), PERL_MAGIC_ext, NULL, 0);
        av_push(nodes, node_sv);
    }

    ST(0)= newRV((SV *)nodes);
    XSRETURN(1);
