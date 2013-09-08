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
xml_parse_result::is_error()
PPCODE:
    /* ParseResult == TRUE means document was not loaded */
    ST(0) = *THIS ? &PL_sv_no : &PL_sv_yes;
    XSRETURN(1);

void
xml_parse_result::DESTROY()
