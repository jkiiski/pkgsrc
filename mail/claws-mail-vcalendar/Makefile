# $NetBSD: Makefile,v 1.39 2013/02/06 23:22:41 jperkin Exp $
#

DISTNAME=	vcalendar-2.0.13
PKGNAME=	claws-mail-vcalendar-2.0.13
PKGREVISION=	8
CATEGORIES=	mail
MASTER_SITES=	http://claws-mail.org/downloads/plugins/

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	Enable vCalendar message handling

#PLIST_SRC+=	PLIST

DEPENDS+=	claws-mail-${CLAWS_VERSION}{,nb[0-9]*}:../../mail/claws-mail

.include "../../mk/bsd.prefs.mk"

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config gmake
USE_LANGUAGES+=	c

.include "../../mail/claws-mail/Makefile.vers"
.include "../../mail/claws-mail/buildlink3.mk"
.include "../../security/gnutls/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
