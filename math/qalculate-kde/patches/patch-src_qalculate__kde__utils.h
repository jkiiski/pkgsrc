$NetBSD$

--- src/qalculate_kde_utils.h.orig	2013-05-12 18:16:41.000000000 +0000
+++ src/qalculate_kde_utils.h
@@ -46,7 +46,7 @@ struct tree_struct {
 			it->sort();
 		}
 	}
-	bool operator < (tree_struct &s1) const {
+	bool operator < (const tree_struct &s1) const {
 		return item < s1.item;	
 	}	
 };
