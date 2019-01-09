.class public Helper
.super Object
.field private b I
.field private i I
.field private s Ljava/lang/String;
.field private a [I
.field private x LX;
.field private tmp I
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial Object/<init>()V ; call super
   return
.end method
.method public pow(II)I
   .limit stack 256
   .limit locals 256
   iload 1
   istore 28
   iload 2
   istore 29
   iconst_0
   istore 30
   aload 0 ;this
   getfield Helper/b I
   ldc 0
   if_icmpne done_for_if_NO_1
   ldc 1
   istore 30
   goto done_for_if_NO_1
done_for_if_NO_1:
   aload 0 ;this
   getfield Helper/b I
   ldc 1
   if_icmpne else_for_if_NO_2
   aload 0 ;this
   getfield Helper/a I
   istore 30
   goto done_for_if_NO_2
else_for_if_NO_2:
   aload_0
   aload 0 ;this
   getfield Helper/a I
   aload 0 ;this
   getfield Helper/b I
   ldc 1
   isub
   invokevirtual Helper/pow(II)I
   istore 30
done_for_if_NO_2:
   iload 30
   iload 28
   istore 1
   iload 29
   istore 2
   iload 30
   istore 3
   ireturn
.end method
.method public someFunc(II)I
   .limit stack 256
   .limit locals 256
   iload 1
   istore 43
   iload 2
   istore 44
   aload 0 ;this
   ldc 231
   aload 0 ;this
   getfield Helper/i I
   aload 0 ;this
   getfield Helper/a I
   aload 0 ;this
   getfield Helper/i I
   imul
   ldc 1
   iadd
   iadd
   idiv
   ldc 1
   iadd
   putfield Helper/a I
   aload 0 ;this
   ldc 234
   aload 0 ;this
   getfield Helper/i I
   ldc 1
   iadd
   aload 0 ;this
   getfield Helper/i I
   ldc 1
   iadd
   aload 0 ;this
   getfield Helper/i I
   ldc 1
   iadd
   idiv
   idiv
   idiv
   putfield Helper/i I
   aload 0 ;this
   getfield Helper/i I
   aload 0 ;this
   getfield Helper/i I
   ldc 1
   iadd
   idiv
   iload 43
   istore 1
   iload 44
   istore 2
   ireturn
.end method
.method public changeAll2(II)I
   .limit stack 256
   .limit locals 256
   iload 1
   istore 45
   iload 2
   istore 46
   iconst_0
   istore 47
   aload 0 ;this
   aload_0
   ldc 31
   ldc 3123
   invokevirtual Helper/someFunc(II)I
   putfield Helper/tmp I
   aload 0 ;this
   ldc 100
   newarray       int
   putfield Helper/a [I
   aload 0 ;this
   ldc 0
   putfield Helper/i I
start_of_while_NO_3:
   aload 0 ;this
   getfield Helper/i I
   iload 45
   if_icmpge end_of_while_NO_3
   aload 0 ;this
   getfield Helper/a [I
   aload 0 ;this
   getfield Helper/i I
   aload 0 ;this
   getfield Helper/i I
   iload 46
   imul
   iload 45
   iadd
   iastore
   aload 0 ;this
   aload 0 ;this
   getfield Helper/i I
   ldc 1
   iadd
   putfield Helper/i I
   goto start_of_while_NO_3
end_of_while_NO_3:
   aload 0 ;this
   ldc 0
   putfield Helper/i I
start_of_while_NO_4:
   aload 0 ;this
   getfield Helper/i I
   iload 45
   ldc 1
   isub
   if_icmpge end_of_while_NO_4
   aload 0 ;this
   getfield Helper/a [I
   aload 0 ;this
   getfield Helper/i I
   aload 0 ;this
   getfield Helper/a [I
   aload 0 ;this
   getfield Helper/i I
   ldc 1
   iadd
   iaload
   ldc 100
   iload 45
   iadd
   iadd
   iastore
   aload 0 ;this
   aload 0 ;this
   getfield Helper/i I
   ldc 2
   iadd
   putfield Helper/i I
   goto start_of_while_NO_4
end_of_while_NO_4:
   aload 0 ;this
   ldc 1
   putfield Helper/i I
start_of_while_NO_5:
   aload 0 ;this
   getfield Helper/i I
   iload 45
   if_icmpge end_of_while_NO_5
   aload 0 ;this
   getfield Helper/a [I
   aload 0 ;this
   getfield Helper/i I
   ldc 2
   idiv
   aload 0 ;this
   getfield Helper/a [I
   aload 0 ;this
   getfield Helper/i I
   ldc 1
   isub
   iaload
   iastore
   aload 0 ;this
   aload 0 ;this
   getfield Helper/i I
   ldc 1
   iadd
   putfield Helper/i I
   goto start_of_while_NO_5
end_of_while_NO_5:
   ldc 0
   iload 45
   istore 1
   iload 46
   istore 2
   iload 47
   istore 3
   ireturn
.end method
.method public changeAll(IILjava/lang/String;)I
   .limit stack 256
   .limit locals 256
   iload 1
   istore 60
   iload 2
   istore 61
   aload 3
   astore 62
   aload 0 ;this
   iconst_1
   putfield Helper/b I
   aload 0 ;this
   ldc 10001
   putfield Helper/i I
   aload 0 ;this
   aload 62
   putfield Helper/s Ljava/lang/String;
   aload 0 ;this
   ldc 150
   newarray       int
   putfield Helper/a [I
   aload 0 ;this
   getfield Helper/a [I
   ldc 0
   iload 60
   iload 61
   iadd
   iastore
   aload 0 ;this
   getfield Helper/a [I
   ldc 10
   iload 60
   iload 61
   idiv
   iastore
   aload 0 ;this
   getfield Helper/a [I
   ldc 100
   iload 60
   iload 61
   isub
   ldc 2
   aload 0 ;this
   getfield Helper/a [I
   ldc 10
   iaload
   ldc 100
   isub
   iadd
   ldc 34
   ldc 3
   idiv
   iadd
   iadd
   iastore
   aload 0 ;this
   getfield Helper/a [I
   ldc 2
   aload 0 ;this
   getfield Helper/a [I
   ldc 0
   iaload
   aload 0 ;this
   getfield Helper/a [I
   ldc 1
   iaload
   aload 0 ;this
   getfield Helper/a [I
   ldc 100
   iaload
   imul
   iadd
   iastore
   aload 0 ;this
   ; create an X object on top of stack
   new X
   dup
   invokespecial X/<init>()V ; call constructor
   putfield Helper/x LX;
   aload 0 ;this
   aload 0 ;this
   getfield Helper/x LX;
   ldc 50
   ineg
   invokevirtual X/setI(I)I
   putfield Helper/tmp I
   iload 60
   iload 60
   istore 1
   iload 61
   istore 2
   aload 62
   astore 3
   ireturn
.end method
.method public printAll()Ljava/lang/String;
   .limit stack 256
   .limit locals 256
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "------------"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 0 ;this
   getfield Helper/a [I
   arraylength
   invokevirtual java/io/PrintStream/println(I)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc 3
   ldc 3
   ldc 5
   ldc 6
   ldc 7
   idiv
   imul
   aload 0 ;this
   getfield Helper/a [I
   ldc 3
   iaload
   aload 0 ;this
   getfield Helper/a [I
   ldc 4
   iaload
   aload 0 ;this
   getfield Helper/i I
   imul
   aload 0 ;this
   getfield Helper/i I
   iadd
   idiv
   ldc 1
   iadd
   iadd
   isub
   iadd
   invokevirtual java/io/PrintStream/println(I)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 0 ;this
   getfield Helper/a [I
   invokestatic java/util/Arrays.toString([I)Ljava/lang/String;
   invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload_0
   ldc 12
   ldc 6
   invokevirtual Helper/pow(II)I
   invokevirtual java/io/PrintStream/println(I)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc 10
   newarray       int
   ldc 5
   iaload
   ldc 32
   idiv
   invokevirtual java/io/PrintStream/println(I)V
   aload 0 ;this
   ; create an X object on top of stack
   new X
   dup
   invokespecial X/<init>()V ; call constructor
   putfield Helper/x LX;
   aload 0 ;this
   aload 0 ;this
   getfield Helper/x LX;
   ldc 1000
   invokevirtual X/setI(I)I
   putfield Helper/tmp I
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 0 ;this
   getfield Helper/x LX;
   invokevirtual X/getI()I
   invokevirtual java/io/PrintStream/println(I)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 0 ;this
   getfield Helper/i I
   invokevirtual java/io/PrintStream/println(I)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 0 ;this
   getfield Helper/s Ljava/lang/String;
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 0 ;this
   getfield Helper/a [I
   invokestatic java/util/Arrays.toString([I)Ljava/lang/String;
   invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload_0
   invokevirtual Helper/toString()Ljava/lang/String;
   aload 0 ;this
   aload 0 ;this
   getfield Helper/i I
   ineg
   putfield Helper/i I
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 0 ;this
   getfield Helper/i I
   invokevirtual java/io/PrintStream/println(I)V
   aload 0 ;this
   getfield Helper/b I
   ifle else_for_if_NO_6
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "true"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_6
else_for_if_NO_6:
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "false"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
done_for_if_NO_6:
   aload 0 ;this
   aload 0 ;this
   getfield Helper/i I
   aload 0 ;this
   getfield Helper/i I
   ldc 34
   idiv
   iadd
   putfield Helper/i I
   aload 0 ;this
   ldc "fsdffs"
   putfield Helper/s Ljava/lang/String;
   aload 0 ;this
   aload 0 ;this
   getfield Helper/x LX;
   invokevirtual X/toString()Ljava/lang/String;
   putfield Helper/s Ljava/lang/String;
   aload 0 ;this
   ldc 100
   newarray       int
   putfield Helper/a [I
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "this is a block!"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   ldc "ok"
   areturn
.end method
.method public getArray()[I
   .limit stack 256
   .limit locals 256
   aload 0 ;this
   getfield Helper/a [I
   areturn
.end method
