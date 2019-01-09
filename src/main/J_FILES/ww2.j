.class public ww2
.super Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial Object/<init>()V ; call super
   return
.end method
.method public a(I[ILjava/lang/String;Lww3;)[I
   .limit stack 256
   .limit locals 256
   iload 1
   istore 6
   aload 2
   astore 7
   aload 3
   astore 8
   aload 4
   astore 9
   aload 7
   ldc 0
   iload 6
   ldc 2
   ldc 3
   imul
   imul
   iastore
   aload 7
   ldc 1
   aload 7
   ldc 0
   iaload
   aload 9
   invokevirtual ww3/bb()I
   iadd
   iastore
   aload 7
   ldc 2
   ldc 1
   ldc 2
   ldc 3
   idiv
   imul
   ldc 4
   ldc 5
   ineg
   isub
   iadd
   iastore
   aload 7
   ldc 3
   ldc 100
   iastore
   aload 7
   iload 6
   istore 1
   aload 7
   astore 2
   aload 8
   astore 3
   aload 9
   astore 4
   areturn
.end method
