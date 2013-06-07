#!/bin/sh

# This script tries to optimise time building for jailed pbulk builds
# at the expense of some disk space.
#
# this will create the following hierarchy (assuming defaults) :
# /usr/pbulk
# /usr/pbulk/root-minix:	Pristine minix rootfs
# /usr/pbulk/root-bootstrap:	Pristine minix + bootstrapped pbulk tools
# /usr/pbulk/root:		Root system with build pkgsrc.
#
# Upon successful completion the following will be copied into:
# /usr/pbulk/YYYYMMDD-HHmmss.logs     pbulk-log files
# /usr/pbulk/YYYYMMDD-HHmmss.packages generated packages
# /usr/pbulk/YYYYMMDD-HHmmss.disfiles fetched distfiles
#

# Exit at the first error
set -e

# Some useful constant
YES="yes"
NO="no"

# Defaults
: ${TOPDIR=/usr/pbulk}
: ${SAVEDIR=${TOPDIR}}
: ${ROOT_BOOTSTRAP=${TOPDIR}/root-bootstrap}
: ${ROOT_MINIX=${TOPDIR}/root-minix}
: ${ROOT_PBULK=${TOPDIR}/root}
: ${ROOT_PKGSRC=/usr/pkgsrc}
: ${DISTFILESDIR=/usr/pkgsrc/distfiles}
: ${CMD_RELEASE=/usr/src/releasetools/release.sh}
: ${OPTS_RELEASE=" -c -p "} # Additional parameter to the releace script

