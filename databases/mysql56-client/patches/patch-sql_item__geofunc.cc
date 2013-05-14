$NetBSD$

--- sql/item_geofunc.cc.orig	2013-05-05 20:55:27.000000000 +0000
+++ sql/item_geofunc.cc
@@ -262,7 +262,7 @@ String *Item_func_centroid::val_str(Stri
   srid= uint4korr(swkb->ptr());
   str->q_append(srid);
 
-  return (null_value= test(geom->centroid(str))) ? 0 : str;
+  return (null_value= my_test(geom->centroid(str))) ? 0 : str;
 }
 
 
