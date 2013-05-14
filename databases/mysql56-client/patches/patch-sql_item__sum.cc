$NetBSD$

--- sql/item_sum.cc.orig	2013-05-05 20:56:04.000000000 +0000
+++ sql/item_sum.cc
@@ -3417,7 +3417,7 @@ bool Item_func_group_concat::setup(THD *
 {
   List<Item> list;
   SELECT_LEX *select_lex= thd->lex->current_select;
-  const bool order_or_distinct= test(arg_count_order > 0 || distinct);
+  const bool order_or_distinct= my_test(arg_count_order > 0 || distinct);
   DBUG_ENTER("Item_func_group_concat::setup");
 
   /*
