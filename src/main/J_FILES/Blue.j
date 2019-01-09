.class public Blue
.super java/lang/Object
.field private x I
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public setX(I)I
   .limit stack 128
   .limit locals 128
   iload 1
   istore 22
   ; create an Emp object on top of stack
   new Emp
   dup
   invokespecial Emp/<init>()V ; call constructor
   astore 23
   aload 23
   invokevirtual Emp/returnAnEmp()LEmp;
   astore 24
   aload 24
   invokevirtual Emp/getBool()I
   ifle done_for_if_NO_0
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "NOT TO BE PRINTED"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_0
done_for_if_NO_0:
   aload 23
   invokevirtual Emp/getBool()I
   ifle done_for_if_NO_1
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "PRINTED"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_1
done_for_if_NO_1:
   aload 0 ;this
   iload 22
   putfield Blue/x I
   aload 0 ;this
   getfield Blue/x I
   iload 22
   istore 1
   aload 23
   astore 2
   aload 24
   astore 3
   ireturn
.end method
