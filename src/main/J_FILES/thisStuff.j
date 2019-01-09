.class public thisStuff
.super TestWrite
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial TestWrite/<init>()V ; call super
   return
.end method
.method public another()I
   .limit stack 128
   .limit locals 128
   iconst_0
   istore 36
   bipush 3
   newarray       int
   astore 37
   aload 37
   ldc 0
   ldc 1000
   iastore
   aload 37
   ldc 1
   ldc 2000
   iastore
   aload 37
   ldc 2
   ldc 3000
   iastore
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "============================================="
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ; create an ArrayStuff object on top of stack
   new ArrayStuff
   dup
   invokespecial ArrayStuff/<init>()V ; call constructor
   aload 37
   invokevirtual ArrayStuff/x([I)[I
   invokestatic java/util/Arrays.toString([I)Ljava/lang/String;
   invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "============================================="
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   ldc 12
   iload 36
   istore 1
   aload 37
   astore 2
   ireturn
.end method
.method public aFunc()I
   .limit stack 128
   .limit locals 128
   iconst_0
   istore 40
   iconst_0
   istore 41
   aload_0
   invokevirtual thisStuff/test()I
   istore 40
   iload 40
   ldc 777
   ineg
   istore 41
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "*******************************************"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 41
   invokevirtual java/io/PrintStream/println(I)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "*******************************************"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   aload_0
   invokevirtual thisStuff/another()I
   iload 40
   istore 1
   iload 41
   istore 2
   ireturn
.end method
