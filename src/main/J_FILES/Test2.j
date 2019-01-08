.class public Test2
.super java/lang/Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public main()I
   .limit stack 32
   .limit locals 32
   ldc 1
   ldc 3
   iadd
   istore 7
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 7
   invokevirtual java/io/PrintStream/println(I)V
   ldc 0
   iload 7
   istore 1
   ireturn
.end method
.method public main2(I[Ljava/lang/String;)I
   .limit stack 32
   .limit locals 32
   iload 1
   istore 8
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 8
   invokevirtual java/io/PrintStream/println(I)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 9
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   iload 8
   iload 8
   istore 1
   ireturn
.end method
