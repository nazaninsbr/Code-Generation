.class public TestWrite
.super java/lang/Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public test()I
   .limit stack 128
   .limit locals 128
   ldc 12
   istore 14
   ldc "my name is N"
   astore 13
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 13
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "hi"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   iload 14
   iload 14
   istore 2
   ireturn
.end method
