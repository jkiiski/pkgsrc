# $NetBSD: Makefile,v 1.4 2013/03/02 12:05:14 jkunz Exp $

DISTNAME=	libftdi-0.20
CATEGORIES=	devel
MASTER_SITES=	http://www.intra2net.com/en/developer/libftdi/download/

MAINTAINER=	jakllsch@NetBSD.org
HOMEPAGE=	http://www.intra2net.com/en/developer/libftdi/
COMMENT=	Userland driver library for FTDI USB chips
LICENSE=	gnu-lgpl-v2.1

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

CONFIGURE_ARGS+=	--without-examples
CONFIGURE_ARGS+=	--without-docs

PKGCONFIG_OVERRIDE+=	libftdi.pc.in
PKGCONFIG_OVERRIDE+=	libftdipp.pc.in

.include "../../devel/libusb/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
