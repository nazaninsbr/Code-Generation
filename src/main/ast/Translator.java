package ast;

import java.util.ArrayList;
import java.util.*;
import java.io.*;

import symbolTable.*;
import ast.node.declaration.ClassDeclaration;
import ast.node.declaration.VarDeclaration;
import ast.node.expression.BinaryOperator;
import ast.node.expression.UnaryOperator;
import ast.node.expression.*;

public class Translator {

    private static final String FOLDER ="./J_FILES/";
    private int binary_number_jump_condition;
	private HashMap<String, ArrayList<String>> commands;

	public Translator() {
        this.commands = new HashMap<String, ArrayList<String>>();
        this.binary_number_jump_condition = 0;
    }

    public void addJavaMainClass(String main_class_name){
        this.commands.put("JavaMain", new ArrayList<String>());
        ArrayList<String> c = this.commands.get("JavaMain");
        c.add(".class public JavaMain");
        c.add(".super java/lang/Object");
        c.add("; default constructor");
        c.add(".method public <init>()V");
        c.add("   aload_0 ; push this");
        c.add("   invokespecial java/lang/Object/<init>()V ; call super");
        c.add("   return");
        c.add(".end method");
        c.add(".method public static main([Ljava/lang/String;)V");
        c.add("   .limit stack 32");
        c.add("   .limit locals 32");
        c.add("   new "+main_class_name);
        c.add("   dup");
        c.add("   invokespecial "+main_class_name+"/<init>()V ; call constructor");
        c.add("   invokevirtual "+main_class_name+"/main()I");
        c.add("   return");
        c.add(".end method");
    }

    public void createFileForClass(String class_name, String parent_name, ClassDeclaration classDeclaration){
    	this.commands.put(class_name, new ArrayList<String>());
    	ArrayList<String> c = this.commands.get(class_name);
    	c.add(".class public "+class_name);
    	if(parent_name.equals("null") || parent_name.equals("Object")){
    		c.add(".super java/lang/Object");
    	}
    	else {
    		c.add(".super "+parent_name);
    	}

        ArrayList<VarDeclaration> vars = classDeclaration.getVarDeclarations(); 
        for(int j=0; j<vars.size(); j++){
            this.performVarDeclaration(class_name,vars.get(j).getIdentifier().getName(),vars.get(j).getType().toString());
        }

    	c.add("; default constructor");
    	c.add(".method public <init>()V");
    	c.add("   aload_0 ; push this");
        if(parent_name.equals("null") || parent_name.equals("Object")){
            c.add("   invokespecial java/lang/Object/<init>()V ; call super");
        }
        else{
    	   c.add("   invokespecial "+parent_name+"/<init>()V ; call super");
        }
   		c.add("   return");
   		c.add(".end method");
    }

    String convert_args_to_string(ArrayList<VarDeclaration> args){
    	ArrayList <String> args_string = new ArrayList<String>();
    	for(int i=0; i<args.size(); i++){
    		String type = args.get(i).getType().toString();
            String this_type = get_type_code_generation_equivalent(type);
    		args_string.add(this_type);
    	}
    	return String.join("", args_string);
    }


    String get_type_code_generation_equivalent(String type){
    	if(type.equals("int")){
    		return "I";
    	} else if(type.equals("bool")){
    		return "I";
    	} else if(type.equals("string")){
    		return "Ljava/lang/String;";
    	} else if(type.equals("int[]")){
    		return "[I";
    	}
        return "L"+type+";";
    }

    public void addLoadingOfThis(String class_name){
        commands.get(class_name).add("   aload 0 ;this");
    }

    public void getClassField(String class_name, String class_name_holding_var, String var_name, String type){
        commands.get(class_name).add("   aload 0 ;this");
        commands.get(class_name).add("   getfield "+class_name_holding_var+"/"+var_name+" "+this.get_type_code_generation_equivalent(type));
    }

    public void putClassField(String class_name, String class_name_holding_var, String var_name, String type){
        commands.get(class_name).add("   putfield "+class_name_holding_var+"/"+var_name+" "+this.get_type_code_generation_equivalent(type));
    }

