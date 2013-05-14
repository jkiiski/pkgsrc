$NetBSD$

--- kjs/wtf/DisallowCType.h.orig	2013-05-03 23:51:02.000000000 +0000
+++ kjs/wtf/DisallowCType.h
@@ -54,6 +54,7 @@
 #undef tolower
 #undef toupper
 
+#ifndef _LIBCPP_VERSION
 #define isalnum WTF_Please_use_ASCIICType_instead_of_ctype_see_comment_in_ASCIICType_h
 #define isalpha WTF_Please_use_ASCIICType_instead_of_ctype_see_comment_in_ASCIICType_h
 #define isascii WTF_Please_use_ASCIICType_instead_of_ctype_see_comment_in_ASCIICType_h
@@ -70,5 +71,6 @@
 #define toascii WTF_Please_use_ASCIICType_instead_of_ctype_see_comment_in_ASCIICType_h
 #define tolower WTF_Please_use_ASCIICType_instead_of_ctype_see_comment_in_ASCIICType_h
 #define toupper WTF_Please_use_ASCIICType_instead_of_ctype_see_comment_in_ASCIICType_h
+#endif
 
 #endif
