# $NetBSD: Makefile,v 1.29 2013/01/26 21:36:50 adam Exp $

DISTNAME=	xsp-2.10.2
PKGNAME=	mono-${DISTNAME}
PKGREVISION=	5
CATEGORIES=	www
MASTER_SITES=	http://ftp.novell.com/pub/mono/sources/xsp/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	kefren@NetBSD.org
HOMEPAGE=	http://www.mono-project.com/ASP.NET
COMMENT=	Standalone web server written in C\#

GNU_CONFIGURE=	yes
USE_TOOLS+=	gmake pkg-config
MAKE_JOBS_SAFE=	no

PKGCONFIG_OVERRIDE+=	src/Mono.WebServer/xsp.pc.in
PKGCONFIG_OVERRIDE+=	src/Mono.WebServer/xsp-2.pc.in

SUBST_CLASSES+=			unwrap_mk
SUBST_STAGE.unwrap_mk=		pre-install
SUBST_MESSAGE.unwrap_mk=	Unwrapping Tests.XSP.Security/Makefile
SUBST_FILES.unwrap_mk=		unittests/Tests.XSP.Security/Makefile
SUBST_SED.unwrap_mk=		-e 's,^MAKEINFO = .*,MAKEINFO = makeinfo,'
SUBST_SED.unwrap_mk+=		-e 's,^PKG_CONFIG = .*,PKG_CONFIG = ${PREFIX}/bin/pkg-config,'

.include "../../databases/sqlite3/buildlink3.mk"
.include "../../lang/mono/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
