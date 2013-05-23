--- gio/gresource-tool.c.orig	2013-04-15 21:22:13.000000000 +0000
+++ gio/gresource-tool.c	2013-05-23 13:39:52.000000000 +0000
@@ -31,6 +31,11 @@
 #include <locale.h>
 
 #ifdef HAVE_LIBELF
+/* Solaris native libelf does not support largefile in 32-bit mode */
+#  if defined(__sun) && defined(__i386)
+#    undef  _FILE_OFFSET_BITS
+#    define _FILE_OFFSET_BITS   32
+#  endif
 #include <libelf.h>
 #include <gelf.h>
 #include <sys/mman.h>
@@ -44,6 +49,9 @@
 #include "glib/glib-private.h"
 #endif
 
+#define munmap minix_munmap
+#define mmap minix_mmap
+
 /* GResource functions {{{1 */
 static GResource *
 get_resource (const gchar *file)
