.class public Emp
.super Object
.field private uu I
; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial Object/<init>()V ; call super
   return
.end method
.method public returnAnEmp()LEmp;
   .limit stack 256
   .limit locals 256
   aload 0 ;this
   iconst_1
   putfield Emp/uu I
   ; create an Emp object on top of stack
   new Emp
   dup
   invokespecial Emp/<init>()V ; call constructor
   astore 19
   aload 19
   aload 19
   astore 1
   areturn
.end method
.method public getBool()I
   .limit stack 256
   .limit locals 256
   aload 0 ;this
   getfield Emp/uu I
   ireturn
.end method
