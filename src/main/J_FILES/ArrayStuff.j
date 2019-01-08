.class public ArrayStuff
.super java/lang/Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public x()I
   .limit stack 128
   .limit locals 128
   ldc 1234
   ineg
   ireturn
.end method
