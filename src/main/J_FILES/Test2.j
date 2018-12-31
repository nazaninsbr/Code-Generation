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
   iload 1
   istore 2
   bipush 12
   newarray       int
   astore 3
done_for_if_NO_0:
start_of_while_NO_1:
   ldc 3
   istore 2
end_of_while_NO_1:
   ldc 1
   ldc 2
   iadd
   istore 2
   iload 2
   istore 1
.end method
