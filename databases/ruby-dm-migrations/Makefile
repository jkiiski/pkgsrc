# $NetBSD: Makefile,v 1.2 2011/06/19 08:26:09 taca Exp $

DISTNAME=	dm-migrations-1.2.0
CATEGORIES=	databases

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://github.com/datamapper/dm-migrations
COMMENT=	DataMapper plugin for writing and speccing migrations
LICENSE=	mit

DEPENDS+=	${RUBY_PKGPREFIX}-dm-core>=1.2.0<1.3:../../databases/ruby-dm-core

.include "../../lang/ruby/gem.mk"
.include "../../mk/bsd.pkg.mk"
