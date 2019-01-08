.class public Test
.super java/lang/Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public main()I
   .limit stack 128
   .limit locals 128
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ; create an Test2 object on top of stack
   new Test2
   dup
   invokespecial Test2/<init>()V ; call constructor
   ldc 1
   ldc 2
   invokevirtual Test2/print(II)I
   invokevirtual java/io/PrintStream/println(I)V
   ; create an Test2 object on top of stack
   new Test2
   dup
   invokespecial Test2/<init>()V ; call constructor
   invokevirtual Test2/add()I
   ; create an conditionalClass object on top of stack
   new conditionalClass
   dup
   invokespecial conditionalClass/<init>()V ; call constructor
   invokevirtual conditionalClass/checkBooleanStuff()I
   ; create an Test2 object on top of stack
   new Test2
   dup
   invokespecial Test2/<init>()V ; call constructor
   invokevirtual Test2/classCreationStuff()I
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ; create an TestWrite object on top of stack
   new TestWrite
   dup
   invokespecial TestWrite/<init>()V ; call constructor
   invokevirtual TestWrite/test()I
   invokevirtual java/io/PrintStream/println(I)V
   ldc 0
   ireturn
.end method
