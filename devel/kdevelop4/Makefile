# $NetBSD: Makefile,v 1.30 2013/02/16 11:20:47 wiz Exp $
#

DISTNAME=	kdevelop-4.4.1
PKGNAME=	kdevelop4-4.4.1
PKGREVISION=	5
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_KDE:=kdevelop/4.4.1/src/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	frank@fthieme.net
HOMEPAGE=	http://www.kdevelop.org/
COMMENT=	Integrated Development Environment for Unix/X11/KDE
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	automoc4>=0.9.87:../../devel/automoc4

USE_TOOLS+=	pkg-config perl msgfmt
USE_LANGUAGES=	c c++

# because of some expansion to ${PKGDIRNAME}.kdev4 which is done wrong by bmake
USE_TOOLS+=     gmake

BUILDLINK_DEPMETHOD.qt4-tools=	full
.include "../../meta-pkgs/kde4/kde4.mk"

.include "../../x11/kdelibs4/buildlink3.mk"
.include "../../x11/kde-workspace4/buildlink3.mk"
.include "../../devel/boost-headers/buildlink3.mk"
.include "../../devel/kdesdk4/buildlink3.mk"
.include "../../devel/kdevplatform/buildlink3.mk"
.include "../../devel/subversion-base/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"

.include "../../mk/bsd.pkg.mk"
