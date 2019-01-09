.class public thisStuff
.super TestWrite
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial TestWrite/<init>()V ; call super
   return
.end method
.method public another()I
   .limit stack 128
   .limit locals 128
   iconst_0
   istore 25
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "============================================="
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ; create an ArrayStuff object on top of stack
   new ArrayStuff
   dup
   invokespecial ArrayStuff/<init>()V ; call constructor
   invokevirtual ArrayStuff/x()I
   invokevirtual java/io/PrintStream/println(I)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "============================================="
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   ldc 12
   iload 25
   istore 1
   ireturn
.end method
.method public aFunc()I
   .limit stack 128
   .limit locals 128
   iconst_0
   istore 27
   aload_0
   invokevirtual thisStuff/test()I
   istore 27
   aload_0
   invokevirtual thisStuff/another()I
   iload 27
   istore 1
   ireturn
.end method
