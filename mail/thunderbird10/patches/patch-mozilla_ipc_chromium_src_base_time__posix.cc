$NetBSD$

--- mozilla/ipc/chromium/src/base/time_posix.cc.orig	2013-01-05 14:22:10.000000000 +0000
+++ mozilla/ipc/chromium/src/base/time_posix.cc
@@ -13,6 +13,7 @@
 #else
 #include <time.h>
 #endif
+#include <unistd.h>
 
 #include <limits>
 
