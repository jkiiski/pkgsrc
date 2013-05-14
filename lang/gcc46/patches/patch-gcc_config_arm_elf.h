$NetBSD$

--- gcc/config/arm/elf.h.orig	2009-06-21 20:48:15.000000000 +0000
+++ gcc/config/arm/elf.h
@@ -161,6 +161,9 @@
 #undef L_floatdidf
 #undef L_floatdisf
 #undef L_floatundidf
+/* XXXMRG: don't take this out, we need it! */
+# ifndef __NetBSD__
 #undef L_floatundisf
+# endif
 #endif
 
