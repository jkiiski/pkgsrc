# $NetBSD: Makefile,v 1.51 2013/01/30 10:21:22 wiz Exp $

DISTNAME=	pixman-0.28.2
PKGREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_XORG:=lib/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://xorg.freedesktop.org/
COMMENT=	Library of low-level pixel manipulation routines
LICENSE=	mit

GNU_CONFIGURE=	yes
.if ${MACHINE_ARCH} == i386
CONFIGURE_ARGS += --disable-sse2
.endif

USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config perl

PKGCONFIG_OVERRIDE+=	pixman-1.pc.in
PKGCONFIG_OVERRIDE+=	pixman-1-uninstalled.pc.in

# Minix does not support Thread Local Storage
CONFIGURE_ARGS+= CPPFLAGS=-DPIXMAN_NO_TLS

.include "../../mk/bsd.pkg.mk"
