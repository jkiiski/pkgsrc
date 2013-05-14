# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.geeqie
PKG_SUPPORTED_OPTIONS=	libchamplain
PKG_SUGGESTED_OPTIONS=	libchamplain

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mlibchamplain)
CONFIGURE_ARGS+=	--enable-gps
.include "../../geography/libchamplain04/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-gps
.endif
