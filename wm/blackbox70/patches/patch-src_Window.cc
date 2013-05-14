$NetBSD$

--- src/Window.cc.orig	2013-04-28 13:03:26.000000000 +0000
+++ src/Window.cc
@@ -43,6 +43,7 @@
 #endif
 
 #include <assert.h>
+#include <stdlib.h>
 
 /*
   sometimes C++ is a pain in the ass... it gives us stuff like the
