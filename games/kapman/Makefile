# $NetBSD: Makefile,v 1.1 2013/04/03 12:03:31 markd Exp $

DISTNAME=	kapman-${_KDE_VERSION}
PKGREVISION=	1
CATEGORIES=	games
COMMENT=	Pac-Man clone

.include "../../meta-pkgs/kde4/Makefile.kde4"

.include "../../meta-pkgs/kde4/kde4.mk"

.include "../../games/libkdegames/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/kdelibs4/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
