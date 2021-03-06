$NetBSD$

--- lib/libdvbapi/dvbfe.c.orig	2011-06-28 05:50:24.000000000 +0000
+++ lib/libdvbapi/dvbfe.c
@@ -32,7 +32,11 @@
 #include <unistd.h>
 #include <ctype.h>
 #include <errno.h>
+#ifdef __NetBSD__
+#include <dev/dtv/dtvio.h>
+#else
 #include <linux/dvb/frontend.h>
+#endif
 #include <libdvbmisc/dvbmisc.h>
 #include "dvbfe.h"
 
