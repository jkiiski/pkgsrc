$NetBSD$

--- plugins/vorbis/vorbis_meta.cpp.orig	2013-04-28 12:32:18.000000000 +0000
+++ plugins/vorbis/vorbis_meta.cpp
@@ -40,6 +40,7 @@
 #	include <unistd.h>
 #endif
 
+#include <stdlib.h>
 #include <stdio.h>
 #include <math.h>
 #include <assert.h>
