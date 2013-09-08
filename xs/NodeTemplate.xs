xml_node
XSOBJ_TYPE::child(const char * name)
PREINIT:
    DO_PREINIT;

const char_t*
XSOBJ_TYPE::child_value()

const char_t*
XSOBJ_TYPE::name()

const char_t*
XSOBJ_TYPE::value()

xml_attribute
XSOBJ_TYPE::attribute(const char *name)
PREINIT:
    DO_PREINIT;

xml_text
XSOBJ_TYPE::text()
PREINIT:
    DO_PREINIT;

xpath_node
XSOBJ_TYPE::select_single_node(const char *xpath)
PREINIT:
    DO_PREINIT;

xpath_node_set
XSOBJ_TYPE::select_nodes(const char *xpath)
PREINIT:
    DO_PREINIT;

const char_t*
XSOBJ_TYPE::as_string()
CODE:
    xml_string_writer w;
    THIS->print(w);
    RETVAL = w.result.data();
OUTPUT:
    RETVAL

xpath_node
XSOBJ_TYPE::parent()
PREINIT:
    DO_PREINIT;

xpath_node
XSOBJ_TYPE::first_child()
PREINIT:
    DO_PREINIT;

xpath_node
XSOBJ_TYPE::last_child()
PREINIT:
    DO_PREINIT;

xpath_node
XSOBJ_TYPE::next_sibling()
PREINIT:
    DO_PREINIT;

xpath_node
XSOBJ_TYPE::previous_sibling()
PREINIT:
    DO_PREINIT;

void
XSOBJ_TYPE::empty()
PREINIT:
    DO_PREINIT;
PPCODE:
    /* xml_node has operator unspecified_bool_type() which is an alias to empty() */
    ST(0) = *THIS ? &PL_sv_yes : &PL_sv_no;
    XSRETURN(1);
