# $NetBSD: buildlink2.mk,v 1.2 2002/08/25 19:22:53 jlam Exp $

.include "../../lang/python/pyversion.mk"

BUILDLINK_PACKAGES+=		pyimaging
BUILDLINK_DEPENDS.pyimaging?=	${PYPKGPREFIX}-imaging-*
BUILDLINK_PKGSRCDIR.pyimaging?=	../../graphics/py-imaging

EVAL_PREFIX+=	BUILDLINK_PREFIX.pyimaging=${PYPKGPREFIX}-imaging
BUILDLINK_PREFIX.pyimaging_DEFAULT=	${LOCALBASE}

BUILDLINK_FILES.pyimaging=	${PYINC}/PIL/ImConfig.h
BUILDLINK_FILES.pyimaging+=	${PYINC}/PIL/ImPlatform.h
BUILDLINK_FILES.pyimaging+=	${PYINC}/PIL/Imaging.h

BUILDLINK_TARGETS+=	pyimaging-buildlink

pyimaging-buildlink: _BUILDLINK_USE
