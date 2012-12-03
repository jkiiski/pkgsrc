$NetBSD$

--- intern/opennl/superlu/superlu_sys_types.h.orig	2012-10-09 18:34:26.000000000 +0000
+++ intern/opennl/superlu/superlu_sys_types.h
@@ -119,7 +119,7 @@ unsigned long __attribute__((__stdcall__
 #define ntohl(x) correctByteOrder(x)
 #endif
 #endif
-#elif defined (__FreeBSD__) || defined (__OpenBSD__) 
+#elif defined (__FreeBSD__) || defined (__OpenBSD__)  || defined (__NetBSD__)
 #include <sys/param.h>
 #elif defined (__APPLE__)
 #include <sys/types.h>