    public void getStaticPrint(String class_name){
        commands.get(class_name).add("   getstatic java/lang/System/out Ljava/io/PrintStream;");
    }

    public void printAStringValue(String class_name){
    	ArrayList<String> c = this.commands.get(class_name);
    	c.add("   ; invoke println");
    	c.add("   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V");
    }

    public void printAnIntValue(String class_name){
        ArrayList<String> c = this.commands.get(class_name);
        c.add("   invokevirtual java/io/PrintStream/println(I)V");
    }

    public void printAnIntArrayValue(String class_name){
        ArrayList<String> c = this.commands.get(class_name);
        c.add("   invokestatic java/util/Arrays.toString([I)Ljava/lang/String;"); 
        c.add("   invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V");          
    }

    public void createNewArray(String class_name, int length){
        ArrayList<String> c = this.commands.get(class_name);
        c.add("   bipush "+Integer.toString(length));
        c.add("   newarray       int");
    }

    public void createMethodInClassFile(String class_name, String method_name, String return_type, ArrayList<VarDeclaration> args){
    	ArrayList<String> c = this.commands.get(class_name);
    	String args_str = convert_args_to_string(args);
    	if (return_type.equals("int")){
    		c.add(".method public "+method_name+"("+args_str+")I");
    	} else if (return_type.equals("bool")){
    		c.add(".method public "+method_name+"("+args_str+")I");
    	} else if (return_type.equals("string")){
    		c.add(".method public "+method_name+"("+args_str+")Ljava/lang/String;");
    	} else if (return_type.equals("int[]")){
    		c.add(".method public "+method_name+"("+args_str+")[I");
    	} else {
            c.add(".method public "+method_name+"("+args_str+")L"+return_type+";");
        }
    	c.add("   .limit stack 128");
    	c.add("   .limit locals 128");
    }

    public void endMethodInClassFile(String class_name){
    	ArrayList<String> c = this.commands.get(class_name);
    	c.add(".end method");
    }

    void create_a_folder_for_output_files(){
        File newFolder = new File(FOLDER);
        boolean created =  newFolder.mkdir();
    }

    void create_and_write_to_file(String class_name){
        try{
            File file = new File(FOLDER+class_name+".j");
            PrintWriter writer = new PrintWriter(FOLDER+class_name+".j", "UTF-8");
            for(int i=0; i<this.commands.get(class_name).size(); i++){
                writer.println(this.commands.get(class_name).get(i));
            }
            writer.close();
        }
        catch(Exception e){
            System.out.println("Unable to create or write to file");
        }
        
    }

    public void printTheCommands(){
        create_a_folder_for_output_files();
    	for (String name: this.commands.keySet()){
            create_and_write_to_file(name);
        }
    }

  //  public void performUnaryOperationOnANumber(String class_name, int x1, UnaryOperator op){
   ///     commands.get(class_name).add("   ldc "+Integer.toString(x1));
   // }

    public void performUnaryOperation(String class_name, UnaryOperator op){
        if (op == UnaryOperator.not){
            String last_instruction = commands.get(class_name).get(commands.get(class_name).size() - 1);
            if (last_instruction.equals("   iconst_1")) {
                commands.get(class_name).remove(commands.get(class_name).size() - 1);
                commands.get(class_name).add("   iconst_0");
            }
            else if (last_instruction.equals("   iconst_0")) {
                commands.get(class_name).remove(commands.get(class_name).size() - 1);
                commands.get(class_name).add("   iconst_1");
            }
            else{
                commands.get(class_name).add("   if_icmpgt BINARY_NUMBER_JUMP_CONDITION_"+Integer.toString(this.binary_number_jump_condition));
                commands.get(class_name).add("   iconst_1");
                commands.get(class_name).add("BINARY_NUMBER_JUMP_CONDITION_"+Integer.toString(this.binary_number_jump_condition)+":");
                commands.get(class_name).add("   iconst_0");
                this.binary_number_jump_condition += 1; 
            }
        }
        else if (op == UnaryOperator.minus){
            commands.get(class_name).add("   ineg");
        }
    }
	public void performMathOPeration(String class_name, BinaryOperator op){
		if (op == BinaryOperator.add){
			commands.get(class_name).add("   iadd");
		}
		else if (op == BinaryOperator.sub){
			commands.get(class_name).add("   isub");
		}
		else if (op == BinaryOperator.mult){
			commands.get(class_name).add("   imul");
		}
        else if(op == BinaryOperator.div){
            commands.get(class_name).add("   idiv");
        }
        else if(op == BinaryOperator.and){
            commands.get(class_name).add("   iand");
        }
        else if(op == BinaryOperator.or){
            commands.get(class_name).add("   ior");
        }
        /*
        else if(op == BinaryOperator.eq){

        }
        else if (op == BinaryOperator.neq){

        }
        else if (op == BinaryOperator.lt){

        }
        else if (op == BinaryOperator.gt){

        }
        else{

        }
        */
	}

