.class public TestWrite
.super java/lang/Object
.field private cvar I
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public test()I
   .limit stack 128
   .limit locals 128
   iconst_0
   istore 17
   ldc 12
   istore 17
   ldc 1
   putfield TestWrite/cvar I
   ldc "my name is N"
   astore 16
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 16
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "hi"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   iload 17
   aload 16
   astore 1
   iload 17
   istore 2
   ireturn
.end method
