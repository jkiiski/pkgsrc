$NetBSD: patch-src_3rdparty_qtsingleapplication_qtlocalpeer.cpp,v 1.1.1.1 2011/03/07 07:02:06 ryoon Exp $

--- src/3rdparty/qtsingleapplication/qtlocalpeer.cpp.orig	2010-11-16 20:24:09.000000000 +0000
+++ src/3rdparty/qtsingleapplication/qtlocalpeer.cpp
@@ -45,6 +45,7 @@
 ****************************************************************************/
 
 
+#include "errno.h"
 #include "qtlocalpeer.h"
 #include <QtCore/QCoreApplication>
 #include <QtCore/QTime>
@@ -57,6 +58,7 @@ static PProcessIdToSessionId pProcessIdT
 #endif
 #if defined(Q_OS_UNIX)
 #include <time.h>
+#include <unistd.h>
 #endif
 
 namespace QtLP_Private {
