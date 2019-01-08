.class public Test
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
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc 1
   ldc 3
   ldc 6
   imul
   iadd
   invokevirtual java/io/PrintStream/println(I)V
   ldc 0
   ireturn
.end method
