# $NetBSD: buildlink2.mk,v 1.4 2002/12/24 06:10:19 wiz Exp $

.if !defined(LIBIDL2_BUILDLINK2_MK)
LIBIDL2_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=		idl
BUILDLINK_DEPENDS.idl?=		libIDL>=0.8.0nb1
BUILDLINK_PKGSRCDIR.idl?=	../../net/libIDL

EVAL_PREFIX+=		BUILDLINK_PREFIX.idl=idl
BUILDLINK_PREFIX.idl_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.idl=	include/libIDL-2.0/libIDL/*
BUILDLINK_FILES.idl+=	lib/libIDL-2.*

.include "../../converters/libiconv/buildlink2.mk"
.include "../../devel/glib2/buildlink2.mk"
.include "../../devel/pkgconfig/buildlink2.mk"

BUILDLINK_TARGETS+=	idl-buildlink

idl-buildlink: _BUILDLINK_USE

.endif	# LIBIDL2_BUILDLINK2_MK
