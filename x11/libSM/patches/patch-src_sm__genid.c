$NetBSD$

--- src/sm_genid.c.orig	Sat Mar  3 04:53:55 2012
+++ src/sm_genid.c
@@ -107,7 +107,7 @@ SmsGenerateClientID(SmsConn smsConn)
 {
 #if defined(HAVE_UUID_CREATE)
     char *id;
-    char **temp;
+    char *temp;
     uuid_t uuid;
     uint32_t status;
 
