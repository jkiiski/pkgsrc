$NetBSD$

--- certmanager/lib/backends/qgpgme/qgpgmejob.cpp.orig	2013-04-29 21:44:33.000000000 +0000
+++ certmanager/lib/backends/qgpgme/qgpgmejob.cpp
@@ -55,6 +55,7 @@
 #include <algorithm>
 
 #include <assert.h>
+#include <stdlib.h>
 #include <string.h>
 
 namespace {
