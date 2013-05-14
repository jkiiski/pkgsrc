$NetBSD$

--- src/base/PdfLocale.h.orig	2013-05-04 02:06:09.000000000 +0000
+++ src/base/PdfLocale.h
@@ -1,7 +1,7 @@
 #ifndef PODOFO_PDFLOCALE_H
 #define PODOFO_PDFLOCALE_H
 
-namespace std { class ios_base; };
+#include <ios>
 
 namespace PoDoFo {
 
