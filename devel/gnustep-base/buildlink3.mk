# $NetBSD: buildlink3.mk,v 1.18 2013/01/26 21:36:19 adam Exp $

BUILDLINK_TREE+=	gnustep-base

.if !defined(GNUSTEP_BASE_BUILDLINK3_MK)
GNUSTEP_BASE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gnustep-base+=	gnustep-base>=1.24.0
BUILDLINK_ABI_DEPENDS.gnustep-base+=	gnustep-base>=1.24.0nb2
BUILDLINK_PKGSRCDIR.gnustep-base?=	../../devel/gnustep-base

.include "../../devel/gnustep-make/buildlink3.mk"
.include "../../devel/gnustep-objc/buildlink3.mk"
.include "../../textproc/icu/buildlink3.mk"
.endif # GNUSTEP_BASE_BUILDLINK3_MK

BUILDLINK_TREE+=	-gnustep-base
