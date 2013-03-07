$NetBSD$

--- Xtranssock.c.orig	Fri Mar 23 03:04:35 2012
+++ Xtranssock.c
@@ -100,10 +100,10 @@ from the copyright holders.
 #if defined(linux) || defined(__GLIBC__)
 #include <sys/param.h>
 #endif /* osf */
-#if defined(__NetBSD__) || defined(__OpenBSD__) || defined(__FreeBSD__) || defined(__DragonFly__)
+#if defined(__NetBSD__) || defined(__OpenBSD__) || defined(__FreeBSD__) || defined(__DragonFly__) || defined(__minix)
 #include <sys/param.h>
 #include <machine/endian.h>
-#endif /* __NetBSD__ || __OpenBSD__ || __FreeBSD__ || __DragonFly__ */
+#endif /* __NetBSD__ || __OpenBSD__ || __FreeBSD__ || __DragonFly__ || __minix */
 #include <netinet/tcp.h>
 #endif /* !NO_TCP_H */
 
