# $NetBSD: buildlink3.mk,v 1.45 2013/02/16 11:19:03 wiz Exp $

BUILDLINK_TREE+=	libgail-gnome

.if !defined(LIBGAIL_GNOME_BUILDLINK3_MK)
LIBGAIL_GNOME_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libgail-gnome+=	libgail-gnome>=1.1.1nb2
BUILDLINK_ABI_DEPENDS.libgail-gnome+=	libgail-gnome>=1.20.4nb5
BUILDLINK_PKGSRCDIR.libgail-gnome?=	../../devel/libgail-gnome

.include "../../devel/at-spi/buildlink3.mk"
.include "../../devel/atk/buildlink3.mk"
.include "../../devel/libbonobo/buildlink3.mk"
.include "../../devel/libbonoboui/buildlink3.mk"
.include "../../devel/libgnomeui/buildlink3.mk"
.include "../../x11/gnome-panel/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif # LIBGAIL_GNOME_BUILDLINK3_MK

BUILDLINK_TREE+=	-libgail-gnome
