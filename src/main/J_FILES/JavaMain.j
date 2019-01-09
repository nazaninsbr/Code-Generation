.class public JavaMain
.super java/lang/Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public static main([Ljava/lang/String;)V
   .limit stack 32
   .limit locals 32
   new Test
   dup
   invokespecial Test/<init>()V ; call constructor
   invokevirtual Test/main()I
   return
.end method
