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
   istore 26
   bipush 3
   newarray       int
   astore 27
   aload 27
   ldc 0
   ldc 1000
   iastore
   aload 27
   ldc 1
   ldc 2000
   iastore
   aload 27
   ldc 2
   ldc 3000
   iastore
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "============================================="
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ; create an ArrayStuff object on top of stack
   new ArrayStuff
   dup
   invokespecial ArrayStuff/<init>()V ; call constructor
   aload 27
   invokevirtual ArrayStuff/x([I)[I
   ldc 1
   iaload
   invokevirtual java/io/PrintStream/println(I)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "============================================="
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   ldc 12
   iload 26
   istore 1
   aload 27
   astore 2
   ireturn
.end method
.method public aFunc()I
   .limit stack 128
   .limit locals 128
   iconst_0
   istore 29
   aload_0
   invokevirtual thisStuff/test()I
   istore 29
   aload_0
   invokevirtual thisStuff/another()I
   iload 29
   istore 1
   ireturn
.end method
