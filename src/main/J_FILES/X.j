.class public X
.super Y
.field private i I
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial Y/<init>()V ; call super
   return
.end method
.method public setI(I)I
   .limit stack 256
   .limit locals 256
   iload 1
   istore 125
   aload 0 ;this
   aload 0 ;this
   getfield X/i I
   dup
   putfield X/i I
   iload 125
   istore 1
   ireturn
.end method
.method public getI()I
   .limit stack 256
   .limit locals 256
   aload 0 ;this
   getfield X/i I
   ireturn
.end method
.method public getParentSecret()Ljava/lang/String;
   .limit stack 256
   .limit locals 256
   aload 0 ;this
   getfield Y/secret Ljava/lang/String;
   areturn
.end method
.method public getSecret()Ljava/lang/String;
   .limit stack 256
   .limit locals 256
   aload 0 ;this
   getfield Y/secret Ljava/lang/String;
   areturn
.end method
