# $NetBSD: Makefile,v 1.29 2012/10/03 21:55:16 wiz Exp $

DISTNAME=	Module-Install-1.06
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
SVR4_PKGNAME=	p5moi
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Module/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Module-Install/
COMMENT=	Perl5 module for building and installing Perl modules
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	{perl>=5.10.1,p5-Archive-Tar>=1.44}:../../archivers/p5-Archive-Tar
DEPENDS+=	{perl>=5.10.1,p5-Devel-PPPort>=3.16}:../../devel/p5-Devel-PPPort
DEPENDS+=	{perl>=5.10.1,p5-ExtUtils-Install>=1.52}:../../devel/p5-ExtUtils-Install
DEPENDS+=	{perl>=5.10.1,p5-ExtUtils-ParseXS>=2.19}:../../devel/p5-ExtUtils-ParseXS
DEPENDS+=	p5-File-Remove>=1.42:../../sysutils/p5-File-Remove
DEPENDS+=	p5-JSON>=2.14:../../converters/p5-JSON
DEPENDS+=	p5-libwww>=5.812:../../www/p5-libwww
DEPENDS+=	{perl>=5.10.0,p5-Module-Build>=0.2808}:../../devel/p5-Module-Build
DEPENDS+=	{perl>=5.10.1,p5-Module-CoreList>=2.17}:../../devel/p5-Module-CoreList
DEPENDS+=	p5-Module-ScanDeps>=0.89:../../devel/p5-Module-ScanDeps
DEPENDS+=	p5-PAR-Dist>=0.29:../../devel/p5-PAR-Dist
DEPENDS+=	{perl>=5.10.1,p5-Parse-CPAN-Meta>=1.39}:../../devel/p5-Parse-CPAN-Meta
DEPENDS+=	p5-YAML-Tiny>=1.38:../../textproc/p5-YAML-Tiny

PERL5_PACKLIST=		auto/Module/Install/.packlist
PERL5_MODULE_TYPE=	Module::Install::Bundled

INSTALL_MAKE_FLAGS+=	VENDORARCHEXP=${DESTDIR}${PERL5_INSTALLVENDORARCH}

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
