.class public Test
.super Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public main()I
   .limit stack 32
   .limit locals 32
   ldc 1
   ldc 2
   iadd
   ldc "hi"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   ldc 2
   getstatic java/lang/System/out Ljava/io/PrintStream;
   invokevirtual java/io/PrintStream/println(I)V
.end method
