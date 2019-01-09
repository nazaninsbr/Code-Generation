.class public Test2
.super Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial Object/<init>()V ; call super
   return
.end method
.method public add()I
   .limit stack 256
   .limit locals 256
   iconst_0
   istore 62
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "IN TEST2 ADD"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   ldc 10
   newarray       int
   astore 61
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 61
   arraylength
   invokevirtual java/io/PrintStream/println(I)V
   ldc 1
   ldc 3
   iadd
   istore 62
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 62
   invokevirtual java/io/PrintStream/println(I)V
   ; create an thisStuff object on top of stack
   new thisStuff
   dup
   invokespecial thisStuff/<init>()V ; call constructor
   astore 63
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 63
   invokevirtual thisStuff/aFunc()I
   invokevirtual java/io/PrintStream/println(I)V
   ldc 14
   aload 61
   astore 1
   iload 62
   istore 2
   aload 63
   astore 3
   ireturn
.end method
.method public print(ILjava/lang/String;)Ljava/lang/String;
   .limit stack 256
   .limit locals 256
   iload 1
   istore 70
   aload 2
   astore 71
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 70
   invokevirtual java/io/PrintStream/println(I)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 71
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   ldc "this is a string return type"
   iload 70
   istore 1
   aload 71
   astore 2
   areturn
.end method
.method public classCreationStuff()I
   .limit stack 256
   .limit locals 256
   iconst_0
   istore 73
   ; create an WhileClass object on top of stack
   new WhileClass
   dup
   invokespecial WhileClass/<init>()V ; call constructor
   astore 72
   aload 72
   invokevirtual WhileClass/printInWhile()I
   istore 73
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 73
   invokevirtual java/io/PrintStream/println(I)V
   ldc 0
   aload 72
   astore 1
   iload 73
   istore 2
   ireturn
.end method
