$NetBSD$

--- inc/preferencesdialog.hpp.orig	2013-04-30 21:24:56.000000000 +0000
+++ inc/preferencesdialog.hpp
@@ -198,7 +198,7 @@ public:
 	protected:
 		struct LangCompare
 		{
-			bool operator()(GtkSourceLanguage* first, GtkSourceLanguage* second)
+			bool operator()(const GtkSourceLanguage* first, const GtkSourceLanguage* second) const
 			{
 				return first < second;
 			}
