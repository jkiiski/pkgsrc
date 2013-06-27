$NetBSD$

--- tools/clang/lib/Frontend/InitHeaderSearch.cpp.orig	Tue Dec 13 03:20:11 2011
+++ tools/clang/lib/Frontend/InitHeaderSearch.cpp
@@ -427,7 +427,7 @@ AddDefaultCPlusPlusIncludePaths(const llvm::Triple &tr
     break;
   }
   case llvm::Triple::Minix:
-    AddGnuCPlusPlusIncludePaths("/usr/gnu/include/c++/4.4.3",
+    AddGnuCPlusPlusIncludePaths("/usr/pkg/gcc44/include/c++/4.4.6",
                                 "", "", "", triple);
     break;
   case llvm::Triple::Solaris:
