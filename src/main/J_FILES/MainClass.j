.class public MainClass
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
