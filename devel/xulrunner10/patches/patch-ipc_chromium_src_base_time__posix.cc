$NetBSD$

--- ipc/chromium/src/base/time_posix.cc.orig	2013-05-05 17:47:44.000000000 +0000
+++ ipc/chromium/src/base/time_posix.cc
@@ -13,6 +13,7 @@
 #else
 #include <time.h>
 #endif
+#include <unistd.h>
 
 #include <limits>
 
