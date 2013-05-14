# $NetBSD$

BUILDLINK_TREE+=	libkcddb

.if !defined(LIBKCDDB_BUILDLINK3_MK)
LIBKCDDB_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libkcddb+=	libkcddb>=4.10.2
BUILDLINK_PKGSRCDIR.libkcddb?=	../../multimedia/libkcddb

.endif	# LIBKCDDB_BUILDLINK3_MK

BUILDLINK_TREE+=	-libkcddb