    int getVariableSymbolTableIndex(VarDeclaration var, SymbolTable symTable){
        int symTable_index = 0;
        try {
            SymbolTableItem item = symTable.top.get(var.getIdentifier().getName());
            SymbolTableVariableItemBase varItem = (SymbolTableVariableItemBase) item;
            symTable_index = varItem.getIndex();
        }
        catch(ItemNotFoundException ex){
        }
        return symTable_index;
    }

    int getClassSymbolTableIndex(VarDeclaration var, SymbolTable symTable){
        int symTable_index = 0;
        try {
            SymbolTableItem item = symTable.top.get("class_"+var.getIdentifier().getName());
            SymbolTableVariableItemBase varItem = (SymbolTableVariableItemBase) item;
            symTable_index = varItem.getIndex();
        }
        catch(ItemNotFoundException ex){
        }
        return symTable_index;
    }

    int getVariableSymbolTableIndexBasedOnName(Identifier var_name, SymbolTable symTable){
        int symTable_index = 0;
        try {
            SymbolTableItem item = symTable.top.get(var_name.getName());
            SymbolTableVariableItemBase varItem = (SymbolTableVariableItemBase) item;
            symTable_index = varItem.getIndex();
        }
        catch(ItemNotFoundException ex){
        }
        return symTable_index;
    }


