# $NetBSD: buildlink3.mk,v 1.1.1.1 2011/01/19 04:15:41 jmcneill Exp $

.include "../../multimedia/libva/available.mk"
.if ${VAAPI_AVAILABLE} == "yes"

BUILDLINK_TREE+=	libva

.if !defined(LIBVA_BUILDLINK3_MK)
LIBVA_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libva+=	libva>=1.0.6
BUILDLINK_PKGSRCDIR.libva?=	../../multimedia/libva

.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libdrm/buildlink3.mk"

.endif	# LIBVA_BUILDLINK3_MK

BUILDLINK_TREE+=	-libva

.endif # VAAPI_AVAILABLE
