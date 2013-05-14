$NetBSD$

--- src/include/fst/relabel.h.orig	2013-05-03 17:35:08.000000000 +0000
+++ src/include/fst/relabel.h
@@ -20,8 +20,15 @@
 #ifndef FST_LIB_RELABEL_H__
 #define FST_LIB_RELABEL_H__
 
+#include <ciso646>
+
+#if defined(_LIBCPP_VERSION) || __cplusplus >= 201103L
+#include <unordered_map>
+using std::unordered_map;
+#else
 #include <tr1/unordered_map>
 using std::tr1::unordered_map;
+#endif
 #include <string>
 #include <utility>
 #include <vector>
