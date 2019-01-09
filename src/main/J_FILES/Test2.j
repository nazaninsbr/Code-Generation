.class public Test2
.super Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial Object/<init>()V ; call super
   return
.end method
.method public a(I)I
   .limit stack 256
   .limit locals 256
   iload 1
   istore 41
   iload 41
   ldc 2
   iadd
   iload 41
   istore 1
   ireturn
.end method
.method public b()I
   .limit stack 256
   .limit locals 256
   ldc 33
   ireturn
.end method
.method public c(Ljava/lang/String;)Ljava/lang/String;
   .limit stack 256
   .limit locals 256
   aload 1
   astore 42
   aload 42
   aload 42
   astore 1
   areturn
.end method
.method public d()Ljava/lang/String;
   .limit stack 256
   .limit locals 256
   ldc "hello"
   areturn
.end method
.method public e()Ljava/lang/String;
   .limit stack 256
   .limit locals 256
   ; create an Test3 object on top of stack
   new Test3
   dup
   invokespecial Test3/<init>()V ; call constructor
   invokevirtual Test3/aa()Ljava/lang/String;
   areturn
.end method
