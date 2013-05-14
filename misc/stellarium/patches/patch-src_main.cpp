$NetBSD$

--- src/main.cpp.orig	2013-05-04 00:38:57.000000000 +0000
+++ src/main.cpp
@@ -36,6 +36,7 @@
 #ifdef Q_OS_WIN
 #include <windows.h>
 #endif //Q_OS_WIN
+#include <clocale>
 
 //! @class GettextStelTranslator
 //! Provides i18n support through gettext.
