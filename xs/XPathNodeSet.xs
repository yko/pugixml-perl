MODULE = PugiXML    PACKAGE = PugiXML::XPathNodeSet
PROTOTYPES: DISABLE

size_t
xpath_node_set::size()

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

