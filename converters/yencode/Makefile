# $NetBSD: Makefile,v 1.15 2012/10/03 00:20:19 asau Exp $
#

DISTNAME=	yencode-0.46
PKGNAME=	${DISTNAME:C/([0-9])$/.\1/1}
PKGREVISION=	1
CATEGORIES=	converters
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=yencode/}

MAINTAINER=	shaun@inerd.com
HOMEPAGE=	http://www.yencode.org/
COMMENT=	Encoder and decoder for yenc format

GNU_CONFIGURE=		yes

CFLAGS.SunOS+=	-Du_int64_t=uint64_t
LIBS.SunOS+=	-lsocket -lnsl

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
