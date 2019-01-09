.class public XXX
.super Object
.field private a I
.field private b I
.field private c I
.field private d Ljava/lang/String;
.field private k I
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial Object/<init>()V ; call super
   return
.end method
.method public main()I
   .limit stack 256
   .limit locals 256
   ; create an Helper object on top of stack
   new Helper
   dup
   invokespecial Helper/<init>()V ; call constructor
   astore 13
   ; create an LinkedList object on top of stack
   new LinkedList
   dup
   invokespecial LinkedList/<init>()V ; call constructor
   astore 15
   ; create an X object on top of stack
   new X
   dup
   invokespecial X/<init>()V ; call constructor
   astore 14
   ldc 1
   ldc 2
   if_icmpeq else_for_if_NO_0
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "ok"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   goto done_for_if_NO_0
else_for_if_NO_0:
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "nnoooooo"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
done_for_if_NO_0:
   ldc 11
   aload 13
   astore 1
   aload 14
   astore 2
   aload 15
   astore 3
   ireturn
.end method
