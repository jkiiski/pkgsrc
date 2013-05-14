# $NetBSD$

BUILDLINK_TREE+=	libhdhomerun

.if !defined(LIBHDHOMERUN_BUILDLINK3_MK)
LIBHDHOMERUN_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libhdhomerun+=	libhdhomerun>=20130328
BUILDLINK_PKGSRCDIR.libhdhomerun?=	../../multimedia/libhdhomerun
.endif	# LIBHDHOMERUN_BUILDLINK3_MK

BUILDLINK_TREE+=	-libhdhomerun
