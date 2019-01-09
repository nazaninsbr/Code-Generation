.class public MainClass
.super java/lang/Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public main()I
   .limit stack 128
   .limit locals 128
   ; create an SecondMain object on top of stack
   new SecondMain
   dup
   invokespecial SecondMain/<init>()V ; call constructor
   ; create an Blue object on top of stack
   new Blue
   dup
   invokespecial Blue/<init>()V ; call constructor
   invokevirtual SecondMain/main(LBlue;)I
   ldc 0
   ireturn
.end method
