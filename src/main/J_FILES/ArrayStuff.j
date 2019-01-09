.class public ArrayStuff
.super java/lang/Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public x([I)[I
   .limit stack 128
   .limit locals 128
   aload 1
   astore 19
   iconst_0
   istore 20
   iconst_1
   iconst_0
   ior
   istore 20
   iload 20
   ifle done_for_if_NO_0
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "local boolean variable"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_0
done_for_if_NO_0:
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 19
   ldc 0
   iaload
   invokevirtual java/io/PrintStream/println(I)V
   bipush 4
   newarray       int
   astore 21
   aload 21
   ldc 0
   ldc 11
   iastore
   aload 21
   ldc 1
   ldc 22
   iastore
   aload 21
   ldc 3
   ldc 33
   iastore
   aload 21
   aload 19
   astore 1
   iload 20
   istore 2
   aload 21
   astore 3
   areturn
.end method
