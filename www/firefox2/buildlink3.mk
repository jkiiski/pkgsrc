# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
FIREFOX2_BUILDLINK3_MK:=		${FIREFOX2_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=		firefox2
.endif

BUILDLINK_PACKAGES:=		${BUILDLINK_PACKAGES:Nfirefox2}
BUILDLINK_PACKAGES+=		firefox2
BUILDLINK_ORDER:=		${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}firefox2

.if !empty(FIREFOX2_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.firefox2+=	firefox2>=2.0
BUILDLINK_ABI_DEPENDS.firefox2+=	firefox2>=2.0
BUILDLINK_PKGSRCDIR.firefox2?=	../../www/firefox2
.endif	# FIREFOX2_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
