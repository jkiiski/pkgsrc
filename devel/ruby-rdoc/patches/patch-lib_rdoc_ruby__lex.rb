$NetBSD$

Take care for EOF.

--- lib/rdoc/ruby_lex.rb.orig	2013-03-07 14:10:23.000000000 +0000
+++ lib/rdoc/ruby_lex.rb
@@ -1027,7 +1027,7 @@ class RDoc::RubyLex
       doc << l
     end
 
-    if output_heredoc then
+    if output_heredoc and l then
       doc << l.chomp
     else
       doc << '"'
