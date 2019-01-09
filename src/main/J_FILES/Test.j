.class public Test
.super Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial Object/<init>()V ; call super
   return
.end method
.method public main()I
   .limit stack 256
   .limit locals 256
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ; create an Math object on top of stack
   new Math
   dup
   invokespecial Math/<init>()V ; call constructor
   ldc 5
   invokevirtual Math/factorial(I)I
   invokevirtual java/io/PrintStream/println(I)V
   ldc 0
   ireturn
.end method
