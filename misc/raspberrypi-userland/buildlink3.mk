# $NetBSD$

BUILDLINK_TREE+=	raspberrypi-userland

.if !defined(RASPBERRYPI_USERLAND_BUILDLINK3_MK)
RASPBERRYPI_USERLAND_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.raspberrypi-userland+=	raspberrypi-userland>=20130128
BUILDLINK_PKGSRCDIR.raspberrypi-userland?=	../../misc/raspberrypi-userland
.endif	# RASPBERRYPI_USERLAND_BUILDLINK3_MK

BUILDLINK_TREE+=	-raspberrypi-userland