# By default copy the local pkgsrc repository
: ${PKGSRC_COPY=${YES}}
: ${PKGSRC=pkgsrc}
: ${PKGSRC_URL=git://git.minix3.org/pkgsrc.git}
: ${PKGSRC_BRANCH=minix-master}
# Destination pkgsrc git
: ${PKGSRC_GIT=${ROOT_BOOTSTRAP}/${ROOT_PKGSRC}/.git}

# Add gcc to the jail, as clang is not support for now
: ${PACKAGES_REPO="http://www.minix3.org/pkgsrc/packages/`uname -r`/`uname -m`/All"}
: ${PACKAGES="gmp mpfr gcc44"}

# By default re-use root FS if available
: ${BUILD_ROOT_BOOTSTRAP=${NO}}
: ${BUILD_ROOT_MINIX=${NO}}
: ${BUILD_ROOT_PBULK=${NO}}

# By default copy to a safe place the generated packages, distfiles and logs
: ${SAVE_PACKAGES=${YES}}
: ${SAVE_DISTFILES=${YES}}
: ${SAVE_LOGS=${YES}}

# Use tools through variables, ease the debug process
: ${DRY_RUN=${NO}}

# Some private variables which may used from within the chroots
: ${BOOTSTRAP_PREFIX=/usr/pbulk}
: ${CMD_BOOTSTRAP=./bootstrap/bootstrap}
: ${CMD_BOOTSTRAP_CLEANUP=./bootstrap/cleanup}

# Generate a clean PATH for the jails.
CHROOT_PATH=""
for d in ${BOOTSTRAP_PREFIX} /usr/pkg /usr/pkg.sys /usr '' /usr/pkg.sys/gcc44
do
	CHROOT_PATH=${CHROOT_PATH}:${d}/bin:${d}/sbin
done
LD_CHROOT_PATH=/usr/lib:/lib:/usr/pkg.sys/lib

#============================================================================
if [ ${DRY_RUN} = ${YES} ]
then
	RM='echo ##: rm '
	MV='echo ##: mv '
	CP='echo ##: cp '
	CD='echo ##: cd '
	LN='echo ##: ln '
	SED='echo ##: sed '
	CHROOT='echo ##: chroot '
	MKDIR='echo ##: mkdir '
	TAR='echo ##: tar '
	EXPORT='echo ##: export '
	PKG_ADD='echo ##: pkg_add '
	SYNCTREE='echo ##: synctree '
	GIT='echo ##: git '
	BMAKE='echo ##: bmake '
	CMD_RELEASE="echo ##: ${CMD_RELEASE} "
	CMD_BOOTSTRAP="echo ##: ${CMD_BOOTSTRAP} "
	CMD_BOOTSTRAP_CLEANUP="echo ##: ${CMD_BOOTSTRAP_CLEANUP} "
	CMD_RESET="echo ##: echo '' > /usr/pbulk-logs/meta/error "
	CMD_BULKBUILD="echo ##: bulkbuild "
	CMD_BULKBUILD_RESTART="echo ##: bulkbuild-restart "

	DIRNAME='echo _dirname_ '
	# Kind of an exception, but as it used to collect
	# all the output of a phase, we want it to be echoed,
	# instead of saved in a log file
	TEE="cat - "
else
	RM='rm '
	MV='mv '
	CP='cp '
	CD='cd '
	LN='ln '
	SED='sed '
	DIRNAME='dirname '
	CHROOT='chroot '
	MKDIR='mkdir '
	TAR='tar '
	EXPORT='export '
	PKG_ADD='pkg_add '
	SYNCTREE='synctree '
	GIT='git '
	BMAKE='bmake '
	TEE='tee '
	CMD_RESET="echo '' > /usr/pbulk-logs/meta/error "
	CMD_BULKBUILD="bulkbuild "
	CMD_BULKBUILD_RESTART="bulkbuild-restart "
fi

# Check at which step which should start :
[ ! -d "${ROOT_MINIX}" ] && BUILD_ROOT_MINIX=${YES}
[ ! -d "${ROOT_BOOTSTRAP}" ] && BUILD_ROOT_BOOTSTRAP=${YES}
[ ! -d "${ROOT_PBULK}" ] && BUILD_ROOT_PBULK=${YES}

# Ensure that all the steps following the first to be generated
# are also re-generated.
[ ${BUILD_ROOT_MINIX} = ${YES} ] && BUILD_ROOT_BOOTSTRAP=${YES}
[ ${BUILD_ROOT_BOOTSTRAP} = ${YES} ] && BUILD_ROOT_PBULK=${YES}

#============================================================================
build_minix() {
	echo ":-> Building minix chroot in ${ROOT_MINIX}"
	(
		exec 2>&1
		set -e
	
		echo ":--> Building minix sources [${BUILD_START}]"
		${CD} $(${DIRNAME} ${CMD_RELEASE})
		${CMD_RELEASE} ${OPTS_RELEASE} \
			-j ${ROOT_MINIX} \
			-L ${PACKAGES_REPO}
	
		echo ":--> Copying device nodes"
		${TAR} -C /dev/ -cpf - . | ${TAR} -C ${ROOT_MINIX}/dev -pexf -
	
		echo ":--> Copying config files"
		for f in hosts resolv.conf
		do
			[ -f /etc/${f} ] && ${CP} /etc/${f} ${ROOT_MINIX}/etc/${f}
		done

		# Install some supplementary packages
		echo ":--> Installing the following packages:"
		echo ":--> $PACKAGES"
		echo ":--> from ${PACKAGES_REPO}"
		for f in ${PACKAGES}
		do
			echo ${PKG_ADD} -f -P ${ROOT_MINIX} ${PACKAGES_REPO}/${f}
			${PKG_ADD} -f -P ${ROOT_MINIX} ${PACKAGES_REPO}/${f}
		done
	) | ${TEE} ${TOPDIR}/1-build_minix.log
	echo ":-> Building minix chroot done"

	return 0
}

build_bootstrap() {
	echo ":-> Building bootstrapped chroot"
	(
		exec 2>&1
		set -e
		echo ":--> Initializing chroot in ${ROOT_BOOTSTRAP} [${BUILD_START}]"

		if [ ${PKGSRC_COPY} = ${YES} ]
		then
			echo ":--> Copying from ${ROOT_PKGSRC}"
			# Copy and use our local pkgsrc repository as it is
			${SYNCTREE} -f ${ROOT_PKGSRC} ${ROOT_BOOTSTRAP}/${ROOT_PKGSRC} >/dev/null
		else
			echo ":--> Cloning from ${PKGSRC_URL}/${PKGSRC_BRANCH}"
			# Copy our own pkgsrc repository there so the new repository
			# does not have to retrieve objects we already have
			${MKDIR} -p ${PKGSRC_GIT}
			${SYNCTREE} -f ${ROOT_PKGSRC}/.git ${PKGSRC_GIT} >/dev/null
			${GIT} --git-dir ${PKGSRC_GIT} remote rm ${PKGSRC}
			${GIT} --git-dir ${PKGSRC_GIT} remote add ${PKGSRC} ${PKGSRC_URL} 
			${GIT} --git-dir ${PKGSRC_GIT} fetch ${PKGSRC}
			${GIT} --git-dir ${PKGSRC_GIT} checkout -f ${PKGSRC}/${PKGSRC_BRANCH}
		fi

		# Bonus distfiles	
		echo ":--> Copying prefetched distfiles from ${DISTFILESDIR}"
		${SYNCTREE} -f ${DISTFILESDIR} ${ROOT_BOOTSTRAP}/${ROOT_PKGSRC}/distfiles >/dev/null

		# Ensure that the package directoy is clean and exists
		${RM} -rf ${ROOT_BOOTSTRAP}/${ROOT_PKGSRC}/packages/$(uname -r)/
		${MKDIR} -p ${ROOT_BOOTSTRAP}/${ROOT_PKGSRC}/packages/$(uname -r)/

		# Trim the .ifdef BSD_PKG_MK and .endif lines to make a "fragment"
		${SED} -e '/ifdef.*BSD_PKG_MK/d;$d' \
			${ROOT_BOOTSTRAP}/${ROOT_PKGSRC}/minix/mk.conf.minix \
			> ${ROOT_BOOTSTRAP}/${ROOT_PKGSRC}/minix/mk.conf.minix.frag

		echo ":--> Bootstrapping pbulk"
		${CHROOT} ${ROOT_BOOTSTRAP} sh -c \
		"(
			set -e
			${EXPORT} PATH=${CHROOT_PATH}
			${EXPORT} LD_LIBRARY_PATH=${LD_CHROOT_PATH}

			${CD} ${ROOT_PKGSRC}

			# Prepare the two confiugrations used during the bootstrap, phase

			# Trim the .ifdef BSD_PKG_MK and .endif lines to make a 'fragment'
			# and adapt a few path to the ones expected for pbulk
			${SED} \
				-e '/.*BSD_PKG_MK/d' \
				-e 's@LOCALBASE?=.*@LOCALBASE=	'${BOOTSTRAP_PREFIX}'@' \
				-e 's@VARBASE?=.*@VARBASE=	'${BOOTSTRAP_PREFIX}'/var@' \
				-e 's@PKG_DBDIR?=.*@PKG_DBDIR=	'${BOOTSTRAP_PREFIX}'/pkgdb@' \
				-e 's@WRKOBJDIR?=.*@WRKOBJDIR=	'${BOOTSTRAP_PREFIX}'/work@' \
				${ROOT_PKGSRC}/minix/mk.conf.minix \
				> ${ROOT_PKGSRC}/minix/mk.conf.minix.pbulk

			# Trim the .ifdef BSD_PKG_MK and .endif lines to make a 'fragment'
			${SED} -e '/.*BSD_PKG_MK/d' \
				${ROOT_PKGSRC}/minix/mk.conf.minix \
				> ${ROOT_PKGSRC}/minix/mk.conf.minix.pbulk.frag

			# First stage of the bootstrap
			${CMD_BOOTSTRAP} \
				--prefix=${BOOTSTRAP_PREFIX} \
				--varbase=${BOOTSTRAP_PREFIX}/var \
				--pkgdbdir=${BOOTSTRAP_PREFIX}/pkgdb \
				--workdir=${BOOTSTRAP_PREFIX}/work \
				--mk-fragment=${ROOT_PKGSRC}/minix/mk.conf.minix.pbulk

			# Install pbulk into /usr/pbulk
			${BMAKE} -C pkgtools/pbulk package-install
			${SED} -e 's/OP_SYS_VER/'$(uname -r)'/g' minix/pbulk.conf > ${BOOTSTRAP_PREFIX}/etc/pbulk.conf

			echo ':--> Moving packages source directories to .sys versions'
			for d in /usr/pkg /usr/var
			do
				${MV} \${d} \${d}.sys
				${MKDIR} -p \${d}
			done

			# Also fixup a few symlinks which points to pkg/bin
			${LN} -sf /usr/pkg.sys/bin/strip /usr/bin/strip
			${LN} -sf /usr/pkg.sys/bin/clang /usr/bin/cc

			echo ':--> Bootstrap cleanup'
			${CMD_BOOTSTRAP_CLEANUP}

			echo ':--> Building binary pbulk kit'
                 	${CMD_BOOTSTRAP} \
				--varbase=/usr/var \
				--pkgdbdir=/usr/var/db/pkg \
				--mk-fragment=${ROOT_PKGSRC}/minix/mk.conf.minix.pbulk.frag \
				--gzip-binary-kit=${ROOT_PKGSRC}/bootstrap/bootstrap.tar.gz

			${RM} -rf /usr/pbulk-packages
			${RM} -rf ${ROOT_PKGSRC}/packages/$(uname -r)/

			# Use the same mk.conf that our users instead of the hybrid 
			# auto-generated mk.conf from bootstrap.
			${TAR} -C /tmp -xzf ${ROOT_PKGSRC}/bootstrap/bootstrap.tar.gz
			${CP} minix/mk.conf.minix /tmp/usr/pkg/etc/mk.conf
			${TAR} -C /tmp -hzcf ${ROOT_PKGSRC}/bootstrap/bootstrap.tar.gz usr
			${RM} -rf /tmp/usr
		)"

		echo ":--> Bootstrapping pbulk done"
		
	) | ${TEE} ${TOPDIR}/2-build_bootstrap.log
	echo ":-> Building bootstrapped chroot done"

	return 0
}

