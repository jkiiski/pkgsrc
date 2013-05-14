$NetBSD$

--- core/MasterControl.h.orig	2013-05-04 01:44:08.000000000 +0000
+++ core/MasterControl.h
@@ -12,8 +12,12 @@
 
 // std::shared_ptr
 #include <memory>
+#if defined(_LIBCPP_VERSION) || __cplusplus >= 201103L
+using std::shared_ptr;
+#else
 #include <tr1/memory>
 using namespace ::std::tr1;
+#endif
 
 class MasterControl
 {
