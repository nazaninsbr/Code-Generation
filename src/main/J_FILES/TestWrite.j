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
   istore 21
   ldc 12
   istore 21
   aload 0 ;this
   ldc 888888
   putfield TestWrite/cvar I
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 0 ;this
   getfield TestWrite/cvar I
   invokevirtual java/io/PrintStream/println(I)V
   ldc "my name is N"
   astore 20
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 20
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "hi"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   iload 21
   aload 20
   astore 1
   iload 21
   istore 2
   ireturn
.end method
