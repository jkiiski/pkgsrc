$NetBSD$

--- src/lib/Common/Common.cpp.orig	2013-04-30 12:37:10.000000000 +0000
+++ src/lib/Common/Common.cpp
@@ -38,6 +38,7 @@
 
 #ifndef WIN32
 #include <dirent.h>
+#include <unistd.h>
 #endif
 #include <sys/stat.h>
 #include <sys/types.h>
