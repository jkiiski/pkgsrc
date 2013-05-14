# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.gst-plugins0.10-good
PKG_SUPPORTED_OPTIONS=	gconf
PKG_SUGGESTED_OPTIONS=	gconf

.include "../../mk/bsd.options.mk"

PLIST_VARS+=		gconf

.if !empty(PKG_OPTIONS:Mgconf)
PLIST.gconf=		yes
CONFIGURE_ARGS+=	--enable-gconf
CONFIGURE_ARGS+=	--enable-gconftool
.include "../../devel/GConf/schemas.mk"
.endif
