$NetBSD$

use proper DES interface
--- libsrc/Wi/xmlenc_algos.c.orig	2012-03-23 12:28:31.000000000 +0000
+++ libsrc/Wi/xmlenc_algos.c
@@ -1162,10 +1162,10 @@ dsig_hmac_sha256_digest (dk_session_t * 
   switch (key->xek_type)
     {
       case DSIG_KEY_3DES:
-	  memcpy (key_data, key->ki.triple_des.k1, sizeof (des_cblock));
-	  memcpy (key_data + 8, key->ki.triple_des.k2, sizeof (des_cblock));
-	  memcpy (key_data + 16, key->ki.triple_des.k3, sizeof (des_cblock));
-	  key_len = 3 * sizeof (des_cblock);
+	  memcpy (key_data, key->ki.triple_des.k1, sizeof (DES_cblock));
+	  memcpy (key_data + 8, key->ki.triple_des.k2, sizeof (DES_cblock));
+	  memcpy (key_data + 16, key->ki.triple_des.k3, sizeof (DES_cblock));
+	  key_len = 3 * sizeof (DES_cblock);
 	  break;
 #ifdef AES_ENC_ENABLE
       case DSIG_KEY_AES:
@@ -1234,10 +1234,10 @@ dsig_hmac_sha256_verify (dk_session_t * 
   switch (key->xek_type)
     {
       case DSIG_KEY_3DES:
-	  memcpy (key_data, key->ki.triple_des.k1, sizeof (des_cblock));
-	  memcpy (key_data + 8, key->ki.triple_des.k2, sizeof (des_cblock));
-	  memcpy (key_data + 16, key->ki.triple_des.k3, sizeof (des_cblock));
-	  key_len = 3 * sizeof (des_cblock);
+	  memcpy (key_data, key->ki.triple_des.k1, sizeof (DES_cblock));
+	  memcpy (key_data + 8, key->ki.triple_des.k2, sizeof (DES_cblock));
+	  memcpy (key_data + 16, key->ki.triple_des.k3, sizeof (DES_cblock));
+	  key_len = 3 * sizeof (DES_cblock);
 	  break;
 #ifdef AES_ENC_ENABLE
       case DSIG_KEY_AES:
@@ -1599,10 +1599,10 @@ dsig_hmac_sha1_digest (dk_session_t * se
   switch (key->xek_type)
     {
       case DSIG_KEY_3DES:
-	  memcpy (key_data, key->ki.triple_des.k1, sizeof (des_cblock));
-	  memcpy (key_data + 8, key->ki.triple_des.k2, sizeof (des_cblock));
-	  memcpy (key_data + 16, key->ki.triple_des.k3, sizeof (des_cblock));
-	  key_len = 3 * sizeof (des_cblock);
+	  memcpy (key_data, key->ki.triple_des.k1, sizeof (DES_cblock));
+	  memcpy (key_data + 8, key->ki.triple_des.k2, sizeof (DES_cblock));
+	  memcpy (key_data + 16, key->ki.triple_des.k3, sizeof (DES_cblock));
+	  key_len = 3 * sizeof (DES_cblock);
 	  break;
 #ifdef AES_ENC_ENABLE
       case DSIG_KEY_AES:
@@ -1671,10 +1671,10 @@ dsig_hmac_sha1_verify (dk_session_t * se
   switch (key->xek_type)
     {
       case DSIG_KEY_3DES:
-	  memcpy (key_data, key->ki.triple_des.k1, sizeof (des_cblock));
-	  memcpy (key_data + 8, key->ki.triple_des.k2, sizeof (des_cblock));
-	  memcpy (key_data + 16, key->ki.triple_des.k3, sizeof (des_cblock));
-	  key_len = 3 * sizeof (des_cblock);
+	  memcpy (key_data, key->ki.triple_des.k1, sizeof (DES_cblock));
+	  memcpy (key_data + 8, key->ki.triple_des.k2, sizeof (DES_cblock));
+	  memcpy (key_data + 16, key->ki.triple_des.k3, sizeof (DES_cblock));
+	  key_len = 3 * sizeof (DES_cblock);
 	  break;
 #ifdef AES_ENC_ENABLE
       case DSIG_KEY_AES:
@@ -2240,13 +2240,13 @@ int xenc_des3_encryptor (dk_session_t * 
 	}
 
 
-      des_ede3_cbc_encrypt ((const unsigned char *)buf,
+      DES_ede3_cbc_encrypt ((const unsigned char *)buf,
 		(unsigned char *)out_buf,
 		(long)DES_BLOCK_LEN,
-		key->ki.triple_des.ks1,
-		key->ki.triple_des.ks2,
-		key->ki.triple_des.ks3,
-		(des_cblock*) _iv,
+		&key->ki.triple_des.ks1,
+		&key->ki.triple_des.ks2,
+		&key->ki.triple_des.ks3,
+		(DES_cblock*) _iv,
 		DES_ENCRYPT);
       total_blocks++;
 
@@ -2310,7 +2310,7 @@ int xenc_des3_decryptor (dk_session_t * 
   char *text, *text_beg;
   dk_session_t *ses_in;
   long text_len;
-  des_cblock iv;
+  DES_cblock iv;
 
   if (!seslen)
     return 0;
@@ -2352,7 +2352,7 @@ int xenc_des3_decryptor (dk_session_t * 
   END_READ_FAIL (ses_in);
   for (;!failed;)
     {
-      des_ede3_cbc_encrypt ((const unsigned char *)buf,
+      DES_ede3_cbc_encrypt ((const unsigned char *)buf,
 	(unsigned char *)out_buf,
 	(long)DES_BLOCK_LEN,
 	key->ki.triple_des.ks1,
@@ -2404,7 +2404,7 @@ int xenc_des3_decryptor (dk_session_t * 
   char out_buf[DES_BLOCK_LEN + 1];
   char *text, *text_beg;
   long text_len;
-  des_cblock iv;
+  DES_cblock iv;
   int blocks;
 
   if (!seslen)
@@ -2440,12 +2440,12 @@ int xenc_des3_decryptor (dk_session_t * 
       memcpy (buf, text, DES_BLOCK_LEN);
       text += DES_BLOCK_LEN;
 
-      des_ede3_cbc_encrypt ((const unsigned char *)buf,
+      DES_ede3_cbc_encrypt ((const unsigned char *)buf,
 	(unsigned char *)out_buf,
 	(long)DES_BLOCK_LEN,
-	key->ki.triple_des.ks1,
-	key->ki.triple_des.ks2,
-	key->ki.triple_des.ks3,
+	&key->ki.triple_des.ks1,
+	&key->ki.triple_des.ks2,
+	&key->ki.triple_des.ks3,
 	&iv,
 	DES_DECRYPT);
 
