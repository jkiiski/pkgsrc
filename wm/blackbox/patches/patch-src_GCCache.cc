$NetBSD$

--- src/GCCache.cc.orig	2013-04-30 19:20:02.000000000 +0000
+++ src/GCCache.cc
@@ -26,6 +26,7 @@
 #endif // HAVE_CONFIG_H
 
 extern "C" {
+#include <stdlib.h>
 #include <stdio.h>
 }
 
