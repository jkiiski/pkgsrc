$NetBSD$

--- canvas/source/cairo/cairo_xlib_cairo.cxx.orig	2013-03-30 16:59:08.000000000 +0000
+++ canvas/source/cairo/cairo_xlib_cairo.cxx
@@ -320,7 +320,8 @@ namespace cairo
 
     static X11SysData getSysData( const VirtualDevice& rVirDev )
     {
-        return X11SysData( &rVirDev.GetSystemGfxData() );
+        SystemGraphicsData tmp(rVirDev.GetSystemGfxData());
+        return X11SysData(&tmp);
     }
 
     SurfaceSharedPtr createSurface( const OutputDevice& rRefDevice,
