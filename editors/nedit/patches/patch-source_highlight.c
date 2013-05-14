$NetBSD$

Silence gcc warnings about unsafe pointer casts.

--- source/highlight.c~	2004-08-01 10:06:10.000000000 +0000
+++ source/highlight.c
@@ -510,7 +510,7 @@ void* GetHighlightInfo(WindowInfo *windo
     if (!pattern) {
 	return NULL;
     }
-    return (void*)pattern->userStyleIndex;    
+    return (void*)(intptr_t)pattern->userStyleIndex;    
 }
     
 /*
