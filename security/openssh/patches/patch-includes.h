$NetBSD$

Interix support

--- includes.h.orig	2013-02-22 22:12:24.000000000 +0000
+++ includes.h
@@ -124,6 +124,10 @@
 #ifdef HAVE_READPASSPHRASE_H
 # include <readpassphrase.h>
 #endif
+#ifdef HAVE_INTERIX
+# include <interix/env.h>
+# include <interix/security.h>
+#endif
 
 #ifdef HAVE_IA_H
 # include <ia.h>
