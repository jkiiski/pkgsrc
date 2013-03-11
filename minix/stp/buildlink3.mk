# $NetBSD$

BUILDLINK_TREE+=	stp

.if !defined(STP_BUILDLINK3_MK)
STP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.stp+=	stp>=1.0nb1434
BUILDLINK_PKGSRCDIR.stp?=	../../minix/stp
BUILDLINK_DEPMETHOD.stp?=	build

.endif	# STP_BUILDLINK3_MK

BUILDLINK_TREE+=	-stp