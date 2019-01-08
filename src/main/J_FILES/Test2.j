.class public Test2
.super Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.field private i I
.field private x Z
.method public main(I)I
   .limit stack 32
   .limit locals 32
   iload 1
   istore 2
   iconst_0
   bstore 3
   ldc 0
   iload 2
   istore 1
   ireturn
.end method
