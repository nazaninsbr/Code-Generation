.class public WhileClass
.super java/lang/Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public printInWhile()I
   .limit stack 32
   .limit locals 32
   ldc 0
   istore 11
start_of_while_NO_0:
   iload 11
   ldc 4
   if_icmpgt end_of_while_NO_0
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "In a loop!!"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   iload 11
   ldc 1
   iadd
   istore 11
   iload 11
   ldc 3
   if_icmpne else_for_if_NO_1
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "3"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_1
else_for_if_NO_1:
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "not 3"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
done_for_if_NO_1:
   goto start_of_while_NO_0
end_of_while_NO_0:
   ldc 1
   ineg
   iload 11
   istore 1
   ireturn
.end method
