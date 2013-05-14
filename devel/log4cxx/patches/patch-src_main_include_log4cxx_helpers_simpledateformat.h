$NetBSD$

--- src/main/include/log4cxx/helpers/simpledateformat.h.orig	2013-04-30 11:08:29.000000000 +0000
+++ src/main/include/log4cxx/helpers/simpledateformat.h
@@ -26,11 +26,10 @@
 
 
 #include <log4cxx/helpers/dateformat.h>
+#include <locale>
 #include <vector>
 #include <time.h>
 
-namespace std { class locale; }
-
 namespace log4cxx
 {
         namespace helpers
