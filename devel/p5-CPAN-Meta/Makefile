# $NetBSD: Makefile,v 1.6 2012/10/31 11:17:42 asau Exp $

DISTNAME=	CPAN-Meta-2.130880
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=CPAN/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/CPAN-Meta/
COMMENT=	Perl module for handling the distribution metadata for a CPAN dist
LICENSE=	${PERL5_LICENSE}

# this is the meta data backend which used YAML/JSON to read ...
DEPENDS+=	p5-CPAN-Meta-Requirements>=2.121:../../devel/p5-CPAN-Meta-Requirements
DEPENDS+=	{perl>=5.17.1,p5-CPAN-Meta-YAML>=0.008}:../../devel/p5-CPAN-Meta-YAML
DEPENDS+=	p5-Parse-CPAN-Meta>=1.4403:../../devel/p5-Parse-CPAN-Meta
DEPENDS+=	{perl>=5.14.0,p5-version>=0.88}:../../devel/p5-version

PERL5_PACKLIST=		auto/CPAN/Meta/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
