$NetBSD$

Avoid overlap with std::mutex.

--- Interpreter.cpp.orig	2013-05-04 00:26:28.000000000 +0000
+++ Interpreter.cpp
@@ -69,6 +69,8 @@ using namespace std;
 QMutex keymutex;
 int currentKey;
 
+#define mutex my_mutex
+
 extern QMutex mutex;
 extern QMutex debugmutex;
 extern QWaitCondition waitCond;
