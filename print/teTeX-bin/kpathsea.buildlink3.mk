# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
TETEX_BIN_BUILDLINK3_MK:=	${TETEX_BIN_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	teTeX-bin
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:NteTeX-bin}
BUILDLINK_PACKAGES+=	teTeX-bin

.if !empty(TETEX_BIN_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.teTeX-bin+=	teTeX-bin>=2.0.2
BUILDLINK_PKGSRCDIR.teTeX-bin?=	../../print/teTeX-bin

.endif	# TETEX_BIN_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
