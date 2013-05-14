$NetBSD$

--- xen/arch/x86/Rules.mk.orig	2009-08-06 12:56:40.000000000 +0000
+++ xen/arch/x86/Rules.mk
@@ -21,6 +21,7 @@ CFLAGS += -iwithprefix include -Werror -
 CFLAGS += -I$(BASEDIR)/include 
 CFLAGS += -I$(BASEDIR)/include/asm-x86/mach-generic
 CFLAGS += -I$(BASEDIR)/include/asm-x86/mach-default
+CFLAGS += $(EXTRA_CFLAGS)
 
 # Prevent floating-point variables from creeping into Xen.
 CFLAGS += -msoft-float
