$NetBSD$

Add missing header.

--- src/compressionexps/RLE2DataMaker.h.orig	2006-10-17 19:36:03.000000000 +0000
+++ src/compressionexps/RLE2DataMaker.h
@@ -55,7 +55,7 @@
 #include "../AM/PagePlacer.h"
 #include <ctime>
 #include "../UnitTests/UnitTest.h"
-#include <fstream.h>
+#include <fstream>
 
 class RLE2DataMaker : public UnitTest
 {
