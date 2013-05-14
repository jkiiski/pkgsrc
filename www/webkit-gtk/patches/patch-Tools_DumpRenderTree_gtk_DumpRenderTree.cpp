$NetBSD$

--- Tools/DumpRenderTree/gtk/DumpRenderTree.cpp.orig	2012-11-23 20:12:19.000000000 +0000
+++ Tools/DumpRenderTree/gtk/DumpRenderTree.cpp
@@ -46,6 +46,7 @@
 #include "WorkQueueItem.h"
 #include <JavaScriptCore/JavaScript.h>
 #include <cassert>
+#include <clocale>
 #include <cstdlib>
 #include <cstring>
 #include <getopt.h>
