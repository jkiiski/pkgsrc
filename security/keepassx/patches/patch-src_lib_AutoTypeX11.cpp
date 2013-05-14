$NetBSD$

--- src/lib/AutoTypeX11.cpp.orig	2013-05-04 00:34:27.000000000 +0000
+++ src/lib/AutoTypeX11.cpp
@@ -23,6 +23,7 @@
 #include "mainwindow.h"
 #include "lib/HelperX11.h"
 #include <QX11Info>
+#include <ctime>
 
 #ifndef GLOBAL_AUTOTYPE
 AutoType* autoType = NULL;
