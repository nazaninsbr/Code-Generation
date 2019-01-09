.class public ww3
.super ww4
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial ww4/<init>()V ; call super
   return
.end method
.method public bb()I
   .limit stack 256
   .limit locals 256
   aload 0 ;this
   ldc 45
   putfield ww4/a I
   aload 0 ;this
   getfield ww4/a I
   ireturn
.end method
.method public cc()I
   .limit stack 256
   .limit locals 256
   ldc "Object"
   astore 19
   ldc 4
   newarray       int
   astore 18
   ldc "hello"
   astore 19
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ; create an ww2 object on top of stack
   new ww2
   dup
   invokespecial ww2/<init>()V ; call constructor
   ldc 11
   aload 18
   aload 19
   ; create an ww3 object on top of stack
   new ww3
   dup
   invokespecial ww3/<init>()V ; call constructor
   invokevirtual ww2/a(I[ILjava/lang/String;Lww3;)[I
   invokestatic java/util/Arrays.toString([I)Ljava/lang/String;
   invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
   ldc 10
   aload 18
   astore 1
   aload 19
   astore 2
   ireturn
.end method
