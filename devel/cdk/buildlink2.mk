# $NetBSD: buildlink2.mk,v 1.5 2003/09/28 09:13:56 jlam Exp $

.if !defined(CDK_BUILDLINK2_MK)
CDK_BUILDLINK2_MK=     # defined

BUILDLINK_DEPENDS.cdk?=		cdk>=4.9.9nb1
BUILDLINK_PKGSRCDIR.cdk?=	../../devel/cdk

.if defined(USE_CDK)
_NEED_CDK=		YES
.elif exists(/usr/include/cdk/cdk.h)
_NEED_CDK=		NO
.else
_NEED_CDK=		YES
.endif

.if defined(BUILDLINK_PREFER_PKGSRC)
.  if empty(BUILDLINK_PREFER_PKGSRC) || \
      !empty(BUILDLINK_PREFER_PKGSRC:M[yY][eE][sS]) || \
      !empty(BUILDLINK_PREFER_PKGSRC:Mcdk)
_NEED_CDK=	YES
.  endif
.endif

.if ${_NEED_CDK} == "YES"
BUILDLINK_PACKAGES+=		cdk
EVAL_PREFIX+=			BUILDLINK_PREFIX.cdk=cdk
BUILDLINK_PREFIX.cdk_DEFAULT=	${LOCALBASE}
.else
BUILDLINK_PREFIX.cdk=		/usr
.endif

BUILDLINK_FILES.cdk=	include/cdk/*.h
BUILDLINK_FILES.cdk+=	lib/libcdk.*

.include "../../devel/ncurses/buildlink2.mk"

BUILDLINK_TARGETS+=	cdk-buildlink

cdk-buildlink: _BUILDLINK_USE

.endif  # CDK_BUILDLINK2_MK
