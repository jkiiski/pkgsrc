$NetBSD$

--- modules/contrib/src/spinimages.cpp.orig	2013-05-05 18:32:00.000000000 +0000
+++ modules/contrib/src/spinimages.cpp
@@ -46,6 +46,7 @@
 #include <functional>
 #include <fstream>
 #include <limits>
+#include <numeric>
 #include <set>
 
 using namespace cv;
