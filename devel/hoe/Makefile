# $NetBSD: Makefile,v 1.28 2013/02/11 02:19:09 taca Exp $

DISTNAME=	hoe-3.5.1
CATEGORIES=	devel

MAINTAINER=	minskim@NetBSD.org
HOMEPAGE=	http://seattlerb.rubyforge.org/hoe/
COMMENT=	Rake extension to provide full project automation
LICENSE=	mit

CONFLICTS+=	ruby[1-9][0-9]-hoe-[0-9]* hoe-[0-9]*

RUBYGEMS_REQD=	1.4
USE_RAKE=	RUN

.include "../../lang/ruby/gem.mk"
.include "../../mk/bsd.pkg.mk"
