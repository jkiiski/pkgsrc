$NetBSD$

--- src/StelMainGraphicsView.cpp.orig	2013-05-04 00:38:40.000000000 +0000
+++ src/StelMainGraphicsView.cpp
@@ -41,6 +41,7 @@
 #include <QtPlugin>
 #include <QThread>
 #include <QTimer>
+#include <clocale>
 
 #ifndef DISABLE_SCRIPTING
  #include "StelScriptMgr.hpp"
