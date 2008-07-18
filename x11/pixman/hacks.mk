# $NetBSD$
#
.if !defined(PIXMAN_HACKS_MK)
PIXMAN_HACKS_MK=	# empty
.  include "../../mk/compiler.mk"
###
### XXX SSE2 intrinsics require gcc-4.2+ to build.
###
.  if !empty(PKGSRC_COMPILER:Msunpro) || empty(CC_VERSION:Mgcc-4.2*)
CONFIGURE_ARGS+=	--disable-sse2
.  endif
.endif
