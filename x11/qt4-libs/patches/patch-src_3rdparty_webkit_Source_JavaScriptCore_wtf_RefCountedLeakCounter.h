$NetBSD$

--- src/3rdparty/webkit/Source/JavaScriptCore/wtf/RefCountedLeakCounter.h.orig	2013-05-08 13:34:56.000000000 +0000
+++ src/3rdparty/webkit/Source/JavaScriptCore/wtf/RefCountedLeakCounter.h
@@ -38,7 +38,7 @@ namespace WTF {
 
 #ifndef NDEBUG
     private:
-        volatile int m_count;
+        atomic_int m_count;
         const char* m_description;
 #endif
     };
