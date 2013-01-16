# $NetBSD: dist.mk,v 1.1 2013/01/10 16:17:09 ryoon Exp $
#
# used by devel/xulrunner17/Makefile
# used by www/firefox17/Makefile

DISTNAME=	firefox-${FIREFOX_VER}.source
FIREFOX_VER=	${MOZ_BRANCH}${MOZ_BRANCH_MINOR}
MOZ_BRANCH=	17.0.2
MOZ_BRANCH_MINOR=	esr
MASTER_SITES=	${MASTER_SITE_MOZILLA_ESR:=firefox/releases/${FIREFOX_VER}/source/} \
		${MASTER_SITE_MOZILLA_ALL:=firefox/releases/${FIREFOX_VER}/source/}
EXTRACT_SUFX=	.tar.bz2

DISTINFO_FILE=	${.CURDIR}/../../devel/xulrunner17/distinfo
PATCHDIR=	${.CURDIR}/../../devel/xulrunner17/patches

DIST_SUBDIR=	firefox17.0.2esr

WRKSRC=		${WRKDIR}/mozilla-esr17