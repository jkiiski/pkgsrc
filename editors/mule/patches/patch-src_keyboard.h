$NetBSD$

--- src/keyboard.h.orig	1994-08-28 19:59:19.000000000 +0000
+++ src/keyboard.h
@@ -105,3 +105,4 @@ extern Lisp_Object read_char ();
 extern Lisp_Object Vkeyboard_translate_table;
 
 extern Lisp_Object map_prompt ();
+void record_asynch_buffer_change(void);
