# $NetBSD: compiler.mk,v 1.1 2003/09/12 13:03:38 grant Exp $

# This Makefile fragment implements handling for supported
# C/C++/fortran compilers.
#
# The following variables are used:
#
# USE_GCC2
#	Use pkgsrc gcc2 from lang/gcc. This is a user-only variable
#	which must NOT be set in package Makefiles.
#
# USE_GCC3
#	Use pkgsrc gcc3 from lang/gcc3. This is a user-only variable
#	which must NOT be set in package Makefiles.
#
# USE_GCC_SHLIB
#	Indicates that a package uses GCC shared libraries, so we
#	register a runtime dependency on the compiler package.
#
# The following variables are reserved for future use:
#
# USE_MIPSPRO
#	Use the Silicon Graphics, Inc. MIPSpro compiler.
#
# USE_SUNPRO
#	Use the Sun Microsystems Inc. WorkShop/Forte/Sun ONE Studio
#	compiler collection.
#

.if !defined(COMPILER_MK)
COMPILER_MK=	# defined

.include "../../mk/bsd.prefs.mk"

.if defined(USE_GCC2) && empty(PKGPATH:Mlang/gcc) && empty(_PKGSRC_DEPS:Mgcc-2*)
GCC_REQD?=		2.95.3

# we need to define these early, as they are used by gcc/buildlink2.mk.
_GCC_SUBPREFIX=         gcc-2.95.3/
_GCC_ARCHDIR=           ${_GCC_PREFIX}${_GCC_ARCHSUBDIR}
_GCC_ARCHSUBDIR=        lib/gcc-lib/${MACHINE_GNU_PLATFORM}/2.95.3

.  if empty(USE_BUILDLINK2:M[nN][oO])
.    include "../lang/gcc/buildlink2.mk"
.  else
_GCC_PREFIX=            ${LOCALBASE}/${_GCC_SUBPREFIX}

# Packages that link against gcc shared libraries need a full
# dependency.
.    if defined(USE_GCC_SHLIB)
DEPENDS+=		gcc>=${GCC_REQD}:../../lang/gcc
LDFLAGS+=		-L${_GCC_ARCHDIR} -Wl,${RPATH_FLAG}${_GCC_ARCHDIR} -L${_GCC_PREFIX}lib -Wl,${RPATH_FLAG}${_GCC_PREFIX}lib
.    else
BUILD_DEPENDS+=		gcc>=${GCC_REQD}:../../lang/gcc
.    endif
.  endif
PATH:=			${_GCC_PREFIX}bin:${PATH}
CC=			${_GCC_PREFIX}bin/gcc
CPP=			${_GCC_PREFIX}bin/cpp
CXX=			${_GCC_PREFIX}bin/g++
F77=			${_GCC_PREFIX}bin/g77
PKG_FC=			${F77}

.elif defined(USE_GCC3) && empty(PKGPATH:Mlang/gcc3) && empty(_PKGSRC_DEPS:Mgcc-3*)
GCC_REQD?=		3.3

# we need to define these early, as they are used by gcc3/buildlink2.mk.
_GCC_SUBPREFIX=		gcc-3.3/
_GCC_ARCHDIR=		${_GCC_PREFIX}${_GCC_ARCHSUBDIR}

.  if empty(USE_BUILDLINK2:M[nN][oO])
.    include "../lang/gcc3/buildlink2.mk"
.  else
_GCC_PREFIX=		${LOCALBASE}/${_GCC_SUBPREFIX}
_GCC_LIBGCCDIR!= \
  dirname `${_GCC_PREFIX}bin/gcc --print-libgcc-file-name`
_GCC_ARCHSUBDIR= \
  ${_GCC_LIBGCCDIR:S|^${LOCALBASE}/${_GCC_SUBPREFIX}||}

# Packages that link against gcc shared libraries need a full
# dependency.
.    if defined(USE_GCC_SHLIB)
DEPENDS+=		gcc3>=${GCC_REQD}:../../lang/gcc3
LDFLAGS+=		-L${_GCC_ARCHDIR} -Wl,${RPATH_FLAG}${_GCC_ARCHDIR} -L${_GCC_PREFIX}lib -Wl,${RPATH_FLAG}${_GCC_PREFIX}lib
.    else
BUILD_DEPENDS+=		gcc3>=${GCC_REQD}:../../lang/gcc3
.    endif
.  endif
PATH:=			${_GCC_PREFIX}bin:${PATH}
CC=			${_GCC_PREFIX}bin/gcc
CPP=			${_GCC_PREFIX}bin/cpp
CXX=			${_GCC_PREFIX}bin/g++
F77=			${_GCC_PREFIX}bin/g77
PKG_FC=			${F77}
.endif	# USE_GCC3

.endif	# COMPILER_MK
