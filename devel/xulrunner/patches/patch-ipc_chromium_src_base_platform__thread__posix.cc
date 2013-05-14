$NetBSD$

--- ipc/chromium/src/base/platform_thread_posix.cc.orig	2013-03-07 10:48:46.000000000 +0000
+++ ipc/chromium/src/base/platform_thread_posix.cc
@@ -10,7 +10,9 @@
 #if defined(OS_MACOSX)
 #include <mach/mach.h>
 #elif defined(OS_NETBSD)
+_Pragma("GCC visibility push(default)")
 #include <lwp.h>
+_Pragma("GCC visibility pop")
 #elif defined(OS_LINUX)
 #include <sys/syscall.h>
 #include <sys/prctl.h>
