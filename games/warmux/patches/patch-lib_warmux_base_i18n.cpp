$NetBSD$

--- lib/warmux/base/i18n.cpp.orig	2013-04-29 19:41:28.000000000 +0000
+++ lib/warmux/base/i18n.cpp
@@ -23,6 +23,7 @@
 #include <WARMUX_i18n.h>
 #include <WARMUX_error.h>
 #include <string>
+#include <locale.h>
 #include <stdio.h>
 #include <stdarg.h>
 #include <stdlib.h>
