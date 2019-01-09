.class public Math
.super Object
.field private i I
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial Object/<init>()V ; call super
   return
.end method
.method public factorial(I)I
   .limit stack 256
   .limit locals 256
   iload 1
   istore 5
   iconst_0
   istore 6
   ldc 1
   istore 6
start_of_while_NO_0:
   iload 5
   ldc 0
   if_icmpeq end_of_while_NO_0
   iload 6
   iload 5
   imul
   istore 6
   iload 5
   ldc 1
   isub
   istore 5
   goto start_of_while_NO_0
end_of_while_NO_0:
   iload 6
   iload 5
   istore 1
   iload 6
   istore 2
   ireturn
.end method
