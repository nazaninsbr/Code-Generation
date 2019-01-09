.class public thisStuff
.super TestWrite
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial TestWrite/<init>()V ; call super
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
   istore 19
   ldc 12
   iload 19
   istore 1
   ireturn
.end method
.method public aFunc()I
   .limit stack 128
   .limit locals 128
   aload_0
   invokevirtual thisStuff/test()I
   istore 21
   aload_0
   invokevirtual thisStuff/another()I
   iload 21
   istore 1
   ireturn
.end method
