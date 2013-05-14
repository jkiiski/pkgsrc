$NetBSD$

Remove Makefiles from VAD content to eliminate buildlink references
--- binsrc/tutorial/make_vad.sh.orig	2012-08-01 20:54:31.000000000 +0000
+++ binsrc/tutorial/make_vad.sh
@@ -304,7 +304,7 @@ directory_init() {
   done
 
   cd $LOGDIR
-
+  find vad_files -name Makefile\* -exec rm -f \{\} \;
 }
 
 virtuoso_shutdown() {
