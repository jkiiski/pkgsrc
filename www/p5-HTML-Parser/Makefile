# $NetBSD: Makefile,v 1.56 2012/10/03 21:58:44 wiz Exp $

DISTNAME=		HTML-Parser-3.69
PKGNAME=		p5-${DISTNAME}
PKGREVISION=		1
SVR4_PKGNAME=		p5hpa
CATEGORIES=		www perl5
MASTER_SITES=		${MASTER_SITE_PERL_CPAN:=HTML/}

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://search.cpan.org/dist/HTML-Parser/
COMMENT=		Perl5 module to parse HTML text documents
LICENSE=		${PERL5_LICENSE}

PKG_INSTALLATION_TYPES=	overwrite pkgviews

DEPENDS+=		p5-HTML-Tagset>=3.0:../../www/p5-HTML-Tagset
DEPENDS+=		p5-URI-[0-9]*:../../www/p5-URI
# needed for HTTP/Headers self-test, but this would create a circular
# dependency -- weird.
#DEPENDS+=		p5-libwww-[0-9]*:../../www/p5-libwww

USE_LANGUAGES=		c

PERL5_PACKLIST=		auto/HTML/Parser/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
