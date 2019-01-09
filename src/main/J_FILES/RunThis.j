.class public RunThis
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
   ; create an XXX object on top of stack
   new XXX
   dup
   invokespecial XXX/<init>()V ; call constructor
   invokevirtual XXX/main()I
   ldc 0
   ireturn
.end method
