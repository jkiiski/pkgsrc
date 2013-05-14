$NetBSD$

--- src/data.c.orig	2013-03-01 17:41:37.000000000 +0000
+++ src/data.c
@@ -2369,7 +2369,7 @@ arith_error (signo)
   Fsignal (Qarith_error, Qnil);
 }
 
-init_data ()
+void init_data (void)
 {
   /* Don't do this if just dumping out.
      We don't want to call `signal' in this case
