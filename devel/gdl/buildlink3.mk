# $NetBSD: buildlink3.mk,v 1.25 2013/02/06 23:21:29 jperkin Exp $

BUILDLINK_TREE+=	gdl

.if !defined(GDL_BUILDLINK3_MK)
GDL_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gdl+=	gdl>=0.6.1
BUILDLINK_ABI_DEPENDS.gdl+=	gdl>=2.26.2nb22
BUILDLINK_PKGSRCDIR.gdl?=	../../devel/gdl

.include "../../devel/libglade/buildlink3.mk"
.include "../../devel/libgnomeui/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif # GDL_BUILDLINK3_MK

BUILDLINK_TREE+=	-gdl
