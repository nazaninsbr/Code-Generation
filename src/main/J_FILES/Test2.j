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
   istore 54
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "IN TEST2 ADD"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   bipush 10
   newarray       int
   astore 53
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 53
   arraylength
   invokevirtual java/io/PrintStream/println(I)V
   ldc 1
   ldc 3
   iadd
   istore 54
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 54
   invokevirtual java/io/PrintStream/println(I)V
   ; create an thisStuff object on top of stack
   new thisStuff
   dup
   invokespecial thisStuff/<init>()V ; call constructor
   astore 55
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 55
   invokevirtual thisStuff/aFunc()I
   invokevirtual java/io/PrintStream/println(I)V
   ldc 14
   aload 53
   astore 1
   iload 54
   istore 2
   ireturn
.end method
.method public print(ILjava/lang/String;)Ljava/lang/String;
   .limit stack 128
   .limit locals 128
   iload 1
   istore 62
   aload 2
   astore 63
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 62
   invokevirtual java/io/PrintStream/println(I)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 63
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   ldc "this is a string return type"
   iload 62
   istore 1
   aload 63
   astore 2
   areturn
.end method
.method public classCreationStuff()I
   .limit stack 128
   .limit locals 128
   iconst_0
   istore 65
   ; create an WhileClass object on top of stack
   new WhileClass
   dup
   invokespecial WhileClass/<init>()V ; call constructor
   astore 64
   aload 64
   invokevirtual WhileClass/printInWhile()I
   istore 65
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 65
   invokevirtual java/io/PrintStream/println(I)V
   ldc 0
   iload 65
   istore 2
   ireturn
.end method
