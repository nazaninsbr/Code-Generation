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
   iconst_0
   istore 58
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "IN TEST2 ADD"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   bipush 10
   newarray       int
   astore 57
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 57
   arraylength
   invokevirtual java/io/PrintStream/println(I)V
   ldc 1
   ldc 3
   iadd
   istore 58
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 58
   invokevirtual java/io/PrintStream/println(I)V
   ; create an thisStuff object on top of stack
   new thisStuff
   dup
   invokespecial thisStuff/<init>()V ; call constructor
   astore 59
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 59
   invokevirtual thisStuff/aFunc()I
   invokevirtual java/io/PrintStream/println(I)V
   ldc 14
   aload 57
   astore 1
   iload 58
   istore 2
   aload 59
   astore 3
   ireturn
.end method
.method public print(ILjava/lang/String;)Ljava/lang/String;
   .limit stack 128
   .limit locals 128
   iload 1
   istore 66
   aload 2
   astore 67
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 66
   invokevirtual java/io/PrintStream/println(I)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 67
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   ldc "this is a string return type"
   iload 66
   istore 1
   aload 67
   astore 2
   areturn
.end method
.method public classCreationStuff()I
   .limit stack 128
   .limit locals 128
   iconst_0
   istore 69
   ; create an WhileClass object on top of stack
   new WhileClass
   dup
   invokespecial WhileClass/<init>()V ; call constructor
   astore 68
   aload 68
   invokevirtual WhileClass/printInWhile()I
   istore 69
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 69
   invokevirtual java/io/PrintStream/println(I)V
   ldc 0
   aload 68
   astore 1
   iload 69
   istore 2
   ireturn
.end method
