# $NetBSD: buildlink3.mk,v 1.9 2009/03/20 19:25:03 joerg Exp $

BUILDLINK_TREE+=	libdvbpsi0

.if !defined(LIBDVBPSI0_BUILDLINK3_MK)
LIBDVBPSI0_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libdvbpsi0+=	libdvbpsi>=0.1.3<1.0
BUILDLINK_ABI_DEPENDS.libdvbpsi0+=	libdvbpsi>=0.1.6<1.0
BUILDLINK_PKGSRCDIR.libdvbpsi0?=	../../multimedia/libdvbpsi0
.endif # LIBDVBPSI0_BUILDLINK3_MK

BUILDLINK_TREE+=	-libdvbpsi0
