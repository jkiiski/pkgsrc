# $NetBSD$

BUILDLINK_TREE+=	libkcompactdisc

.if !defined(LIBKCOMPACTDISC_BUILDLINK3_MK)
LIBKCOMPACTDISC_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libkcompactdisc+=	libkcompactdisc>=4.10.2
BUILDLINK_PKGSRCDIR.libkcompactdisc?=	../../multimedia/libkcompactdisc

.endif	# LIBKCOMPACTDISC_BUILDLINK3_MK

BUILDLINK_TREE+=	-libkcompactdisc
