# $NetBSD$
#

DISTNAME=	aspell-ia-0.50-1
PKGNAME=	${DISTNAME:S/-1/.1/1}
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GNU:=aspell/dict/ia/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	rodent@NetBSD.org
HOMEPAGE=	http://aspell.net/
COMMENT=	Interlingua language support for aspell
LICENSE=	gnu-lgpl-v2.1

HAS_CONFIGURE=	yes
USE_LANGUAGES=	# none

.include "../../textproc/aspell/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
