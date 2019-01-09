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
   istore 23
   ldc 12
   iload 23
   istore 1
   ireturn
.end method
.method public aFunc()I
   .limit stack 128
   .limit locals 128
   aload_0
   invokevirtual thisStuff/test()I
   istore 25
   aload_0
   invokevirtual thisStuff/another()I
   iload 25
   istore 1
   ireturn
.end method
