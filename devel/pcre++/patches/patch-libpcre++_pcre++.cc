$NetBSD$

--- libpcre++/pcre++.cc.orig	2013-04-28 14:34:06.000000000 +0000
+++ libpcre++/pcre++.cc
@@ -40,6 +40,7 @@
 
 
 #include "pcre++.h"
+#include <clocale>
 
 using namespace std;
 using namespace pcrepp;