	public void moveArgsToIndex(String class_name, ArrayList<VarDeclaration> args, SymbolTable symTable){
		for(int i=0; i<args.size(); i++){
			int real_index = i+1;
			int symTable_index = getVariableSymbolTableIndex(args.get(i), symTable);
            if(args.get(i).getType().toString().equals("int") || args.get(i).getType().toString().equals("bool")){
            	commands.get(class_name).add("   iload "+Integer.toString(real_index));
            	commands.get(class_name).add("   istore "+Integer.toString(symTable_index));
            }
            else {
                commands.get(class_name).add("   aload "+Integer.toString(real_index));
                commands.get(class_name).add("   astore "+Integer.toString(symTable_index));
            }
		}
	}
	public void moveArgsBackToIndex(String class_name, ArrayList<VarDeclaration> args, SymbolTable symTable){
		for(int i=0; i<args.size(); i++){
			int real_index = i+1;
			int symTable_index = 0;
			try {
                SymbolTableItem item = symTable.top.get(args.get(i).getIdentifier().getName());
                SymbolTableVariableItemBase varItem = (SymbolTableVariableItemBase) item;
                symTable_index = varItem.getIndex();
            }
            catch(ItemNotFoundException ex){
            }
            if(args.get(i).getType().toString().equals("int") || args.get(i).getType().toString().equals("bool")){
            	commands.get(class_name).add("   iload "+Integer.toString(symTable_index));
            	commands.get(class_name).add("   istore "+Integer.toString(real_index));
            }
            else {
                commands.get(class_name).add("   aload "+Integer.toString(symTable_index));
                commands.get(class_name).add("   astore "+Integer.toString(real_index));
            }
		}
	}
    public void moveLocalVarsToIndex(String class_name, ArrayList<VarDeclaration> localVars, SymbolTable symTable,int args_size){
        for(int i=0; i<localVars.size(); i++){
            int real_index = i+1+args_size;
            int symTable_index = getVariableSymbolTableIndex(localVars.get(i), symTable);
            if(localVars.get(i).getType().toString().equals("int") || localVars.get(i).getType().toString().equals("bool")){
                commands.get(class_name).add("   iconst_0");
                commands.get(class_name).add("   istore "+Integer.toString(symTable_index));
            }
            // else if(localVars.get(i).getType().toString().equals("string") || localVars.get(i).getType().toString().equals("int[]")){
            //     commands.get(class_name).add("   iconst_0");
            //     commands.get(class_name).add("   astore "+Integer.toString(symTable_index));
            // }
        }
    }
    public void moveLocalVarsBackToIndex(String class_name, ArrayList<VarDeclaration> localVars, SymbolTable symTable,int args_size){
        for(int i=0; i<localVars.size(); i++){
            int real_index = i+1+args_size;
            int symTable_index = 0;
            try {
                SymbolTableItem item = symTable.top.get(localVars.get(i).getIdentifier().getName());
                SymbolTableVariableItemBase varItem = (SymbolTableVariableItemBase) item;
                symTable_index = varItem.getIndex();
            }
            catch(ItemNotFoundException ex){
            }
            if(localVars.get(i).getType().toString().equals("int") || localVars.get(i).getType().toString().equals("bool")){
                commands.get(class_name).add("   iload "+Integer.toString(symTable_index));
                commands.get(class_name).add("   istore "+Integer.toString(real_index));
            }
            else {
                commands.get(class_name).add("   aload "+Integer.toString(symTable_index));
                commands.get(class_name).add("   astore "+Integer.toString(real_index));
            }
        }
    }
    public void storeToTheVariableAssumingTheValueIsOnTopOfStack(String class_name, Identifier var_name, SymbolTable symTable, String type){
        int symTable_index = getVariableSymbolTableIndexBasedOnName(var_name, symTable);
        if (type.equals("int")) {
            commands.get(class_name).add("   istore "+Integer.toString(symTable_index));
        }
        else if (type.equals("int[]")) {
            commands.get(class_name).add("   astore "+Integer.toString(symTable_index));
        }
        else if(type.equals("string")){
            // can't find it!!!
            commands.get(class_name).add("   astore "+Integer.toString(symTable_index));
        } 
        else if(type.equals("bool")){
            commands.get(class_name).add("   istore "+Integer.toString(symTable_index));
        } 
        else {
            commands.get(class_name).add("   astore "+Integer.toString(symTable_index));
        }
    }
    public void storeToTheArray(String class_name){
        commands.get(class_name).add("   iastore");
    }
    public void loadFromVariableOnTopOfStack(String class_name,Identifier var_name, SymbolTable symTable,String type){
        int symTable_index = getVariableSymbolTableIndexBasedOnName(var_name, symTable);
        if (type.equals("int")){
            commands.get(class_name).add("   iload "+Integer.toString(symTable_index));
        }
        else if(type.equals("int[]")){
            commands.get(class_name).add("   aload "+Integer.toString(symTable_index));
        }
        else if(type.equals("string")){
            commands.get(class_name).add("   aload "+Integer.toString(symTable_index));
        } 
        else if(type.equals("bool")){
            commands.get(class_name).add("   iload "+Integer.toString(symTable_index));
        } 
        else {
            commands.get(class_name).add("   aload "+Integer.toString(symTable_index));
        } 

    }

    public void create_a_label(String class_name, String label_str, int lable_number){
        commands.get(class_name).add(label_str+"_"+Integer.toString(lable_number)+":");
    }

    public void jumpToLabel(String class_name, String label_str, int lable_number){
        commands.get(class_name).add("   goto "+label_str+"_"+Integer.toString(lable_number));
    }

