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
   ; create an Test2 object on top of stack
   new Test2
   dup
   invokespecial Test2/<init>()V ; call constructor
invokevirtual Test2/main()I
   ; create an Test2 object on top of stack
   new Test2
   dup
   invokespecial Test2/<init>()V ; call constructor
   ldc 123
   ldc "hello"
invokevirtual Test2/main2(I[Ljava/lang/String;)I
   ldc 0
   ireturn
.end method
