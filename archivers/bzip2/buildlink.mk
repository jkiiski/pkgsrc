# $NetBSD: buildlink.mk,v 1.7 2002/08/07 06:10:32 jlam Exp $
#
# This Makefile fragment is included by packages that use bzip2.
#
# To use this Makefile fragment, simply:
#
# (1) Optionally define BUILDLINK_DEPENDS.bzip2 to the dependency pattern
#     for the version of bzip2 desired.
# (2) Include this Makefile fragment in the package Makefile,
# (3) Add ${BUILDLINK_DIR}/include to the front of the C preprocessor's header
#     search path, and
# (4) Add ${BUILDLINK_DIR}/lib to the front of the linker's library search
#     path.

.if !defined(BZIP2_BUILDLINK_MK)
BZIP2_BUILDLINK_MK=	# defined

.include "../../mk/bsd.buildlink.mk"

BUILDLINK_DEPENDS.bzip2?=	bzip2>=1.0.1

.if defined(USE_BZIP2)
_NEED_BZIP2=		YES
.else
.  if exists(/usr/include/bzlib.h)
#
# Recent versions of the libbz2 API prefix all functions with "BZ2_".
#
_BUILTIN_BZIP2!=	${EGREP} -c "BZ2_" /usr/include/bzlib.h || ${TRUE}
.  else
_BUILTIN_BZIP2=		0
.  endif
.  if ${_BUILTIN_BZIP2} == "0"
_NEED_BZIP2=		YES
.  else
_NEED_BZIP2=		NO
.  endif
#
# This catch-all for SunOS is probably too broad, but better to err on
# the safe side.  We can narrow down the match when we have better
# information.
#
_INCOMPAT_BZIP2=	SunOS-*-*
INCOMPAT_BZIP2?=	# empty
.  for _pattern_ in ${_INCOMPAT_BZIP2} ${INCOMPAT_BZIP2}
.    if !empty(MACHINE_PLATFORM:M${_pattern_})
_NEED_BZIP2=		YES
.    endif
.  endfor
.endif

.if ${_NEED_BZIP2} == "YES"
DEPENDS+=	${BUILDLINK_DEPENDS.bzip2}:../../archivers/bzip2
EVAL_PREFIX+=	BUILDLINK_PREFIX.bzip2=bzip2
BUILDLINK_PREFIX.bzip2_DEFAULT=	${LOCALBASE}
.else
BUILDLINK_PREFIX.bzip2=		/usr
.endif

BUILDLINK_FILES.bzip2=		include/bzlib.h
BUILDLINK_FILES.bzip2+=		lib/libbz2.*

BUILDLINK_TARGETS.bzip2=	bzip2-buildlink
BUILDLINK_TARGETS+=		${BUILDLINK_TARGETS.bzip2}

pre-configure: ${BUILDLINK_TARGETS.bzip2}
bzip2-buildlink: _BUILDLINK_USE

.endif	# BZIP2_BUILDLINK_MK
