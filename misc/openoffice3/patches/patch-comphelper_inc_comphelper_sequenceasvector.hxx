$NetBSD$

--- comphelper/inc/comphelper/sequenceasvector.hxx.orig	2013-03-30 16:24:50.000000000 +0000
+++ comphelper/inc/comphelper/sequenceasvector.hxx
@@ -135,7 +135,7 @@ class SequenceAsVector : public ::std::v
             const TElementType* pSource = lSource.getConstArray();
 
             for (sal_Int32 i=0; i<c; ++i)
-                push_back(pSource[i]);
+                this->push_back(pSource[i]);
         }
 
         //---------------------------------------
