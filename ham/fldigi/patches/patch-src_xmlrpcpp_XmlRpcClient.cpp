$NetBSD$

--- src/xmlrpcpp/XmlRpcClient.cpp.orig	2013-05-03 14:41:57.000000000 +0000
+++ src/xmlrpcpp/XmlRpcClient.cpp
@@ -319,7 +319,7 @@ XmlRpcClient::generateHeader(std::string
 
   header += "Content-Type: text/xml\r\nContent-length: ";
 
-  sprintf(buff,"%"PRIuSZ"\r\n\r\n", body.size());
+  sprintf(buff,"%" PRIuSZ "\r\n\r\n", body.size());
 
   return header + buff;
 }
