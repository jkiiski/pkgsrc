# $NetBSD$

BUILDLINK_TREE+=	discount

.if !defined(DISCOUNT_BUILDLINK3_MK)
DISCOUNT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.discount+=	discount>=2.1.6
BUILDLINK_PKGSRCDIR.discount?=		../../textproc/discount
.endif	# DISCOUNT_BUILDLINK3_MK

BUILDLINK_TREE+=	-discount
