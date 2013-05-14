$NetBSD$

--- gtkmm-utils/tile-view.cc.orig	2013-04-30 21:43:17.000000000 +0000
+++ gtkmm-utils/tile-view.cc
@@ -25,13 +25,20 @@
 #include "glibmm-utils/ustring.h"
 #include "tile-view.h"
 
+#ifdef _LIBCPP_VERSION
+#include <memory>
+using std::shared_ptr;
+#else
+#include <tr1/memory>
+using std::tr1::shared_ptr;
+#endif
+
 namespace Gtk {
 
 namespace Util {
 
 using std::auto_ptr;
 using std::list;
-using std::tr1::shared_ptr;
 
 /* TileData */
 
