# $NetBSD: Makefile,v 1.1.1.1 2013/02/28 15:43:25 agc Exp $
#

DISTNAME=	libsodium-0.4.1
CATEGORIES=	security
MASTER_SITES=	http://download.dnscrypt.org/libsodium/releases/

MAINTAINER=	csosstudy@gmail.com
HOMEPAGE=	https://github.com/jedisct1/libsodium
COMMENT=	Library for build higher-level cryptographic tools
LICENSE=	isc

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes

TEST_TARGET=	check
AUTO_MKDIRS=	yes

DOCDIR=		share/doc/${PKGBASE}

post-install:
	${INSTALL_DATA} ${WRKSRC}/NEWS ${DESTDIR}${PREFIX}/${DOCDIR}

.include "../../mk/bsd.pkg.mk"
