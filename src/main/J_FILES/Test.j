.class public Test
.super java/lang/Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public main()I
   .limit stack 32
   .limit locals 32
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ; create an Test2 object on top of stack
   new Test2
   dup
   invokespecial Test2/<init>()V ; call constructor
   ldc 1
   ldc 2
   invokevirtual Test2/print(II)I
   invokevirtual java/io/PrintStream/println(I)V
   ; create an WhileClass object on top of stack
   new WhileClass
   dup
   invokespecial WhileClass/<init>()V ; call constructor
   invokevirtual WhileClass/printInWhile()I
   ; create an conditionalClass object on top of stack
   new conditionalClass
   dup
   invokespecial conditionalClass/<init>()V ; call constructor
   invokevirtual conditionalClass/checkBooleanStuff()I
   ldc 0
   ireturn
.end method
