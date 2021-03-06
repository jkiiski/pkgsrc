# $NetBSD: Makefile,v 1.67 2012/10/25 06:55:52 asau Exp $
#

DISTNAME=	groff-1.20.1
PKGREVISION=	9
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GNU:=groff/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.gnu.org/software/groff/groff.html
COMMENT=	GNU roff text processing suite
LICENSE=	gnu-gpl-v3

CONFLICTS=		mdocml-[0-9]* ja-groff-[0-9]*

CHECK_PERMS=		NO
MAKE_JOBS_SAFE=		NO

INSTALLATION_DIRS=	share/groff/site-tmac

USE_LANGUAGES=		c c++
GNU_CONFIGURE=		YES
CONFIGURE_ENV+=		PERLPATH=${PERL5:Q}
USE_TOOLS+=		perl:run sed:run awk:run
USE_FEATURES=		getopt_long

INFO_FILES=		YES

REPLACE_AWK+=		font/devlj4/generate/special.awk
REPLACE_PERL+=		contrib/groffer/perl/func.pl
REPLACE_PERL+=		contrib/groffer/perl/groffer.pl
REPLACE_PERL+=		contrib/groffer/perl/man.pl
REPLACE_PERL+=		contrib/groffer/perl/perl_test.pl
REPLACE_PERL+=		contrib/groffer/perl/roff2.pl
REPLACE_PERL+=		src/roff/grog/grog.pl

REPLACE_INTERPRETER+=	sed
REPLACE.sed.old=	.*/sed
REPLACE.sed.new=	${SED}
REPLACE_FILES.sed+=	font/devps/generate/symbol.sed

.include "options.mk"

PLIST_SRC+=		${WRKDIR}/PLIST-local
PLIST_SRC+=		PLIST

.include "../../mk/bsd.prefs.mk"

BUILD_DEFS+=	PAPERSIZE
.if defined(PAPERSIZE)
CONFIGURE_ENV+=	PAGE=${PAPERSIZE:Q}
.endif

.include "../../mk/compiler.mk"
.if !empty(CC_VERSION:Mgcc-4.[6-9].*)
CFLAGS.SunOS+=		-std=c99 -D_XOPEN_SOURCE=600
.endif

# Usually the mdoc.local "volume-operating-system" definition is for
# the operating system name often displayed on top of man pages. And
# "operating-system" is for the default .Os value (operating system
# and version/release) and is usually displayed at bottom of man page.
# XXX Use "pkgsrc" as default .Os value.
# Also, avoid having pre-patched groff.info-2 installed (install uses wildcard)
post-patch:
	${SED}	-e "s,@@VOLUME_OPERATING_SYSTEM@@,${OPSYS},g"	\
		-e "s,@@OPERATING_SYSTEM@@,pkgsrc,g"	\
		${FILESDIR}/mdoc.local > ${WRKDIR}/mdoc.local
	${RM} ${WRKSRC}/doc/groff.info-2.orig

# Groff installs its own man and ms macros as mgan and mgs if the
# configure script thinks replacing the system ones is not safe. Since
# this depends heavily on exactly what the system macros are, each
# vendor OS is likely to be different and possibly differ by version.
#
# It also installs wrappers around the system macros for a variety of
# other traditional macro packages, if those macros don't have an FSF
# copyright.

post-install:
	${INSTALL_DATA} ${WRKDIR}/mdoc.local \
		${DESTDIR}${PREFIX}/share/groff/site-tmac
	${FIND} ${DESTDIR}${PREFIX}/lib/groff/site-tmac -type f -print | \
		${SED} 's;${DESTDIR}${PREFIX}/;;g' > ${WRKDIR}/PLIST-local
	${RUN}set -e; for f in an.tmac m.tmac mm.tmac mmse.tmac		\
	  mse.tmac s.tmac; do						\
	  for p in "" g; do						\
	    line="share/groff/${PKGVERSION_NOREV}/tmac/$$p$$f";		\
	    if [ -e "${DESTDIR}${PREFIX}/$$line" ]; then		\
	      break;							\
	    fi;								\
	  done;								\
	  ${ECHO} "$$line" >> ${WRKDIR}/PLIST-local;			\
	done

USE_TOOLS+=             makeinfo

# we only want the charset.alias file, so no buildlinkery for libiconv
DEPENDS+=	libiconv-[0-9]*:../../converters/libiconv
.include "../../mk/bsd.pkg.mk"
