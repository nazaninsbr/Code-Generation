.class public ArrayStuff
.super Object
.field private anArrayInstance [I
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial Object/<init>()V ; call super
   return
.end method
.method public x([I)[I
   .limit stack 256
   .limit locals 256
   aload 1
   astore 31
   iconst_0
   istore 32
   aload 0 ;this
   ldc 5
   newarray       int
   putfield ArrayStuff/anArrayInstance [I
   aload 0 ;this
   getfield ArrayStuff/anArrayInstance [I
   ldc 3
   ldc 56565
   iastore
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 0 ;this
   getfield ArrayStuff/anArrayInstance [I
   ldc 3
   iaload
   invokevirtual java/io/PrintStream/println(I)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   iconst_1
   iconst_0
   ior
   istore 32
   iload 32
   ifle done_for_if_NO_0
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "local boolean variable"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_0
done_for_if_NO_0:
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 31
   ldc 0
   iaload
   invokevirtual java/io/PrintStream/println(I)V
   ldc 4
   newarray       int
   astore 33
   aload 33
   ldc 0
   ldc 11
   iastore
   aload 33
   ldc 1
   ldc 22
   iastore
   aload 33
   ldc 2
   ldc 33
   iastore
   aload 33
   ldc 3
   ldc 44
   iastore
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 33
   invokestatic java/util/Arrays.toString([I)Ljava/lang/String;
   invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
   aload 33
   aload 31
   astore 1
   iload 32
   istore 2
   aload 33
   astore 3
   areturn
.end method
