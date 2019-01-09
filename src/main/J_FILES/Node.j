.class public Node
.super Object
.field private hasNext I
.field private next LNode;
.field private data I
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
   iconst_0
   putfield Node/hasNext I
   aload 0 ;this
   aload_0
   putfield Node/next LNode;
   aload 0 ;this
   ldc 1
   ineg
   putfield Node/data I
   ldc 0
   ireturn
.end method
.method public setData(I)I
   .limit stack 256
   .limit locals 256
   iload 1
   istore 243
   aload 0 ;this
   iload 243
   putfield Node/data I
   ldc 0
   iload 243
   istore 1
   ireturn
.end method
.method public getData()I
   .limit stack 256
   .limit locals 256
   aload 0 ;this
   getfield Node/data I
   ireturn
.end method
.method public setNextNode(LNode;)I
   .limit stack 256
   .limit locals 256
   aload 1
   astore 244
   aload 0 ;this
   aload 244
   putfield Node/next LNode;
   aload 0 ;this
   iconst_1
   putfield Node/hasNext I
   ldc 0
   aload 244
   astore 1
   ireturn
.end method
.method public unSetNext()I
   .limit stack 256
   .limit locals 256
   aload 0 ;this
   iconst_0
   putfield Node/hasNext I
   ldc 0
   ireturn
.end method
.method public hasNext()I
   .limit stack 256
   .limit locals 256
   aload 0 ;this
   getfield Node/hasNext I
   ireturn
.end method
.method public getNext()LNode;
   .limit stack 256
   .limit locals 256
   aload 0 ;this
   getfield Node/next LNode;
   areturn
.end method
