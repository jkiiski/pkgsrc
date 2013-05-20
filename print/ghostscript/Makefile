# $NetBSD$
#

# XXX The version number is the last one before the agpl change.
DISTNAME=	ghostscript-9.05
PKGREVISION=	4
CATEGORIES=	print meta-pkgs
MASTER_SITES=	# empty

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	Meta-package for installing the preferred ghostscript version

META_PACKAGE=	yes

PKG_OPTIONS_VAR=		PKG_OPTIONS.gs_type
PKG_OPTIONS_OPTIONAL_GROUPS=	ghostscript
PKG_OPTIONS_GROUP.ghostscript+=	ghostscript-agpl ghostscript-gpl
PKG_SUGGESTED_OPTIONS+=		ghostscript-gpl

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "Minix"
SUBST_CLASSES+=		lzconfig
SUBST_STAGE.lzconfig=	post-extract
SUBST_MESSAGE.lzconfig=	Forcing -lz in configure for libtiff check
SUBST_FILES.lzconfig=	configure
SUBST_SED.lzconfig=	-e "s/^LIBS=.-ltiff -ljpeg/& -lz /"

# no dlopen
CONFIGURE_ENV+=		ac_cv_lib_dl_dlopen=no

# hidden library dependencies
LDFLAGS+=		-lfontconfig   -lexpat -liconv -lfreetype -lz

.include "../../textproc/expat/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../fonts/fontconfig/buildlink3.mk"
.endif

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mghostscript-agpl)
DEPENDS+=	ghostscript-agpl-[0-9]*:../../print/ghostscript-agpl
.elif !empty(PKG_OPTIONS:Mghostscript-gpl)
DEPENDS+=	ghostscript-gpl-[0-9]*:../../print/ghostscript-gpl
.endif

.include "../../mk/bsd.pkg.mk"
