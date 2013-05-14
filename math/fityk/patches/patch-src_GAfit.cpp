$NetBSD$

--- src/GAfit.cpp.orig	2013-04-30 20:13:09.000000000 +0000
+++ src/GAfit.cpp
@@ -347,7 +347,7 @@ void GAfit::stochastic_remainder_samplin
 struct Remainder_and_ptr {
     int ind;
     fp r;
-    bool operator< (const Remainder_and_ptr &b) {
+    bool operator< (const Remainder_and_ptr &b) const {
         return r < b.r;
     }
 };
