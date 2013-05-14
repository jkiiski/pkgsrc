$NetBSD$

--- sql/log_event.cc.orig	2013-04-28 13:54:43.000000000 +0000
+++ sql/log_event.cc
@@ -642,7 +642,7 @@ static void print_set_option(IO_CACHE* f
   {
     if (*need_comma)
       my_b_printf(file,", ");
-    my_b_printf(file,"%s=%d", name, test(flags & option));
+    my_b_printf(file,"%s=%d", name, my_test(flags & option));
     *need_comma= 1;
   }
 }
