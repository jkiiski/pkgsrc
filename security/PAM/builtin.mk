# $NetBSD: builtin.mk,v 1.1 2004/03/10 17:57:14 jlam Exp $

.if !defined(IS_BUILTIN.pam)
IS_BUILTIN.pam=	no
.  if exists(/usr/include/security/pam_appl.h)
IS_BUILTIN.pam=	yes
.  endif
.endif	# IS_BUILTIN.pam

USE_BUILTIN.pam?=	${IS_BUILTIN.pam}
