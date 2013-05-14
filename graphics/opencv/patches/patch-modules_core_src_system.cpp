$NetBSD$

--- modules/core/src/system.cpp.orig	2013-04-28 15:15:06.000000000 +0000
+++ modules/core/src/system.cpp
@@ -79,6 +79,7 @@
 #include <pthread.h>
 #include <sys/time.h>
 #include <time.h>
+#include <unistd.h>
 
 #if defined __MACH__ && defined __APPLE__
 #include <mach/mach.h>
