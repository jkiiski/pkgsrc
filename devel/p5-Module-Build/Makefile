# $NetBSD: Makefile,v 1.35 2012/10/31 11:18:30 asau Exp $

DISTNAME=	Module-Build-0.4004
PKGNAME=	p5-${DISTNAME}0
SVR4_PKGNAME=	p5mob
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Module/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Module-Build/
COMMENT=	Build and install Perl modules
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	{perl>=5.14.1,p5-ExtUtils-CBuilder>=0.27}:../../devel/p5-ExtUtils-CBuilder
DEPENDS+=	{perl>=5.14.1,p5-ExtUtils-ParseXS>=2.21}:../../devel/p5-ExtUtils-ParseXS
DEPENDS+=	{perl>=5.10.1,p5-PathTools>=3.30}:../../devel/p5-PathTools

.include "options.mk"

USE_LANGUAGES=	c	# For the tests
#BUILDING_MODULE_BUILD=	yes
PERL5_MODULE_TYPE=	Module::Build
PERL5_PACKLIST=		auto/Module/Build/.packlist
# For the tests:
USE_TOOLS+=	perl

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
