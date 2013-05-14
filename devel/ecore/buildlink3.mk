# $NetBSD: buildlink3.mk,v 1.3 2013/01/26 21:36:18 adam Exp $

BUILDLINK_TREE+=	ecore

.if !defined(ECORE_BUILDLINK3_MK)
ECORE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.ecore+=	ecore>=1.1.0
BUILDLINK_ABI_DEPENDS.ecore?=	ecore>=1.1.0nb4
BUILDLINK_PKGSRCDIR.ecore?=	../../devel/ecore

.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/eet/buildlink3.mk"
.include "../../graphics/evas-buffer/buildlink3.mk"
.include "../../graphics/evas-software-x11/buildlink3.mk"
.include "../../graphics/evas/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../x11/libXScrnSaver/buildlink3.mk"
.include "../../x11/libXcomposite/buildlink3.mk"
.include "../../x11/libXcursor/buildlink3.mk"
.include "../../x11/libXdamage/buildlink3.mk"
.include "../../x11/libXinerama/buildlink3.mk"
.include "../../x11/libXp/buildlink3.mk"
.include "../../x11/libXrandr/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"
.include "../../x11/libXtst/buildlink3.mk"
.endif # ECORE_BUILDLINK3_MK

BUILDLINK_TREE+=	-ecore
