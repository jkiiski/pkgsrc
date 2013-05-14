# $NetBSD: buildlink3.mk,v 1.3 2009/03/20 19:24:11 joerg Exp $

BUILDLINK_TREE+=	compiz-bcop

.if !defined(COMPIZ_BCOP_BUILDLINK3_MK)

COMPIZ_BCOP_BUILDLINK3_MK:=
BUILDLINK_DEPMETHOD.compiz-bcop?=	build

BUILDLINK_API_DEPENDS.compiz-bcop+=	compiz-bcop>=0.6.0
BUILDLINK_PKGSRCDIR.compiz-bcop?=	../../devel/compiz-bcop
.endif # COMPIZ_BCOP_BUILDLINK3_MK

BUILDLINK_TREE+=	-compiz-bcop
