.class public Test2
.super java/lang/Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public add()I
   .limit stack 32
   .limit locals 32
   ldc 1
   ldc 3
   iadd
   istore 11
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 11
   invokevirtual java/io/PrintStream/println(I)V
   ldc 0
   iload 11
   istore 1
   ireturn
.end method
.method public print(II)I
   .limit stack 32
   .limit locals 32
   iload 1
   istore 12
   iload 2
   istore 13
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 12
   invokevirtual java/io/PrintStream/println(I)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 13
   invokevirtual java/io/PrintStream/println(I)V
   ldc 9
   iload 12
   istore 1
   iload 13
   istore 2
   ireturn
.end method
.method public classCreationStuff()I
   .limit stack 32
   .limit locals 32
   ; create an WhileClass object on top of stack
   new WhileClass
   dup
   invokespecial WhileClass/<init>()V ; call constructor
   astore 14
   aload 14
   invokevirtual WhileClass/printInWhile()I
   istore 15
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 15
   invokevirtual java/io/PrintStream/println(I)V
   ldc 0
   iload 15
   istore 2
   ireturn
.end method
