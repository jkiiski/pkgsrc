# $NetBSD: Makefile,v 1.11 2013/03/15 17:47:03 drochner Exp $
#

DISTNAME=	mutagen-1.21
PKGNAME=	mutagen-tools-1.21
CATEGORIES=	audio
MASTER_SITES=	http://mutagen.googlecode.com/files/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://code.google.com/p/mutagen/
COMMENT=	Audio metadata handling for Python
LICENSE=	gnu-gpl-v2

USE_LANGUAGES=	# none
PY_NO_EGG=	yes

DEPENDS+= ${PYPKGPREFIX}-mutagen-[0-9]*:../../audio/py-mutagen

.include "../../lang/python/distutils.mk"
.include "../../mk/bsd.pkg.mk"
