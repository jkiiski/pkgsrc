$NetBSD$

--- report/report-text.cpp.orig	2013-04-28 14:42:20.000000000 +0000
+++ report/report-text.cpp
@@ -33,7 +33,7 @@
 #include "../globaldefs.h"
 #include "../device/general/general.h"
 #include "report.h"
-
+#include <ctime>
 
 int Report::writeText(const char *theText, Device::paragraphStruct *paragraph, bool expandAbbreviations)
 {
