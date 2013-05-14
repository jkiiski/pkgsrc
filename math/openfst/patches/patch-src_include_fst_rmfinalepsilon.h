$NetBSD$

--- src/include/fst/rmfinalepsilon.h.orig	2013-05-03 17:24:31.000000000 +0000
+++ src/include/fst/rmfinalepsilon.h
@@ -20,8 +20,15 @@
 #ifndef FST_LIB_RMFINALEPSILON_H__
 #define FST_LIB_RMFINALEPSILON_H__
 
+#include <ciso646>
+
+#if defined(_LIBCPP_VERSION) || __cplusplus >= 201103L
+#include <unordered_set>
+using std::unordered_set;
+#else
 #include <tr1/unordered_set>
 using std::tr1::unordered_set;
+#endif
 #include <vector>
 
 #include <fst/connect.h>
