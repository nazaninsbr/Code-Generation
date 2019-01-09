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
   istore 55
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "IN TEST2 ADD"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   bipush 10
   newarray       int
   astore 54
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 54
   arraylength
   invokevirtual java/io/PrintStream/println(I)V
   ldc 1
   ldc 3
   iadd
   istore 55
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 55
   invokevirtual java/io/PrintStream/println(I)V
   ; create an thisStuff object on top of stack
   new thisStuff
   dup
   invokespecial thisStuff/<init>()V ; call constructor
   astore 56
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 56
   invokevirtual thisStuff/aFunc()I
   invokevirtual java/io/PrintStream/println(I)V
   ldc 14
   aload 54
   astore 1
   iload 55
   istore 2
   ireturn
.end method
.method public print(ILjava/lang/String;)Ljava/lang/String;
   .limit stack 128
   .limit locals 128
   iload 1
   istore 63
   aload 2
   astore 64
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 63
   invokevirtual java/io/PrintStream/println(I)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 64
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   ldc "this is a string return type"
   iload 63
   istore 1
   aload 64
   astore 2
   areturn
.end method
.method public classCreationStuff()I
   .limit stack 128
   .limit locals 128
   iconst_0
   istore 66
   ; create an WhileClass object on top of stack
   new WhileClass
   dup
   invokespecial WhileClass/<init>()V ; call constructor
   astore 65
   aload 65
   invokevirtual WhileClass/printInWhile()I
   istore 66
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 66
   invokevirtual java/io/PrintStream/println(I)V
   ldc 0
   iload 66
   istore 2
   ireturn
.end method
