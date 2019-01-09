.class public Test4
.super Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial Object/<init>()V ; call super
   return
.end method
.method public aaa(I)[I
   .limit stack 256
   .limit locals 256
   iload 1
   istore 56
   ldc 2
   newarray       int
   astore 57
   aload 57
   ldc 0
   iload 56
   iastore
   aload 57
   ldc 1
   ldc 1
   iastore
   aload 57
   iload 56
   istore 1
   aload 57
   astore 2
   areturn
.end method
