$NetBSD$

--- quanta/src/quanta.h.orig	2013-03-26 21:12:23.000000000 +0000
+++ quanta/src/quanta.h
@@ -95,8 +95,10 @@ class DebuggerManager;
 class QuantaInit;
 class KToolBarPopupAction;
 class KTempFile;
-class KParts::Part;
-class KParts::PartManager;
+namespace KParts {
+  class Part;
+  class PartManager;
+}
 namespace KTextEditor
 {
   class Mark;
