# $NetBSD: Makefile,v 1.43 2013/02/12 13:55:48 sborrill Exp $

DISTNAME=	citrix_ica-10.6.115659
PKGREVISION=	2
CATEGORIES=	net
MASTER_SITES=	# empty

MAINTAINER=	sborrill@NetBSD.org
HOMEPAGE=	http://www.citrix.com/English/ss/downloads/results.asp?productID=186&c1=sot2755
COMMENT=	Citrix(R) ICA client for the Citrix(R) Presentation Server(TM)
LICENSE=	citrix_ica-license

RESTRICTED=		License prohibits redistribution
NO_SRC_ON_FTP=		${RESTRICTED}
NO_BIN_ON_FTP=		${RESTRICTED}
NO_SRC_ON_CDROM=	${RESTRICTED}
NO_BIN_ON_CDROM=	${RESTRICTED}

# "Abort Traps" indefinitely in pbulk
NOT_FOR_PLATFORM+=	DragonFly-*-*

EMUL_PLATFORMS=		linux-i386
EMUL_PLATFORMS+=	solaris-sparc
EMUL_PLATFORMS+=	solaris-i386
EMUL_MODULES.linux=	locale motif x11

PKG_DESTDIR_SUPPORT=	destdir

.include "../../mk/bsd.prefs.mk"

PATCH_ARCH=	${MACHINE_ARCH}
.if ${EMUL_PLATFORM} == "linux-i386"
DISTNAME=	en.linuxx86
PKGNAME=	citrix_ica-10.6.115659
PATCH_ARCH=	i386
MASTER_SITES=	ftp://download2.citrix.com/FILES/en/products/Linux10/
.elif ${EMUL_PLATFORM} == "solaris-sparc"
DISTNAME=	en.solaris
PKGNAME=	citrix_ica-8.63.165401
HOMEPAGE=	http://www.citrix.com/English/ss/downloads/details.asp?downloadId=1859901&productId=186&c1=sot2755
MASTER_SITES=	manual
EXTRACT_SUFX=	.tar.z
.elif ${EMUL_PLATFORM} == "solaris-i386"
DISTNAME=	en.solx86
PKGNAME=	citrix_ica-8.63.165401
HOMEPAGE=	http://www.citrix.com/English/ss/downloads/details.asp?downloadId=1859901&productId=186&c1=sot2755
MASTER_SITES=	manual
EXTRACT_SUFX=	.tar.z
.endif

WRKSRC=		${WRKDIR}
DIST_SUBDIR=	${PKGNAME_NOREV}

PLAIN_CDIR=	${PREFIX}/lib/ICAClient
CDIR=		${DESTDIR}${PLAIN_CDIR}
USE_TOOLS+=	patch

INSTALLATION_DIRS=	bin lib

.if ${MASTER_SITES} == "manual"
FETCH_MESSAGE=  "Please fetch ${DISTFILES} manually from"
FETCH_MESSAGE+= "${HOMEPAGE}"
FETCH_MESSAGE+= "and put into"
FETCH_MESSAGE+= "${DISTDIR}/${PKGNAME_NOREV}"
.endif

do-patch:
	(cd ${WRKSRC}; \
	for f in ${PATCHDIR}/patch-${PATCH_ARCH}-*;do \
	${PATCH} ${PATCH_ARGS} <$$f >/dev/null 2>&1 || ${TRUE}; \
	done)

do-build:
	${SED} s%DESTINATION%${CDIR}% ${FILESDIR}/response.${MACHINE_ARCH} \
		> ${WRKSRC}/response
	${SED} s%DESTINATION%${PLAIN_CDIR}% ${FILESDIR}/wfcmgr \
		> ${WRKSRC}/wfcmgr.x
	${SED} s%DESTINATION%${PLAIN_CDIR}% ${FILESDIR}/wfica \
		> ${WRKSRC}/wfica.x

pre-install:
	${RUN} if [ `${ID} -u` != 0 ]; then				\
		${ECHO} "";                                             \
		${ECHO} "*** ${PKGNAME} must be installed with"		\
			"superuser privileges ***";			\
		${ECHO} "";                                             \
		${FALSE};						\
	fi
	${RUN} if [ -d "${CDIR}" ]; then				\
		${ECHO} "";                                             \
		${ECHO} "*** Please remove ${CDIR} and try again ***";  \
		${ECHO} "";                                             \
		${FALSE};                                               \
	fi

do-install:
	cd ${WRKSRC} && ./setupwfc < response
	${INSTALL_SCRIPT} ${WRKSRC}/wfcmgr.x ${DESTDIR}${PREFIX}/bin/wfcmgr
	${INSTALL_SCRIPT} ${WRKSRC}/wfica.x ${DESTDIR}${PREFIX}/bin/wfica
	${SED} "s#/usr/lib/ICAClient#${PLAIN_CDIR}#g" \
		< ${CDIR}/util/icalicense.sh > ${CDIR}/util/icalicense.sh.fixed
	${MV} ${CDIR}/util/icalicense.sh.fixed ${CDIR}/util/icalicense.sh

post-install:
.for f in desktop/Citrix_PNA.desktop desktop/wfcmgr.desktop wfica.sh \
    wfica_assoc.sh
	sed -e s,${CDIR:Q},${PLAIN_CDIR:Q},g ${CDIR}/${f} > ${CDIR}/${f}.new
	mv ${CDIR}/${f}.new ${CDIR}/${f}
.endfor

.include "../../mk/bsd.pkg.mk"
