$NetBSD$

--- v2cc/v2cc-expr.cc.orig	2013-04-30 20:28:47.000000000 +0000
+++ v2cc/v2cc-expr.cc
@@ -602,7 +602,7 @@ m_emit_expr (pIIR_AbstractLiteralExpress
     else if (ale->value->is(IR_FLOATING_POINT_LITERAL))
       str += (folded_value(ale).original_string () != "") ?
 	folded_value(ale).original_string () :
-	to_string (folded_value(ale).double_value ());
+	::to_string (folded_value(ale).double_value ());
     else
       abort ();
   } else
