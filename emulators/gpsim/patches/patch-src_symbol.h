$NetBSD$

--- src/symbol.h.orig	2013-02-28 10:35:39.000000000 +0000
+++ src/symbol.h
@@ -23,6 +23,7 @@ Boston, MA 02111-1307, USA.  */
 //
 
 #include <string>
+#include <typeinfo>
 #include <vector>
 #include "value.h"
 #include "registers.h"
