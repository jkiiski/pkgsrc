# $NetBSD: Makefile,v 1.13 2012/10/31 11:17:28 asau Exp $
#

DISTNAME=	mdds_0.6.1
PKGNAME=	${DISTNAME:S/_/-/}
PKGREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://multidimalgorithm.googlecode.com/files/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://code.google.com/p/multidimalgorithm/
COMMENT=	Collection of multi-dimensional data structure and indexing algorithms
LICENSE=	mit

USE_LANGUAGES=		c++
GNU_CONFIGURE=		yes
INSTALLATION_DIRS=	include/mdds/hash_container

do-build:

do-install:
	for i in ${WRKSRC}/include/mdds/*.*; do \
		${INSTALL_DATA} $$i ${DESTDIR}${PREFIX}/include/mdds; \
	done
	rm -f ${DESTDIR}${PREFIX}/include/mdds/*orig
	for i in ${WRKSRC}/include/mdds/hash_container/*.*; do \
		${INSTALL_DATA} $$i \
			${DESTDIR}${PREFIX}/include/mdds/hash_container; \
	done

BUILDLINK_DEPMETHOD.boost-headers?=	build
.include "../../devel/boost-headers/buildlink3.mk"
.include "../../devel/boost-libs/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
