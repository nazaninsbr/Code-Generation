.class public Y
.super Object
.field private secret Ljava/lang/String;
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial Object/<init>()V ; call super
   return
.end method
.method public changeSecret(Ljava/lang/String;)I
   .limit stack 256
   .limit locals 256
   aload 1
   astore 117
   aload 0 ;this
   aload 117
   putfield Y/secret Ljava/lang/String;
   ldc 0
   aload 117
   astore 1
   ireturn
.end method
