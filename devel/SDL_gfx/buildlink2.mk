# $NetBSD: buildlink2.mk,v 1.2 2002/08/25 19:22:19 jlam Exp $

.if !defined(SDL_GFX_BUILDLINK2_MK)
SDL_GFX_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=		SDL_gfx
BUILDLINK_DEPENDS.SDL_gfx?=	SDL_gfx>=2.0.3nb1
BUILDLINK_PKGSRCDIR.SDL_gfx?=	../../devel/SDL_gfx

EVAL_PREFIX+=			BUILDLINK_PREFIX.SDL_gfx=SDL_gfx

BUILDLINK_PREFIX.SDL_gfx_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.SDL_gfx=	include/SDL_framerate.h
BUILDLINK_FILES.SDL_gfx+=	include/SDL_gfxPrimitives.h
BUILDLINK_FILES.SDL_gfx+=	include/SDL_gfxPrimitives_font.h
BUILDLINK_FILES.SDL_gfx+=	include/SDL_imageFilter.h
BUILDLINK_FILES.SDL_gfx+=	include/SDL_rotozoom.h
BUILDLINK_FILES.SDL_gfx+=	lib/libSDL_gfx.*

.include "../../devel/SDL/buildlink2.mk"

BUILDLINK_TARGETS+=	SDL_gfx-buildlink

SDL_gfx-buildlink: _BUILDLINK_USE

.endif	# SDL_GFX_BUILDLINK2_MK
