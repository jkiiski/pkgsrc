# $NetBSD: buildlink3.mk,v 1.34 2013/02/09 22:11:29 ryoon Exp $

BUILDLINK_TREE+=	kdegames

.if !defined(KDEGAMES_BUILDLINK3_MK)
KDEGAMES_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kdegames+=	kdegames>=3.5.0nb1
BUILDLINK_ABI_DEPENDS.kdegames+=	kdegames>=3.5.10nb20
BUILDLINK_PKGSRCDIR.kdegames?=	../../games/kdegames3

.include "../../x11/kdebase3/buildlink3.mk"
.include "../../x11/kdelibs3/buildlink3.mk"
.endif # KDEGAMES_BUILDLINK3_MK

BUILDLINK_TREE+=	-kdegames
