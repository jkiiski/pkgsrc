# $NetBSD: Makefile,v 1.7 2012/10/23 19:50:58 asau Exp $
#

DISTNAME=	dmassage-0.6
PKGREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://www.sentia.org/downloads/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.sentia.org/projects/dmassage/
COMMENT=	Parser for dmesg(8)

PKG_INSTALLATION_TYPES=	overwrite pkgviews

ONLY_FOR_PLATFORM=	NetBSD-*-* OpenBSD-*-*

NO_BUILD=	yes
USE_TOOLS+=	perl:run
REPLACE_PERL=	dmassage

INSTALLATION_DIRS=	bin share/doc/${PKGBASE}

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/dmassage ${DESTDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/README ${DESTDIR}${PREFIX}/share/doc/${PKGBASE}

.include "../../mk/bsd.pkg.mk"