pbulk_start() {
	echo ":-> Building packages from scratch"
	(
		exec 2>&1
		set -e

		${CHROOT} ${ROOT_PBULK} sh -c \
		"(
			set -e
			${EXPORT} PATH=${CHROOT_PATH}
			${EXPORT} LD_LIBRARY_PATH=${LD_CHROOT_PATH}

			${CD} ${ROOT_PKGSRC}

			echo ':--> Starting build ['${BUILD_START}']'
			${CMD_BULKBUILD}
		)"
	) | ${TEE} ${TOPDIR}/3-pbulk.log
	echo ":-> Building packages from scratch done"

	return 0
}

pbulk_restart() {
	echo ":-> Building packages from previous build"
	(
		exec 2>&1
		set -e

		${CHROOT} ${ROOT_PBULK} sh -c \
		"(
			set -e
			${EXPORT} PATH=${CHROOT_PATH}
			${EXPORT} LD_LIBRARY_PATH=${LD_CHROOT_PATH}

			${CD} ${ROOT_PKGSRC}

			echo ':--> Resetting error file'
			${CMD_RESET_ERRORS}

			echo ':--> Restarting build ['${BUILD_START}']'
			${CMD_BULKBUILD_RESTART}
		)"
	) | ${TEE} ${TOPDIR}/3-pbulk.log

	echo ":-> Building packages from previous build done"
}

