$NetBSD$

--- libxsd-frontend-1.15.0/xsd-frontend/transformations/schema-per-type.cxx.orig	2013-03-23 19:49:10.000000000 +0000
+++ libxsd-frontend-1.15.0/xsd-frontend/transformations/schema-per-type.cxx
@@ -311,7 +311,7 @@ namespace XSDFrontend
 
       for (Schemas::Iterator i (schemas.begin ()); i != schemas.end (); ++i)
       {
-        NarrowString s ((*i)->used_begin ()->path ().leaf ());
+        NarrowString s ((*i)->used_begin ()->path ().leaf ().c_str());
 
         Size p (s.rfind ('.'));
         file_set.insert (
