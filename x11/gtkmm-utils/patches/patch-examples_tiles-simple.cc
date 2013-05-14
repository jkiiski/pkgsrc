$NetBSD$

--- examples/tiles-simple.cc.orig	2013-04-30 21:46:09.000000000 +0000
+++ examples/tiles-simple.cc
@@ -24,8 +24,6 @@
 #include <iostream>
 #include "tiles-simple.h"
 
-using std::tr1::shared_ptr;
-
 ExampleWindow::ExampleWindow()
     :
     show_navigation_("Show navigation bar"),
