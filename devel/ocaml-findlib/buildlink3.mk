# $NetBSD$

BUILDLINK_TREE+=	ocaml-findlib

.if !defined(OCAML_FINDLIB_BUILDLINK3_MK)
OCAML_FINDLIB_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.ocaml-findlib+=	ocaml-findlib>=1.2.6
BUILDLINK_PKGSRCDIR.ocaml-findlib?=	../../devel/ocaml-findlib

.include "../../lang/ocaml/buildlink3.mk"
.endif	# OCAML_FINDLIB_BUILDLINK3_MK

BUILDLINK_TREE+=	-ocaml-findlib
