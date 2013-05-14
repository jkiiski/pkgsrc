# $NetBSD$

BUILDLINK_TREE+=	electric-fence

.if !defined(ELECTRIC_FENCE_BUILDLINK3_MK)
ELECTRIC_FENCE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.electric-fence+=	electric-fence>=2.1.13.0.1nb1
BUILDLINK_PKGSRCDIR.electric-fence?=	../../devel/electric-fence

.include "../../mk/pthread.buildlink3.mk"
.endif	# ELECTRIC_FENCE_BUILDLINK3_MK

BUILDLINK_TREE+=	-electric-fence
