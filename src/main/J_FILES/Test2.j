.class public Test2
.super java/lang/Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public main(I)I
   .limit stack 32
   .limit locals 32
   iload 1
   istore 2
   iload 2
   istore 1
   return
.end method
