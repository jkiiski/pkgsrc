# $NetBSD: Makefile,v 1.21 2013/02/06 23:23:47 jperkin Exp $

PKGNAME=		${DISTNAME:S/-/-clientonly-/}
COMMENT=		The Network Backup Solution (client only)

PKGREVISION=		2

CONFLICTS=		bacula-[0-9]* bacula-client-[0-9]*

DISTINFO_FILE=		${.CURDIR}/../../sysutils/bacula/distinfo
PATCHDIR=		${.CURDIR}/../../sysutils/bacula/patches
FILESDIR=		${.CURDIR}/../../sysutils/bacula/files

PLIST_SRC=		${.CURDIR}/../../sysutils/bacula/PLIST.common

CONFIGURE_ARGS+=	--enable-client-only

OWN_DIRS_PERMS+=	${BACULA_WORKINGDIR} root ${BACULA_GROUP} 770

PKG_GROUPS=		${BACULA_GROUP}

CONF_FILES+=		${EXAMPLESDIR}/bacula-fd.conf ${PKG_SYSCONFDIR}/bacula-fd.conf
CONF_FILES+=		${EXAMPLESDIR}/bconsole.conf ${PKG_SYSCONFDIR}/bconsole.conf

RCD_SCRIPTS=		bacula-fd

.include "../../sysutils/bacula/Makefile.common"

post-install:
	${INSTALL_DATA} ${WRKSRC}/src/dird/query.sql ${DESTDIR}${PREFIX}/libexec/bacula/query.sql

.include "options.mk"

.include "../../mk/bsd.pkg.mk"
