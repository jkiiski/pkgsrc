$NetBSD$

--- src/xmlrpcpp/XmlRpcServer.cpp.orig	2013-05-03 14:42:36.000000000 +0000
+++ src/xmlrpcpp/XmlRpcServer.cpp
@@ -481,7 +481,7 @@ XmlRpcServer::generateHeader(std::string
     "Content-length: ";
 
   char buffLen[40];
-  sprintf(buffLen,"%"PRIuSZ"\r\n\r\n", body.size());
+  sprintf(buffLen,"%" PRIuSZ "\r\n\r\n", body.size());
 
   return header + buffLen;
 }
