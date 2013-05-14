$NetBSD$

--- fbreader/src/formats/html/HtmlReader.cpp.orig	2013-05-04 15:08:25.000000000 +0000
+++ fbreader/src/formats/html/HtmlReader.cpp
@@ -19,6 +19,7 @@
 
 #include <algorithm>
 #include <cctype>
+#include <cstdlib>
 
 #include <ZLInputStream.h>
 #include <ZLXMLReader.h>