#============================================================================
# Initializations are done, start applying the requested actions on the system

BUILD_START=$(date)
echo -e "\n:: pbulk started on ${BUILD_START}"

if [ ${BUILD_ROOT_MINIX} = ${YES} ]
then
	echo -e "\n:> Generating minix root fs."
	${RM} -rf ${ROOT_MINIX}

	# Ensure presence of destination directory
	${MKDIR} -p ${ROOT_MINIX}

	build_minix
fi

if [ ${BUILD_ROOT_BOOTSTRAP} = ${YES} ]
then
	echo -e "\n:> Bootstrapping pkgsrc."
	${RM} -rf ${ROOT_BOOTSTRAP}
	${MKDIR} -p $(${DIRNAME} ${ROOT_BOOTSTRAP})
	${CP} -pr ${ROOT_MINIX} ${ROOT_BOOTSTRAP}

	build_bootstrap
fi

if [ ${BUILD_ROOT_PBULK} = ${YES} ]
then
	echo -e "\n:> Initializing pbulk root."
	${RM} -rf ${ROOT_PBULK}
	${MKDIR} -p $(${DIRNAME} ${ROOT_PBULK})
	${CP} -pr ${ROOT_BOOTSTRAP} ${ROOT_PBULK}

	echo -e "\n:> Building packages from scratch."
	pbulk_start
else
	# We want to re-use a previous pbulk.
	echo -e "\n:> Restarting build of packages."
	pbulk_restart
fi

_build_end=$(date '+%Y%m%d%H%M.%S')
BUILD_END=$(date -j ${_build_end})

# We have to do this here, otherwise the date field would be empty
: ${TIMESTAMP=$(date -j '+%Y%m%d-%H%M%S' ${_build_end})}
: ${ROOT_LOGS=${SAVEDIR}/${TIMESTAMP}.logs}
: ${ROOT_DISTFILES=${SAVEDIR}/${TIMESTAMP}.distfiles}
: ${ROOT_PACKAGES=${SAVEDIR}/${TIMESTAMP}.packages}

if [ ${SAVE_LOGS} = ${YES} ]
then
	${MKDIR} -p ${ROOT_LOGS}
	${CP} -pfr ${ROOT_PBULK}/usr/pbulk-logs ${ROOT_LOGS}/
	${LN} -fs pbulk-logs/meta ${ROOT_LOGS}/meta
	${CP} -pfr ${TOPDIR}/1-build_minix.log ${ROOT_LOGS}/
	${CP} -pfr ${TOPDIR}/2-build_bootstrap.log ${ROOT_LOGS}/
	${CP} -pfr ${TOPDIR}/3-pbulk.log ${ROOT_LOGS}/
	${LN} -fs ${ROOT_LOGS} ${SAVEDIR}/latest.log
fi

if [ ${SAVE_DISTFILES} = ${YES} ]
then
	${CP} -pr ${ROOT_PBULK}/usr/pkgsrc/distfiles ${ROOT_DISTFILES}
fi

if [ ${SAVE_PACKAGES} = ${YES} ]
then
	${CP} -pr ${ROOT_PBULK}/usr/pkgsrc/packages ${ROOT_PACKAGES}
fi

echo -e "\n:: pbulk finished:"
echo ":>   started on  : ${BUILD_START}"
echo ":>   finished on : ${BUILD_END}"
echo ":> Build logs    : ${ROOT_LOGS}"
echo ":> Distfiles     : ${ROOT_DISTFILES}"
echo ":> Packages      : ${ROOT_PACKAGES}"
