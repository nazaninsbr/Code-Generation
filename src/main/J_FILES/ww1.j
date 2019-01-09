.class public ww1
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
   ; create an ww3 object on top of stack
   new ww3
   dup
   invokespecial ww3/<init>()V ; call constructor
   invokevirtual ww3/cc()I
   ldc 0
   ireturn
.end method
