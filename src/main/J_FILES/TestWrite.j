.class public TestWrite
.super ArrayStuff
.field private cvar I
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial ArrayStuff/<init>()V ; call super
   return
.end method
.method public test()I
   .limit stack 128
   .limit locals 128
   iconst_0
   istore 24
   ldc 12
   istore 24
   aload 0 ;this
   ldc 888888
   putfield TestWrite/cvar I
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 0 ;this
   getfield TestWrite/cvar I
   invokevirtual java/io/PrintStream/println(I)V
   ldc "my name is N"
   astore 23
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 23
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "hi"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   iload 24
   aload 23
   astore 1
   iload 24
   istore 2
   ireturn
.end method
