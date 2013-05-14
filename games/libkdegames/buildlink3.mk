# $NetBSD$

BUILDLINK_TREE+=	libkdegames

.if !defined(LIBKDEGAMES_BUILDLINK3_MK)
LIBKDEGAMES_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libkdegames+=	libkdegames>=4.10.2
BUILDLINK_PKGSRCDIR.libkdegames?=	../../games/libkdegames

.endif	# LIBKDEGAMES_BUILDLINK3_MK

BUILDLINK_TREE+=	-libkdegames
