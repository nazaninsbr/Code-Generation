.class public ArrayStuff
.super java/lang/Object
.field private anArrayInstance [I
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
   astore 25
   iconst_0
   istore 26
   aload 0 ;this
   bipush 5
   newarray       int
   putfield ArrayStuff/anArrayInstance [I
   iconst_1
   iconst_0
   ior
   istore 26
   iload 26
   ifle done_for_if_NO_0
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "local boolean variable"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_0
done_for_if_NO_0:
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 25
   ldc 0
   iaload
   invokevirtual java/io/PrintStream/println(I)V
   bipush 4
   newarray       int
   astore 27
   aload 27
   ldc 0
   ldc 11
   iastore
   aload 27
   ldc 1
   ldc 22
   iastore
   aload 27
   ldc 2
   ldc 33
   iastore
   aload 27
   ldc 3
   ldc 44
   iastore
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 27
   invokestatic java/util/Arrays.toString([I)Ljava/lang/String;
   invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
   aload 27
   aload 25
   astore 1
   iload 26
   istore 2
   aload 27
   astore 3
   areturn
.end method
