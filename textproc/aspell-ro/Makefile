# $NetBSD: Makefile,v 1.1 2013/04/09 02:33:47 rodent Exp $
#

DISTNAME=	aspell5-ro-3.3-2
PKGNAME=	${DISTNAME:S/5-/-/1:S/-2/.2/1}
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GNU:=aspell/dict/ro/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://aspell.net/
COMMENT=	Romanian language support for aspell

CONFLICTS+=	aspell-romanian-[0-9]*
HAS_CONFIGURE=	yes

.include "../../textproc/aspell/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
