# $NetBSD$

DISTNAME=		Git-Wrapper-0.028
PKGNAME=		p5-${DISTNAME}
CATEGORIES=		devel perl5
MASTER_SITES=		${MASTER_SITE_PERL_CPAN:=Git/}

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://search.cpan.org/dist/Git-Wrapper/
COMMENT=		Wrap git(7) command-line interface
LICENSE=		${PERL5_LICENSE}

BUILD_DEPENDS+=		p5-Env-Path-[0-9]*:../../devel/p5-Env-Path
BUILD_DEPENDS+=		p5-File-Path-[0-9]*:../../devel/p5-File-Path
BUILD_DEPENDS+=		p5-Test-Deep-[0-9]*:../../devel/p5-Test-Deep
BUILD_DEPENDS+=		p5-Test-Exception-[0-9]*:../../devel/p5-Test-Exception
BUILD_DEPENDS+=		p5-Test-Most-[0-9]*:../../devel/p5-Test-Most

DEPENDS+=		p5-File-Temp-[0-9]*:../../devel/p5-File-Temp
DEPENDS+=		p5-File-pushd-[0-9]*:../../devel/p5-File-pushd
DEPENDS+=		p5-IPC-Cmd-[0-9]*:../../devel/p5-IPC-Cmd
DEPENDS+=		p5-Sort-Versions-[0-9]*:../../devel/p5-Sort-Versions
DEPENDS+=		scmgit-base-[0-9]*:../../devel/scmgit-base

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/Git/Wrapper/.packlist

USE_TOOLS+=		perl

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
