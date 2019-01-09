.class public LinkedList
.super Object
.field private head LNode;
.field private tmp I
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial Object/<init>()V ; call super
   return
.end method
.method public constructor()I
   .limit stack 256
   .limit locals 256
   aload 0 ;this
   ; create an Node object on top of stack
   new Node
   dup
   invokespecial Node/<init>()V ; call constructor
   putfield LinkedList/head LNode;
   aload 0 ;this
   aload 0 ;this
   getfield LinkedList/head LNode;
   invokevirtual Node/constructor()I
   putfield LinkedList/tmp I
   ldc 0
   ireturn
.end method
.method public getLastNode()LNode;
   .limit stack 256
   .limit locals 256
   aload 0 ;this
   getfield LinkedList/head LNode;
   astore 142
start_of_while_NO_7:
   aload 142
   invokevirtual Node/hasNext()I
   ifle end_of_while_NO_7
   aload 142
   invokevirtual Node/getNext()LNode;
   astore 142
   goto start_of_while_NO_7
end_of_while_NO_7:
   aload 142
   aload 142
   astore 1
   areturn
.end method
.method public push(I)I
   .limit stack 256
   .limit locals 256
   iload 1
   istore 163
   ; create an Node object on top of stack
   new Node
   dup
   invokespecial Node/<init>()V ; call constructor
   astore 164
   aload 0 ;this
   aload 164
   invokevirtual Node/constructor()I
   putfield LinkedList/tmp I
   aload 0 ;this
   aload 164
   iload 163
   invokevirtual Node/setData(I)I
   putfield LinkedList/tmp I
   aload 0 ;this
   aload_0
   invokevirtual LinkedList/getLastNode()LNode;
   aload 164
   invokevirtual Node/setNextNode(LNode;)I
   putfield LinkedList/tmp I
   ldc 0
   iload 163
   istore 1
   aload 164
   astore 2
   aload 165
   astore 3
   ireturn
.end method
.method public printAllNode()I
   .limit stack 256
   .limit locals 256
   aload 0 ;this
   getfield LinkedList/head LNode;
   astore 202
start_of_while_NO_8:
   aload 202
   invokevirtual Node/hasNext()I
   ifle end_of_while_NO_8
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 202
   invokevirtual Node/getData()I
   invokevirtual java/io/PrintStream/println(I)V
   aload 202
   invokevirtual Node/getNext()LNode;
   astore 202
   goto start_of_while_NO_8
end_of_while_NO_8:
   ldc 0
   aload 202
   astore 1
   ireturn
.end method
