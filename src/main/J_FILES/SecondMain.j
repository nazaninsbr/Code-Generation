.class public SecondMain
.super Blue
.field private arr [I
.field private x2 I
.field private y I
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial Blue/<init>()V ; call super
   return
.end method
.method public main(LBlue;)I
   .limit stack 128
   .limit locals 128
   aload 1
   astore 13
   aload 0 ;this
   aload 13
   ldc 5
   invokevirtual Blue/setX(I)I
   putfield SecondMain/x2 I
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 0 ;this
   getfield SecondMain/x2 I
   invokevirtual java/io/PrintStream/println(I)V
   aload 0 ;this
   getfield Blue/x I
   aload 13
   astore 1
   ireturn
.end method
