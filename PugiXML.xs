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

MODULE = PugiXML

INCLUDE: xs/Node.xs
INCLUDE: xs/Document.xs
INCLUDE: xs/XMLParseResult.xs
INCLUDE: xs/XPathNode.xs
INCLUDE: xs/XPathNodeSet.xs
INCLUDE: xs/XMLText.xs
