# $NetBSD$
#

DISTNAME=	aspell6-grc-0.02-0
PKGNAME=	${DISTNAME:S/6-/-/1:S/-0$/.0/1}
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GNU:=aspell/dict/grc/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	rodent@NetBSD.org
HOMEPAGE=	http://www.himeros.eu/
COMMENT=	Ancient Greek language support for aspell
LICENSE=	gnu-gpl-v3

HAS_CONFIGURE=	yes
USE_LANGUAGES=	# none

.include "../../textproc/aspell/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
