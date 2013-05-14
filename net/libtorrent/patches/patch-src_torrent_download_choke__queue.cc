$NetBSD$

--- src/torrent/download/choke_queue.cc.orig	2012-04-20 06:41:42.000000000 +0000
+++ src/torrent/download/choke_queue.cc
@@ -40,7 +40,6 @@
 #include <functional>
 #include <numeric>
 #include <cstdlib>
-#include <tr1/functional>
 
 #include "protocol/peer_connection_base.h"
 #include "torrent/download/group_entry.h"
