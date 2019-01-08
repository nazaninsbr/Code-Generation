.class public conditionalClass
.super java/lang/Object
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method
.method public checkBooleanStuff()I
   .limit stack 32
   .limit locals 32
   iconst_1
   ifle done_for_if_NO_2
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "true"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_2
done_for_if_NO_2:
   iconst_1
   iconst_0
   iand
   ifle done_for_if_NO_3
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "true && false"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_3
done_for_if_NO_3:
   iconst_0
   ifle done_for_if_NO_4
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "false"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_4
done_for_if_NO_4:
   iconst_1
   iconst_0
   ior
   ifle done_for_if_NO_5
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "true || false"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_5
done_for_if_NO_5:
   iconst_1
   iconst_1
   iand
   ifle done_for_if_NO_6
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "true && !false"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_6
done_for_if_NO_6:
   ldc 1
   ldc 4
   if_icmplt done_for_if_NO_7
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "1>4"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_7
done_for_if_NO_7:
   ldc 1
   ldc 4
   if_icmpgt done_for_if_NO_8
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "1<4"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_8
done_for_if_NO_8:
   ldc 0
   ireturn
.end method
