.class public ArrayStuff
.super java/lang/Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public x()I
   .limit stack 128
   .limit locals 128
   iconst_0
   istore 19
   iconst_1
   iconst_0
   ior
   istore 19
   iload 19
   ifle done_for_if_NO_0
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "local boolean variable"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_0
done_for_if_NO_0:
   bipush 4
   newarray       int
   astore 20
   aload 20
   ldc 2
   ldc 12345
   iastore
   aload 20
   ldc 2
   iaload
   iload 19
   istore 1
   aload 20
   astore 2
   ireturn
.end method
