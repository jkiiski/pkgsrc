$NetBSD$

--- rak/priority_queue_default.h.orig	2012-02-14 03:15:27.000000000 +0000
+++ rak/priority_queue_default.h
@@ -38,7 +38,13 @@
 #define RAK_PRIORITY_QUEUE_DEFAULT_H
 
 #include <stdexcept>
+#if __cplusplus >= 201103L
+#include <functional>
+using std::function;
+#else
 #include <tr1/functional>
+using std::tr1::function;
+#endif
 #include <rak/allocators.h>
 #include <rak/priority_queue.h>
 #include <rak/timer.h>
@@ -47,7 +53,7 @@ namespace rak {
 
 class priority_item {
 public:
-  typedef std::tr1::function<void (void)> slot_void;
+  typedef function<void (void)> slot_void;
 
   priority_item() {}
   ~priority_item() {
