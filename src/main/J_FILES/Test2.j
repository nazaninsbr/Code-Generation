.class public Test2
.super java/lang/Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public add()I
   .limit stack 128
   .limit locals 128
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "IN TEST2 ADD"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   bipush 10
   newarray       int
   astore 25
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 25
   arraylength
   invokevirtual java/io/PrintStream/println(I)V
   ldc 1
   ldc 3
   iadd
   istore 26
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 26
   invokevirtual java/io/PrintStream/println(I)V
   ; create an thisStuff object on top of stack
   new thisStuff
   dup
   invokespecial thisStuff/<init>()V ; call constructor
   astore 27
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 27
   invokevirtual thisStuff/aFunc()I
   invokevirtual java/io/PrintStream/println(I)V
   ldc 14
   iload 26
   istore 2
   ireturn
.end method
.method public print(II)I
   .limit stack 128
   .limit locals 128
   iload 1
   istore 30
   iload 2
   istore 31
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 30
   invokevirtual java/io/PrintStream/println(I)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 31
   invokevirtual java/io/PrintStream/println(I)V
   ldc 9
   iload 30
   istore 1
   iload 31
   istore 2
   ireturn
.end method
.method public classCreationStuff()I
   .limit stack 128
   .limit locals 128
   ; create an WhileClass object on top of stack
   new WhileClass
   dup
   invokespecial WhileClass/<init>()V ; call constructor
   astore 32
   aload 32
   invokevirtual WhileClass/printInWhile()I
   istore 33
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 33
   invokevirtual java/io/PrintStream/println(I)V
   ldc 0
   iload 33
   istore 2
   ireturn
.end method
