--- libltdl/m4/libtool.m4.orig	2011-10-17 10:17:05.000000000 +0000
+++ libltdl/m4/libtool.m4	2013-05-15 12:16:14.000000000 +0000
@@ -2702,6 +2702,18 @@
   hardcode_into_libs=yes
   ;;
 
+minix*)
+  version_type=linux
+  need_lib_prefix=no
+  need_version=no
+  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major ${libname}${shared_ext}'
+  soname_spec='${libname}${release}${shared_ext}$major'
+  dynamic_linker='Minix ld.elf_so'
+  shlibpath_var=LD_LIBRARY_PATH
+  shlibpath_overrides_runpath=yes
+  hardcode_into_libs=yes
+  ;;
+
 newsos6)
   version_type=linux # correct to gnu/linux during the next big refactor
   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
@@ -3297,6 +3309,10 @@
   fi
   ;;
 
+minix*)
+  lt_cv_deplibs_check_method='match_pattern /lib[[^/]]+(\.so|_pic\.a)$'
+  ;; 
+
 newos6*)
   lt_cv_deplibs_check_method='file_magic ELF [[0-9]][[0-9]]*-bit [[ML]]SB (executable|dynamic lib)'
   lt_cv_file_magic_cmd=/usr/bin/file
@@ -4103,6 +4119,8 @@
 	;;
       netbsd*)
 	;;
+      minix*)
+        ;;
       *qnx* | *nto*)
         # QNX uses GNU C++, but need to define -shared option too, otherwise
         # it will coredump.
@@ -4871,6 +4889,11 @@
       fi
       ;;
 
+    minix*)
+      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+      _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+      ;;
+
     solaris*)
       if $LD -v 2>&1 | $GREP 'BFD 2\.8' > /dev/null; then
 	_LT_TAGVAR(ld_shlibs, $1)=no
@@ -5353,6 +5376,13 @@
       _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
       ;;
 
+    minix*)
+      _LT_TAGVAR(archive_cmds, $1)='$LD -shared -o $lib $libobjs $deplibs $linker_flags'
+      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
+      _LT_TAGVAR(hardcode_direct, $1)=yes
+      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
+      ;;
+
     newsos6)
       _LT_TAGVAR(archive_cmds, $1)='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
       _LT_TAGVAR(hardcode_direct, $1)=yes
@@ -6563,6 +6593,10 @@
 	output_verbose_link_cmd='$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP conftest.$objext | $SED -e "s:-lgcc -lc -lgcc::"'
 	;;
 
+      minix*)
+        _LT_TAGVAR(ld_shlibs, $1)=yes
+	;;
+
       *nto* | *qnx*)
         _LT_TAGVAR(ld_shlibs, $1)=yes
 	;;
