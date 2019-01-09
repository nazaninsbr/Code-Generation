.class public conditionalClass
.super Object
.field private aClassBoolean I
.field private aclassString Ljava/lang/String;
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial Object/<init>()V ; call super
   return
.end method
.method public newFunc()I
   .limit stack 256
   .limit locals 256
   iconst_0
   istore 83
   aload 0 ;this
   ldc 1
   ldc 0
   if_icmple jump_to_zero_value0
   iconst_1
   goto jump_to_end_value0
jump_to_zero_value0:
   iconst_0
jump_to_end_value0:
   putfield conditionalClass/aClassBoolean I
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "HIIIIIIIII"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   aload 0 ;this
   ldc "I REALLY HOPE THIS WORKS"
   putfield conditionalClass/aclassString Ljava/lang/String;
   ; create an thisStuff object on top of stack
   new thisStuff
   dup
   invokespecial thisStuff/<init>()V ; call constructor
   astore 82
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "BYEEEEEEE"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   ldc 0
   aload 82
   astore 1
   iload 83
   istore 2
   ireturn
.end method
.method public boolReturnType(I)I
   .limit stack 256
   .limit locals 256
   iload 1
   istore 84
   iconst_0
   istore 85
   aload_0
   invokevirtual conditionalClass/newFunc()I
   istore 85
   aload 0 ;this
   getfield conditionalClass/aClassBoolean I
   ifle done_for_if_NO_4
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 0 ;this
   getfield conditionalClass/aclassString Ljava/lang/String;
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_4
done_for_if_NO_4:
   iload 84
   ifle else_for_if_NO_5
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "boolReturnType TRUE input value"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_5
else_for_if_NO_5:
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "boolReturnType FALSE input value"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
done_for_if_NO_5:
   iconst_1
   iload 84
   istore 1
   iload 85
   istore 2
   ireturn
.end method
.method public checkBooleanStuff()I
   .limit stack 256
   .limit locals 256
   aload_0
   iconst_0
   invokevirtual conditionalClass/boolReturnType(I)I
   ifle done_for_if_NO_6
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "this.boolReturnType()"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_6
done_for_if_NO_6:
   iconst_1
   ifle done_for_if_NO_7
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "true"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_7
done_for_if_NO_7:
   iconst_1
   iconst_0
   iand
   ifle done_for_if_NO_8
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "true && false"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_8
done_for_if_NO_8:
   iconst_0
   ifle done_for_if_NO_9
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "false"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_9
done_for_if_NO_9:
   iconst_1
   iconst_0
   ior
   ifle done_for_if_NO_10
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "true || false"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_10
done_for_if_NO_10:
   iconst_1
   iconst_1
   iand
   ifle done_for_if_NO_11
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "true && !false"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_11
done_for_if_NO_11:
   ldc 1
   ldc 4
   if_icmple done_for_if_NO_12
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "1>4"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_12
done_for_if_NO_12:
   ldc 7
   ldc 1
   iadd
   ldc 6
   if_icmple done_for_if_NO_13
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "7+1>6"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_13
done_for_if_NO_13:
   ldc 1
   ldc 4
   if_icmpge done_for_if_NO_14
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "1<4"
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
   if_icmpeq done_for_if_NO_15
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "1 <> new WhileClass.printInWhile()"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_15
done_for_if_NO_15:
   ldc 1
   ; create an WhileClass object on top of stack
   new WhileClass
   dup
   invokespecial WhileClass/<init>()V ; call constructor
   invokevirtual WhileClass/printInWhile()I
   if_icmpne done_for_if_NO_16
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "1 == new WhileClass.printInWhile()"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_16
done_for_if_NO_16:
   ldc 0
   ireturn
.end method
