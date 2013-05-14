$NetBSD$

--- libstdc++-v3/config/os/bsd/netbsd/ctype_inline.h.orig	2009-04-09 15:00:19.000000000 +0000
+++ libstdc++-v3/config/os/bsd/netbsd/ctype_inline.h
@@ -46,7 +46,7 @@ _GLIBCXX_BEGIN_NAMESPACE(std)
   is(const char* __low, const char* __high, mask* __vec) const
   {
     while (__low < __high)
-      *__vec++ = _M_table[*__low++];
+      *__vec++ = _M_table[(unsigned char)*__low++];
     return __high;
   }
 
