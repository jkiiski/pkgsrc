$NetBSD$

--- src/lib/server/CConfig.h.orig	2013-05-10 12:35:59.000000000 +0000
+++ src/lib/server/CConfig.h
@@ -483,7 +483,7 @@ public:
 	bool			readLine(CString&);
 	UInt32			getLineNumber() const;
 
-	operator void*() const;
+	operator bool() const;
 	bool			operator!() const;
 
 	OptionValue		parseBoolean(const CString&) const;
