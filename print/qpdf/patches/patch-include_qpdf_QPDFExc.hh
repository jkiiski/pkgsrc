$NetBSD$

--- include/qpdf/QPDFExc.hh.orig	2013-05-09 11:09:27.000000000 +0000
+++ include/qpdf/QPDFExc.hh
@@ -13,6 +13,7 @@
 
 #include <qpdf/Constants.h>
 #include <stdexcept>
+#include <string>
 
 class QPDFExc: public std::runtime_error
 {
