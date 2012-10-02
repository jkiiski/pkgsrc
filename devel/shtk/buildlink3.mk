# $NetBSD$

BUILDLINK_TREE+=	shtk

.if !defined(SHTK_BUILDLINK3_MK)
SHTK_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.shtk+=	shtk>=1.0
BUILDLINK_PKGSRCDIR.shtk?=	../../devel/shtk
.endif	# SHTK_BUILDLINK3_MK

BUILDLINK_TREE+=	-shtk