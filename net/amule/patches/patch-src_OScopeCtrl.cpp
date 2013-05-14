$NetBSD$

--- src/OScopeCtrl.cpp.orig	2013-05-03 11:38:05.000000000 +0000
+++ src/OScopeCtrl.cpp
@@ -23,6 +23,7 @@
 // Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301, USA
 //
 
+#include <cstdlib>
 #include <cmath>
 #include <wx/dcmemory.h>
 #include <wx/dcclient.h>
