.class public conditionalClass
.super java/lang/Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public boolReturnType(I)I
   .limit stack 128
   .limit locals 128
   iload 1
   istore 71
   iload 71
   ifle else_for_if_NO_4
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "boolReturnType TRUE input value"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_4
else_for_if_NO_4:
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "boolReturnType FALSE input value"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
done_for_if_NO_4:
   iconst_1
   iload 71
   istore 1
   ireturn
.end method
.method public checkBooleanStuff()I
   .limit stack 128
   .limit locals 128
   aload_0
   iconst_0
   invokevirtual conditionalClass/boolReturnType(I)I
   ifle done_for_if_NO_5
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "this.boolReturnType()"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_5
done_for_if_NO_5:
   iconst_1
   ifle done_for_if_NO_6
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "true"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_6
done_for_if_NO_6:
   iconst_1
   iconst_0
   iand
   ifle done_for_if_NO_7
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "true && false"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_7
done_for_if_NO_7:
   iconst_0
   ifle done_for_if_NO_8
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "false"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_8
done_for_if_NO_8:
   iconst_1
   iconst_0
   ior
   ifle done_for_if_NO_9
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "true || false"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_9
done_for_if_NO_9:
   iconst_1
   iconst_1
   iand
   ifle done_for_if_NO_10
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "true && !false"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_10
done_for_if_NO_10:
   ldc 1
   ldc 4
   if_icmple done_for_if_NO_11
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "1>4"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_11
done_for_if_NO_11:
   ldc 7
   ldc 1
   iadd
   ldc 6
   if_icmple done_for_if_NO_12
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "7+1>6"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_12
done_for_if_NO_12:
   ldc 1
   ldc 4
   if_icmpge done_for_if_NO_13
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "1<4"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_13
done_for_if_NO_13:
   ldc 1
   ; create an WhileClass object on top of stack
   new WhileClass
   dup
   invokespecial WhileClass/<init>()V ; call constructor
   invokevirtual WhileClass/printInWhile()I
   if_icmpeq done_for_if_NO_14
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "1 <> new WhileClass.printInWhile()"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_14
done_for_if_NO_14:
   ldc 1
   ; create an WhileClass object on top of stack
   new WhileClass
   dup
   invokespecial WhileClass/<init>()V ; call constructor
   invokevirtual WhileClass/printInWhile()I
   if_icmpne done_for_if_NO_15
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "1 == new WhileClass.printInWhile()"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_15
done_for_if_NO_15:
   ldc 0
   ireturn
.end method
