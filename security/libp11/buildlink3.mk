# $NetBSD: buildlink3.mk,v 1.4 2010/01/17 12:02:41 wiz Exp $

BUILDLINK_TREE+=	libp11

.if !defined(LIBP11_BUILDLINK3_MK)
LIBP11_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libp11+=	libp11>=0.2.4
BUILDLINK_ABI_DEPENDS.libp11+=	libp11>=0.2.6nb3
BUILDLINK_PKGSRCDIR.libp11?=	../../security/libp11

.include "../../devel/libltdl/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.endif # LIBP11_BUILDLINK3_MK

BUILDLINK_TREE+=	-libp11
