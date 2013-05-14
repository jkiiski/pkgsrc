$NetBSD$

--- kjs/interpreter.cpp.orig	2013-05-03 23:52:06.000000000 +0000
+++ kjs/interpreter.cpp
@@ -63,6 +63,7 @@
 #include <math.h>
 #include <signal.h>
 #include <stdio.h>
+#include <cstdlib>
 #if defined(HAVE_UNISTD_H)
 #include <unistd.h>
 #endif
