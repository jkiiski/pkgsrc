$NetBSD$

--- src/qalcunits.cc.orig	2013-05-12 18:20:09.000000000 +0000
+++ src/qalcunits.cc
@@ -81,7 +81,7 @@ struct tree_struct {
 			it->sort();
 		}
 	}
-	bool operator < (tree_struct &s1) const {
+	bool operator < (const tree_struct &s1) const {
 		return item < s1.item;	
 	}	
 };
