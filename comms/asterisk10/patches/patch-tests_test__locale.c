$NetBSD$

--- tests/test_locale.c.orig	2011-09-29 21:14:34.000000000 +0000
+++ tests/test_locale.c
@@ -81,7 +81,7 @@ static char *handle_cli_test_locales(str
 
 	/* First we run a set of tests with the global locale, which isn't thread-safe. */
 	if (!(localedir = opendir(
-#if defined(__FreeBSD__) || defined(__OpenBSD__) || defined( __NetBSD__ ) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__OpenBSD__) || defined( __NetBSD__ ) || defined(__APPLE__) || defined(__DragonFly__)
 		"/usr/share/locale"
 #else /* Linux */
 		"/usr/lib/locale"
