# $NetBSD$

BUILDLINK_TREE+=	kdebindings4-python

.if !defined(KDEBINDINGS4_PYTHON_BUILDLINK3_MK)
KDEBINDINGS4_PYTHON_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kdebindings4-python+=	kdebindings4-python>=4.1.85
BUILDLINK_PKGSRCDIR.kdebindings4-python?=	../../x11/kdebindings4-python

.endif # KDEBINDINGS4_PYTHON_BUILDLINK3_MK

BUILDLINK_TREE+=	-kdebindings4-python
