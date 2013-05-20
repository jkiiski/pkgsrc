#!/bin/sh

# Stop execution when an error occurs
set -e

# Certain certainties
RELEASE=/usr/src/releasetools/release.sh
PKGSRC=/usr/pkgsrc
PACKAGEURL="ftp://ftp.minix3.org/pub/minix/packages/`uname -r`/`uname -m`/All/"
PACKAGES="
	gmp mpfr gcc44
	scmgit-base
"
JAILROOTBASE=/usr/pbulk-jail
BRANCH=minix-master
REMOTE=pkgsrc
COPY=0
FSTYPE=mfs

# Jail-dependent vars
initvars() {
	# Where to build a pbulk jail
	if [ "$JAILDEV" ]
	then	umount $JAILDEV || true
		echo "mkfs.$FSTYPE $JAILDEV .."
		mkfs.$FSTYPE $JAILDEV
		JAILROOT=$JAILROOTBASE.`basename $JAILDEV`
		mkdir $JAILROOT || true
		mount $JAILDEV $JAILROOT
	else	JAILROOT=$JAILROOTBASE
	fi

	# Release script used to build the jailed system
	JAILPKGSRC=$JAILROOT/$PKGSRC
	PBULK_SH=$PKGSRC/minix/pbulk.sh
	JAILPBULK_SH=$JAILROOT/$PBULK_SH
}

# How to execute commands there
mychroot() {
	chroot $JAILROOT /bin/sh -c "$*"
}

my_help() {
	echo "Usage: "
	echo "  # pbulk-jail.sh [-d<dev>] [-t<fstype>] [-A] [-h] [-c]"
	echo " "
	echo "Jail options (USE THIS ORDER):"
	echo "  $0 -t<fstype> use mkfs.<fstype> for jail FS; e.g. mfs, ext2"
	echo "  $0 -c copy this pkgsrc tree instead of doing git clone"
	echo "  $0 -r<opts> pass <opts> to release script, e.g. -r-c"
	echo "  $0 -L<url> use <url> for packages; also -L<url> to jailopts"
	echo "  $0 -d<dev> mkfs and use <dev> for jail FS"
	echo " "
	echo "Jail actions (MUST BE LAST):"
	echo "  Wipe current jail, if any, build a new jail,"
	echo "  and run a full bulk build in it:"
	echo "  $0 -A"
	echo "  Keep current jail, retry the --build phase, skipping packages"
	echo "  that built successfully in the last run:"
	echo "  $0 -R"
}

makejail() {

	# Execute jail creating script that builds a new minix
	# in $JAILROOT from the latest git repository
	cd `dirname $RELEASE`
	sh `basename $RELEASE` $RELOPTS -j$JAILROOT -p

	return 0
}

makejailpkgsrc() {
        # Some guest preparation necessary for networking to work
	(cd /etc
		for f in hosts resolv.conf
		do	if [ -f $f ]
			then cp $f $JAILROOT/etc/
			fi
		done
	)
        (cd /dev && tar cf - . ) | (cd $JAILROOT/dev ; tar xf -)

	echo " * Installing packages $PACKAGES from $PACKAGEURL"
	for p in $PACKAGES
	do	echo $p ...
		pkg_add -f -P $JAILROOT $PACKAGEURL/$p
	done

	PKGSRCMODE=755
	mkdir -m $PKGSRCMODE -p $JAILPKGSRC

	if [ $COPY -eq 0 ]
	then	
		# copy our own pkgsrc repository there so the new repository
		# doesn't have to retrieve objects we already have
		GITDIR=$JAILPKGSRC/.git
		mkdir -m $PKGSRCMODE -p $GITDIR
		synctree -f $PKGSRC/.git $GITDIR >/dev/null
		(	cd $JAILPKGSRC
			git remote rm $REMOTE || true
			git remote add $REMOTE git://git.minix3.org/pkgsrc.git
			git fetch $REMOTE
			git checkout -f $REMOTE/$BRANCH
		)

		# bonus distfiles
		mkdir -p $PKGSRC/distfiles
		rsync -r $PKGSRC/distfiles/ $JAILPKGSRC/distfiles/ 
	else	# copy and use our local pkgsrc repository as it is
		synctree -f $PKGSRC $JAILPKGSRC >/dev/null
	fi

	return 0
}

retrybuild() {
	LOGFILE=jail.log
(
	echo "Redirecting output to $LOGFILE"
	exec 2>&1
	set -x
	echo " * Retrying the --build phase on existing jail."
	mychroot "cd `dirname $PBULK_SH` && sh `basename $PBULK_SH` --jailed --build"
) | tee $LOGFILE
	return 0
}

jailall() {
	LOGFILE=jail.log
(
	echo "Redirecting output to $LOGFILE"
	exec 2>&1
	set -x
	echo " * Building jail."
	makejail
	echo " * Building pkgsrc in jail."
	makejailpkgsrc
	echo " * Running bulk build."
	mychroot "cd `dirname $PBULK_SH` && sh `basename $PBULK_SH` --jailed --all"
) | tee $LOGFILE
	rsync -r $JAILPKGSRC/distfiles/ $PKGSRC/distfiles/ 
	echo "rsync -a $JAILPKGSRC/packages/ $USER@kits:/usr/local/www/docs/minix3/pkgsrc/packages/"
	echo "rsync -a $JAILROOT/usr/pbulk-logs/ $USER@kits:/usr/local/www/docs/minix3/pkgsrc/pbulk-logs/"
	echo "rsync -a $PKGSRC/distfiles/ $USER@kits:/usr/local/www/docs/minix3/distfiles-backup/"
	return 0
}

initvars

if which rsync >/dev/null
then	:
else	echo rsync not found
	exit 1
fi

while getopts "t:L:u:d:ARhr:cb:" opt
do
	case $opt in
	b) BRANCH=$OPTARG ;;
	t) FSTYPE=$OPTARG; echo fstpe $FSTYPE ;;
	c) COPY=1; ;;
	r) RELOPTS="$RELOPTS $OPTARG";;
	L) PACKAGEURL=$OPTARG; RELOPTS="$RELOPTS -L$PACKAGEURL";;
	d) JAILDEV=$OPTARG; initvars; ;;
	A) jailall; ;;
	R) retrybuild; ;;
	*) my_help; exit 1; ;;
	esac
done

exit 0
