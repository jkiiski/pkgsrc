$NetBSD: patch-SoObjects_SOGo_NSData+Crypto.m,v 1.1 2012/11/24 14:06:44 manu Exp $

--- SoObjects/SOGo/NSData+Crypto.m.orig	2013-02-04 20:13:13.000000000 +0000
+++ SoObjects/SOGo/NSData+Crypto.m
@@ -23,7 +23,7 @@
  * Boston, MA 02111-1307, USA.
  */
 
-#ifndef __OpenBSD__
+#ifdef __sun
 #include <crypt.h>
 #endif
 
