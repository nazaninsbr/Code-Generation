.class public WhileClass
.super java/lang/Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public printInWhile()I
   .limit stack 128
   .limit locals 128
   iconst_0
   istore 69
   ldc 0
   istore 69
start_of_while_NO_1:
   iload 69
   ldc 4
   if_icmpge end_of_while_NO_1
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "In a loop!!"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   iload 69
   ldc 1
   iadd
   istore 69
   iload 69
   ldc 3
   if_icmpne else_for_if_NO_2
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "3"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_2
else_for_if_NO_2:
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "not 3"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
done_for_if_NO_2:
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 69
   invokevirtual java/io/PrintStream/println(I)V
   goto start_of_while_NO_1
end_of_while_NO_1:
start_of_while_NO_3:
   iload 69
   ldc 1
   if_icmple end_of_while_NO_3
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "------ In a loop 2 -----!!"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   iload 69
   ldc 1
   isub
   istore 69
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 69
   invokevirtual java/io/PrintStream/println(I)V
   goto start_of_while_NO_3
end_of_while_NO_3:
   ldc 1
   ineg
   iload 69
   istore 1
   ireturn
.end method
