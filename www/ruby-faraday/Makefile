# $NetBSD: Makefile,v 1.3 2013/02/27 01:30:32 obache Exp $

DISTNAME=	faraday-0.8.7
CATEGORIES=	www

MAINTAINER=	obache@NetBSD.org
HOMEPAGE=	https://github.com/lostisland/faraday
COMMENT=	HTTP/REST API client library
LICENSE=	mit

DEPENDS+=	${RUBY_PKGPREFIX}-multipart-post>=1.1:../../www/ruby-multipart-post

# multipart-post-1.2 is just Ruby-2.0 support bump.
OVERRIDE_GEMSPEC+=	multipart-post>=1.1

.include "../../lang/ruby/gem.mk"
.include "../../mk/bsd.pkg.mk"