    public void createJumpWithCondition(String class_name, Expression condition, String end_label, int lable_number){
        if (condition.getClass().getName().toString().equals("ast.node.expression.BinaryExpression")) {
            BinaryExpression b = (BinaryExpression) condition;
            BinaryOperator op = b.getBinaryOperator();
            if (op == BinaryOperator.and || op == BinaryOperator.or) {
                commands.get(class_name).add("   ifle "+end_label+"_"+Integer.toString(lable_number));
            }
            else if(op == BinaryOperator.eq){
                commands.get(class_name).add("   if_icmpne "+end_label+"_"+Integer.toString(lable_number));
            }
            else if(op == BinaryOperator.neq){
                commands.get(class_name).add("   if_icmpeq "+end_label+"_"+Integer.toString(lable_number));
            }
            else if(op == BinaryOperator.lt){
                commands.get(class_name).add("   if_icmpge "+end_label+"_"+Integer.toString(lable_number));
            }
            else if(op == BinaryOperator.gt){
                commands.get(class_name).add("   if_icmple "+end_label+"_"+Integer.toString(lable_number));
            }
        }
        else if(condition.getType().toString().equals("bool")){
            commands.get(class_name).add("   ifle "+end_label+"_"+Integer.toString(lable_number));
        }

    }

    public void putConstantIntOnTopOfStack(String class_name, int value){
        commands.get(class_name).add("   ldc "+Integer.toString(value));
    }

    public void putConstantStringOnTopOfStack(String class_name, String value){
        commands.get(class_name).add("   ldc "+value);
    }

    public void putConstantBoolOnTopOfStack(String class_name, Boolean value){
        if (value) {
            commands.get(class_name).add("   iconst_1");
        } 
        else {
            commands.get(class_name).add("   iconst_0");
        }
    }

    public void createAnObjectOnTopOfStack(String class_name, String new_class_name, String type){
        String type_of_this;
        type_of_this = get_type_code_generation_equivalent(type);
        commands.get(class_name).add("   ; create an "+new_class_name+" object on top of stack");
        commands.get(class_name).add("   new "+new_class_name);
        commands.get(class_name).add("   dup");
        commands.get(class_name).add("   invokespecial "+new_class_name+"/<init>()V ; call constructor");
    }
  
    public void performArrayLength(String class_name, SymbolTable symTable){
        commands.get(class_name).add("   arraylength");
    }
    public void performArrayCall(String class_name){
        commands.get(class_name).add("   iaload");
    }

    public Boolean putArrayReferenceOnTopOfStack(String class_name, Expression arrayExpression, SymbolTable symTable){
        if (arrayExpression.getClass().getName().equals("ast.node.expression.Identifier")){
            int symTable_index = getVariableSymbolTableIndexBasedOnName((Identifier) arrayExpression, symTable);
            commands.get(class_name).add("   aload "+Integer.toString(symTable_index));
            return true;
        }
        return false;
    }

    public void performVarDeclaration(String class_name,String var_name,String type){
        String type_of_this;
        type_of_this = get_type_code_generation_equivalent(type);
        commands.get(class_name).add(".field private "+ var_name + " " + type_of_this);
    }
    
    public void performThis(String class_name,String var_name,String type){
        String type_of_this;
        type_of_this = get_type_code_generation_equivalent(type);
        commands.get(class_name).add("getfield "+ class_name + "/"+ var_name + " " + type_of_this);
    }

    public void loadThisIntoStack(String class_name){
        commands.get(class_name).add("   aload_0");
    }

    public void performReturn(String class_name,String type){
        if (type.equals("int")){
            commands.get(class_name).add("   ireturn");
        }
        else if(type.equals("int[]")){
            commands.get(class_name).add("   areturn");
        }
        else if(type.equals("string")){
            commands.get(class_name).add("   areturn");
        } 
        else if(type.equals("bool")){
            commands.get(class_name).add("   ireturn"); 
        } 
        else {
            //can't find it!!!
            commands.get(class_name).add("   areturn");             
        }                  
    }


    public void performMethodCall(String class_name,String instance_class,String method_name,ArrayList<String> args,String return_type){
        String cmd = "   invokevirtual " + instance_class + "/" + method_name + "(";
        for (int i = 0; i < args.size(); i++){
            String type_of_this = get_type_code_generation_equivalent(args.get(i));
            cmd = cmd + type_of_this;
        }
        cmd = cmd + ")";
        String type_of_this;
        type_of_this = get_type_code_generation_equivalent(return_type);       
        cmd = cmd + type_of_this;
        commands.get(class_name).add(cmd);
    }

    public void addDUP(String class_name){
        commands.get(class_name).add("   dup");
    }

	@Override
    public String toString() {
        return "CodeGeneration";
    }


}