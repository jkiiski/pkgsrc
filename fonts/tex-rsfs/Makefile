# $NetBSD: Makefile,v 1.3 2010/09/14 00:24:39 minskim Exp $

DISTNAME=	rsfs
PKGNAME=	tex-${DISTNAME}-2009
PKGREVISION=	1
TEXLIVE_REV=	15878
DIST_SUBDIR=	${PKGBASE}-${TEXLIVE_REV}.2010

MAINTAINER=	minskim@NetBSD.org
COMMENT=	Ralph Smith's Formal Script font

CONFLICTS+=	teTeX-texmf<=3.0nb15

TEX_MIXEDMAP_FILES+=	rsfs.map

.include "../../print/texlive/package.mk"
.include "../../mk/bsd.pkg.mk"
