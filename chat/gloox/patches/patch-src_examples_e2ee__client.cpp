$NetBSD$

--- src/examples/e2ee_client.cpp.orig	2013-04-30 21:02:01.000000000 +0000
+++ src/examples/e2ee_client.cpp
@@ -17,6 +17,7 @@ using namespace gloox;
 #include <string>
 
 #include <cstdio> // [s]print[f]
+#include <ctime>
 
 #ifdef WIN32
 #include <windows.h>
