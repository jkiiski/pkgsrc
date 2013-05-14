$NetBSD$

--- src/plugins/database_sqlite3.cpp.orig	2013-04-30 12:39:19.000000000 +0000
+++ src/plugins/database_sqlite3.cpp
@@ -31,6 +31,7 @@
 #include <iostream>
 
 #include <sqlite3.h>
+#include <unistd.h>
 
 class CSQLiteConnection: public CDatabaseConnection
 {
