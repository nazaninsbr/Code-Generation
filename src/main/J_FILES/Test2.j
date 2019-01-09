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
   istore 42
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "IN TEST2 ADD"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   bipush 10
   newarray       int
   astore 41
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 41
   arraylength
   invokevirtual java/io/PrintStream/println(I)V
   ldc 1
   ldc 3
   iadd
   istore 42
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 42
   invokevirtual java/io/PrintStream/println(I)V
   ; create an thisStuff object on top of stack
   new thisStuff
   dup
   invokespecial thisStuff/<init>()V ; call constructor
   astore 43
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 43
   invokevirtual thisStuff/aFunc()I
   invokevirtual java/io/PrintStream/println(I)V
   ldc 14
   aload 41
   astore 1
   iload 42
   istore 2
   ireturn
.end method
.method public print(ILjava/lang/String;)Ljava/lang/String;
   .limit stack 128
   .limit locals 128
   iload 1
   istore 48
   aload 2
   astore 49
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 48
   invokevirtual java/io/PrintStream/println(I)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 49
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   ldc "this is a string return type"
   iload 48
   istore 1
   aload 49
   astore 2
   areturn
.end method
.method public classCreationStuff()I
   .limit stack 128
   .limit locals 128
   iconst_0
   istore 51
   ; create an WhileClass object on top of stack
   new WhileClass
   dup
   invokespecial WhileClass/<init>()V ; call constructor
   astore 50
   aload 50
   invokevirtual WhileClass/printInWhile()I
   istore 51
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 51
   invokevirtual java/io/PrintStream/println(I)V
   ldc 0
   iload 51
   istore 2
   ireturn
.end method
