# $NetBSD: Makefile,v 1.9 2012/10/31 11:17:22 asau Exp $
#

DISTNAME=	libstree-0.4.0
PKGREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://www.icir.org/christian/downloads/

MAINTAINER=	gson@NetBSD.org
HOMEPAGE=	http://www.icir.org/christian/libstree/
COMMENT=	Suffix tree library

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
CONFIGURE_ARGS+=	--with-html-dir=${PREFIX:Q}/share/doc/html

.include "../../mk/bsd.pkg.mk"
