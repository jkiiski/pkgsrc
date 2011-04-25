$NetBSD: patch-at,v 1.2 2010/09/21 15:57:30 taca Exp $

* Portability: include <bstring.h> if exists.

--- sql/log_event.cc.orig	2011-03-09 15:11:38.000000000 +0000
+++ sql/log_event.cc
@@ -44,6 +44,9 @@
 #include "rpl_record.h"
 #include "transaction.h"
 #include <my_dir.h>
+#ifdef NEEDS_BSTRING_H
+#include <bstring.h> /* defines bcmp() */
+#endif
 
 #endif /* MYSQL_CLIENT */
 
