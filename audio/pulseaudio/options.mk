# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.pulseaudio
PKG_SUPPORTED_OPTIONS=	avahi
PKG_SUGGESTED_OPTIONS=	avahi
PLIST_VARS+=		${PKG_SUPPORTED_OPTIONS}
.include "../../mk/bsd.options.mk"

###
### avahi
###
.if !empty(PKG_OPTIONS:Mavahi)
.include "../../net/avahi/buildlink3.mk"
PLIST.avahi=		yes
.else
CONFIGURE_ARGS+=	--disable-avahi
.endif
