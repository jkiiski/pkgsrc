# $NetBSD$

BUILDLINK_TREE+=	netcdf-fortran

.if !defined(NETCDF_FORTRAN_BUILDLINK3_MK)
NETCDF_FORTRAN_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.netcdf-fortran+=	netcdf-fortran>=4.2
BUILDLINK_PKGSRCDIR.netcdf-fortran?=	../../devel/netcdf-fortran

.include "../../devel/netcdf/buildlink3.mk"
.endif	# NETCDF_FORTRAN_BUILDLINK3_MK

BUILDLINK_TREE+=	-netcdf-fortran
