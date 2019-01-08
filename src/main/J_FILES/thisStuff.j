.class public thisStuff
.super java/lang/Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public another()I
   .limit stack 128
   .limit locals 128
   ; create an ArrayStuff object on top of stack
   new ArrayStuff
   dup
   invokespecial ArrayStuff/<init>()V ; call constructor
   invokevirtual ArrayStuff/x()I
   istore 18
   ldc 12
   iload 18
   istore 1
   ireturn
.end method
.method public aFunc()I
   .limit stack 128
   .limit locals 128
   aload_0
   invokevirtual thisStuff/another()I
   ireturn
.end method
