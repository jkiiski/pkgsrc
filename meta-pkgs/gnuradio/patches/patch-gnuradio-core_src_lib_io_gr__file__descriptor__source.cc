$NetBSD$

Fix "close not declared in this scope" error on gcc 4.7

--- gnuradio-core/src/lib/io/gr_file_descriptor_source.cc.orig	2010-06-02 00:57:52.000000000 +0000
+++ gnuradio-core/src/lib/io/gr_file_descriptor_source.cc
@@ -34,6 +34,7 @@
 #include <stdexcept>
 #include <stdio.h>
 #include <string.h>
+#include <unistd.h>
 
 
 gr_file_descriptor_source::gr_file_descriptor_source (size_t itemsize,
