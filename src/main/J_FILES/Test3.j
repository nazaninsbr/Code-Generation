.class public Test3
.super Object
.field private a Ljava/lang/String;
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial Object/<init>()V ; call super
   return
.end method
.method public cc()I
   .limit stack 256
   .limit locals 256
   aload 0 ;this
   ldc "bye"
   putfield Test3/a Ljava/lang/String;
   ldc 0
   ireturn
.end method
.method public aa()Ljava/lang/String;
   .limit stack 256
   .limit locals 256
   aload_0
   invokevirtual Test3/cc()I
   ldc 1
   iadd
   aload 0 ;this
   getfield Test3/a Ljava/lang/String;
   areturn
.end method
.method public bb()LTest4;
   .limit stack 256
   .limit locals 256
   ; create an Test4 object on top of stack
   new Test4
   dup
   invokespecial Test4/<init>()V ; call constructor
   areturn
.end method
