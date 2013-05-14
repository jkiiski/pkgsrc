# $NetBSD$
#

DISTNAME=	aspell6-fi-0.7-0
PKGNAME=	${DISTNAME:S/6-/-/1:S/-0$/.0/1}
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GNU:=aspell/dict/fi/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	jkj@kapsi.fi
HOMEPAGE=	http://aspell.net/
COMMENT=	Finnish language support for aspell
LICENSE=	gnu-gpl-v2

HAS_CONFIGURE=	yes

.include "../../textproc/aspell/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
