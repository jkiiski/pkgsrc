$NetBSD$

--- src/disp-vcd/vcd.c.orig	2013-03-23 18:50:59.000000000 +0000
+++ src/disp-vcd/vcd.c
@@ -696,7 +696,7 @@ vcd_write_pc (int pc)
 
 /* Set the current time. */
 
-inline int
+int
 vcd_set_clock (unsigned int c)
 {
     clk = c;
