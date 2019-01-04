package ast;

import java.util.ArrayList;
import java.util.*;
import java.io.*;

import symbolTable.*;
import ast.node.declaration.VarDeclaration;
import ast.node.expression.BinaryOperator;
import ast.node.expression.UnaryOperator;
import ast.node.expression.*;

public class Translator {

    private static final String FOLDER ="./J_FILES/";
	private HashMap<String, ArrayList<String>> commands;

	public Translator() {
        this.commands = new HashMap<String, ArrayList<String>>();
    }

    public void createFileForClass(String class_name, String parent_name){
    	this.commands.put(class_name, new ArrayList<String>());
    	ArrayList<String> c = this.commands.get(class_name);
    	c.add(".class public "+class_name);
    	if(parent_name.equals("null") || parent_name.equals("Object")){
    		c.add(".super Object");
    	}
    	else {
    		c.add(".super "+parent_name);
    	}
    	c.add("; default constructor");
    	c.add(".method public <init>()V");
    	c.add("   aload_0 ; push this");
    	c.add("   invokespecial java/lang/Object/<init>()V ; call super");
   		c.add("   return");
   		c.add(".end method");
    }

    String convert_args_to_string(ArrayList<VarDeclaration> args){
    	ArrayList <String> args_string = new ArrayList<String>();
    	for(int i=0; i<args.size(); i++){
    		String type = args.get(i).getType().toString();
    		args_string.add(get_type_code_generation_equivalent(type));
    	}
    	return String.join(";", args_string);
    }


    String get_type_code_generation_equivalent(String type){
    	if(type.equals("int")){
    		return "I";
    	} else if(type.equals("bool")){
    		return "Z";
    	} else if(type.equals("string")){
    		return "Ljava/lang/String";
    	} else if(type.equals("int[]")){
    		return "[I";
    	}
    	return "";
    }

    public void printAStringValue(String class_name){
    	ArrayList<String> c = this.commands.get(class_name);
    	c.add("   ; invoke println");
    	c.add("   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V");
    }

    public void printAnIntValue(String class_name){
        ArrayList<String> c = this.commands.get(class_name);
        c.add("   getstatic java/lang/System/out Ljava/io/PrintStream;");
        c.add("   invokevirtual java/io/PrintStream/println(I)V");
    }

    public void printAVariable(String class_name, VarDeclaration var, SymbolTable symTable){
        ArrayList<String> c = this.commands.get(class_name);
        c.add("   getstatic     #2");
        if (var.getType().toString().equals("int[]")) {
            c.add("   aload "+Integer.toString(getVariableSymbolTableIndex(var, symTable)));
        }
        c.add("   invokevirtual #3");
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
    		c.add(".method public "+method_name+"("+args_str+")Z");
    	} else if (return_type.equals("string")){
    		c.add(".method public "+method_name+"("+args_str+")Ljava/lang/String");
    	} else if (return_type.equals("int[]")){
    		c.add(".method public "+method_name+"("+args_str+")[I;");
    	}
    	c.add("   .limit stack 32");
    	c.add("   .limit locals 32");
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
            //commands.get(class_name).add("   ");
        }
        else if (op == UnaryOperator.minus){
            commands.get(class_name).add("   ineg");
        }
        else {

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
            if(args.get(i).getType().toString().equals("int")){
            	commands.get(class_name).add("   iload "+Integer.toString(real_index));
            	commands.get(class_name).add("   istore "+Integer.toString(symTable_index));
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
            if(args.get(i).getType().toString().equals("int")){
            	commands.get(class_name).add("   iload "+Integer.toString(symTable_index));
            	commands.get(class_name).add("   istore "+Integer.toString(real_index));
            }

		}
	}
    public void moveLocalVarsToIndex(String class_name, ArrayList<VarDeclaration> localVars, SymbolTable symTable,int args_size){
        for(int i=0; i<localVars.size(); i++){
            int real_index = i+1+args_size;
            int symTable_index = getVariableSymbolTableIndex(localVars.get(i), symTable);
            if(localVars.get(i).getType().toString().equals("int")){
                commands.get(class_name).add("   iload "+Integer.toString(real_index));
                commands.get(class_name).add("   istore "+Integer.toString(symTable_index));
            }
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
            if(localVars.get(i).getType().toString().equals("int")){
                commands.get(class_name).add("   iload "+Integer.toString(symTable_index));
                commands.get(class_name).add("   istore "+Integer.toString(real_index));
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
    }
    public void loadFromVariableOnTopOfStack(String class_name,Identifier var_name, SymbolTable symTable,String type){
        int symTable_index = getVariableSymbolTableIndexBasedOnName(var_name, symTable);
        if (type.equals("int")){
            commands.get(class_name).add("   iload "+Integer.toString(symTable_index));
        }
        else if(type.equals("int[]")){
            commands.get(class_name).add("   aload "+Integer.toString(symTable_index));
        }
    }

    public void create_a_label(String class_name, String label_str, int lable_number){
        commands.get(class_name).add(label_str+"_"+Integer.toString(lable_number)+":");
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
            commands.get(class_name).add("   invokestatic  #2");
        } 
        else {
            commands.get(class_name).add("   iconst_0");
            commands.get(class_name).add("   invokestatic  #2");
        }
    }
  
    public void performArrayLength(String class_name, SymbolTable symTable){
        //int symTable_index = getVariableSymbolTableIndexBasedOnName(var_name, symTable);
        //commands.get(class_name).add("   aload "+Integer.toString(symTable_index));
        commands.get(class_name).add("   arraylength");
    }
    public void performArrayCall(String class_name){
        commands.get(class_name).add("   aaload");
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
	@Override
    public String toString() {
        return "CodeGeneration";
    }


}