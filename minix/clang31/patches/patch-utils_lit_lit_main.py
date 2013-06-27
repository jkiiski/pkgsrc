$NetBSD$

--- utils/lit/lit/main.py.orig	Tue Dec 13 03:20:06 2011
+++ utils/lit/lit/main.py
@@ -6,7 +6,7 @@ lit - LLVM Integrated Tester.
 See lit.pod for more information.
 """
 
-import math, os, platform, random, re, sys, time, threading, traceback
+import math, os, platform, random, re, sys, time, traceback
 
 import ProgressBar
 import TestRunner
@@ -30,7 +30,6 @@ class TestingProgressDisplay:
         self.opts = opts
         self.numTests = numTests
         self.current = None
-        self.lock = threading.Lock()
         self.progressBar = progressBar
         self.completed = 0
 
@@ -41,11 +40,10 @@ class TestingProgressDisplay:
             return
 
         # Output lock.
-        self.lock.acquire()
         try:
             self.handleUpdate(test)
         finally:
-            self.lock.release()
+            " ok "
 
     def finish(self):
         if self.progressBar:
@@ -82,7 +80,6 @@ class TestProvider:
     def __init__(self, tests, maxTime):
         self.maxTime = maxTime
         self.iter = iter(tests)
-        self.lock = threading.Lock()
         self.startTime = time.time()
 
     def get(self):
@@ -92,17 +89,14 @@ class TestProvider:
                 return None
 
         # Otherwise take the next test.
-        self.lock.acquire()
         try:
             item = self.iter.next()
         except StopIteration:
             item = None
-        self.lock.release()
         return item
 
-class Tester(threading.Thread):
+class Tester:
     def __init__(self, litConfig, provider, display):
-        threading.Thread.__init__(self)
         self.litConfig = litConfig
         self.provider = provider
         self.display = display
@@ -300,21 +294,20 @@ def getTestsInSuite(ts, path_in_suite, litConfig,
 def runTests(numThreads, litConfig, provider, display):
     # If only using one testing thread, don't use threads at all; this lets us
     # profile, among other things.
-    if numThreads == 1:
-        t = Tester(litConfig, provider, display)
-        t.run()
-        return
+    t = Tester(litConfig, provider, display)
+    t.run()
+    return
 
-    # Otherwise spin up the testing threads and wait for them to finish.
-    testers = [Tester(litConfig, provider, display)
-               for i in range(numThreads)]
-    for t in testers:
-        t.start()
-    try:
-        for t in testers:
-            t.join()
-    except KeyboardInterrupt:
-        sys.exit(2)
+#    # Otherwise spin up the testing threads and wait for them to finish.
+#    testers = [Tester(litConfig, provider, display)
+#               for i in range(numThreads)]
+#    for t in testers:
+#        t.start()
+#    try:
+#        for t in testers:
+#            t.join()
+#    except KeyboardInterrupt:
+#        sys.exit(2)
 
 def load_test_suite(inputs):
     import unittest
