.class public Test2
.super Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public main(I)I
   .limit stack 32
   .limit locals 32
   iload_1
   istore_2
   iconst_1
   iconst_2
   iadd
   iload_2
   istore_1
.end method
