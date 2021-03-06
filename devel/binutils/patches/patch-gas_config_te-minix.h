$NetBSD$

--- gas/config/te-minix.h.orig	Wed Apr 10 22:38:30 2013
+++ gas/config/te-minix.h
@@ -0,0 +1,11 @@
+#define TE_MINIX 1
+
+/* Added these, because if we don't know what we're targeting we may
+   need an assembler version of libgcc, and that will use local
+   labels.  */
+#define LOCAL_LABELS_DOLLAR 1
+#define LOCAL_LABELS_FB 1
+
+#define ELF_TARGET_FORMAT "elf32-i386-minix"
+
+#include "obj-format.h"
