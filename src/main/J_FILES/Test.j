.class public Test
.super Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial Object/<init>()V ; call super
   return
.end method
.method public main()I
   .limit stack 256
   .limit locals 256
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ; create an Test2 object on top of stack
   new Test2
   dup
   invokespecial Test2/<init>()V ; call constructor
   ldc 1
   ldc "string input"
   invokevirtual Test2/print(ILjava/lang/String;)Ljava/lang/String;
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
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
