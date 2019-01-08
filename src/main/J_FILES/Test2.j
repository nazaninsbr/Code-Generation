.class public Test2
.super Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.field private l 
.field private i I
.field private j [I
.field private x Z
.method public main(I)I
   .limit stack 32
   .limit locals 32
   iload 1
   istore 3
   aload_0
   astore 1
   iconst_1
   invokestatic  #2
   bstore 5
done_for_if_NO_0:
start_of_while_NO_1:
   ldc 1
   ldc 3
   if_icmpne end_of_while_NO_1
   ldc 3
   istore 3
   goto start_of_while_NO_1
end_of_while_NO_1:
   bipush 3
   newarray       int
   ldc 1
   iaload
   iconst_1
   invokestatic  #2
   iconst_0
   invokestatic  #2
   iand
   iconst_1
   invokestatic  #2
   bload 5
   
   iand
   ior
   bstore 5
   iload 3
   istore 1
.end method
