$NetBSD$

* from cygport 2.6.2-ssl-threads.patch

--- Modules/_ssl.c.orig	2013-04-06 14:02:36.000000000 +0000
+++ Modules/_ssl.c
@@ -16,6 +16,10 @@
 
 #include "Python.h"
 
+#ifdef __CYGWIN__
+#undef WITH_THREAD
+#endif
+
 #ifdef WITH_THREAD
 #include "pythread.h"
 #define PySSL_BEGIN_ALLOW_THREADS { \
