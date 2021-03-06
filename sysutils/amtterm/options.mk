# $NetBSD$
#

PKG_OPTIONS_VAR=	PKG_OPTIONS.amtterm
PKG_SUPPORTED_OPTIONS=	amtterm-gamt

.include "../../mk/bsd.options.mk"

PLIST_VARS+=		gamt

.if !empty(PKG_OPTIONS:Mamtterm-gamt)
.include "../../x11/gtk2/buildlink3.mk"
.include "../../x11/vte/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
PLIST.gamt=		yes
.endif
