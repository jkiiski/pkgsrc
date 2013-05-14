$NetBSD$

--- src/examples/e2ee_server.cpp.orig	2013-04-30 21:03:45.000000000 +0000
+++ src/examples/e2ee_server.cpp
@@ -17,6 +17,7 @@ using namespace gloox;
 #include <string>
 
 #include <cstdio> // [s]print[f]
+#include <ctime>
 
 #ifdef WIN32
 #include <windows.h>
