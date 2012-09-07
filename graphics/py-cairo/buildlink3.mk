# $NetBSD: buildlink3.mk,v 1.14 2011/11/01 11:48:58 tron Exp $

BUILDLINK_TREE+=	pycairo

.if !defined(PY_CAIRO_BUILDLINK3_MK)
PY_CAIRO_BUILDLINK3_MK:=

.  include "../../lang/python/pyversion.mk"

BUILDLINK_API_DEPENDS.pycairo+=	${PYPKGPREFIX}-cairo>=1.0.2
BUILDLINK_ABI_DEPENDS.pycairo+=	py27-cairo>=1.8.10nb3
BUILDLINK_PKGSRCDIR.pycairo?=	../../graphics/py-cairo

.include "../../graphics/cairo/buildlink3.mk"
.endif # PY_CAIRO_BUILDLINK3_MK

BUILDLINK_TREE+=	-pycairo
