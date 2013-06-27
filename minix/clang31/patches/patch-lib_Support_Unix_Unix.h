$NetBSD$

--- lib/Support/Unix/Unix.h.orig	Tue Dec 13 03:20:07 2011
+++ lib/Support/Unix/Unix.h
@@ -84,4 +84,9 @@ static inline bool MakeErrMsg(
   return true;
 }
 
+#ifdef __minix
+#define mmap minix_mmap
+#define munmap minix_munmap
+#endif
+
 #endif
