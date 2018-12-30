package ast;

import ast.node.declaration.VarDeclaration;
import java.util.ArrayList;
import java.util.*;
import symbolTable.*;
import ast.node.expression.BinaryOperator;
import ast.node.expression.UnaryOperator;
public class Translator {

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
    	} else if(type.equals("int")){
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

    public void printAStringValue(String class_name, String value_to_print){
    	ArrayList<String> c = this.commands.get(class_name);
    	c.add("   ldc "+value_to_print);
    	c.add("   ; invoke println");
    	c.add("   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V");
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

    public void printTheCommands(String class_name){
    	for(int i=0; i<this.commands.get(class_name).size(); i++){
   			System.out.println(this.commands.get(class_name).get(i));
   		}
    }

	public void operationBetweenTwoConstantNumbers(String class_name, int x1, int x2, BinaryOperator op){
		commands.get(class_name).add("   iconst_"+Integer.toString(x1));	
		commands.get(class_name).add("   iconst_"+Integer.toString(x2));	
		performMathOPeration(class_name, op);
	}
    public void operationBetweenTwoVariables(String class_name, int indVar1, int indVar2, BinaryOperator op){
        commands.get(class_name).add("   iload_"+Integer.toString(indVar1));
        commands.get(class_name).add("   iload_"+Integer.toString(indVar2));    
        performMathOPeration(class_name, op);
    }

    public void operationBetweenVariableAndConstantNumber(String class_name, int indVar1, int x2, BinaryOperator op){ 
        commands.get(class_name).add("   iload_"+Integer.toString(indVar1));
        commands.get(class_name).add("   iconst_"+Integer.toString(x2)); 
        performMathOPeration(class_name, op);
    }
    
    public void operationBetweenConstantNumberAndVariable(String class_name, int x1, int  indVar2, BinaryOperator op){ 
        commands.get(class_name).add("   iconst_"+Integer.toString(x1));
        commands.get(class_name).add("   iload_"+Integer.toString(indVar2));
        performMathOPeration(class_name, op);
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



	public void moveArgsToIndex(String class_name, ArrayList<VarDeclaration> args, SymbolTable symTable){
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
            	commands.get(class_name).add("   iload_"+Integer.toString(real_index));
            	commands.get(class_name).add("   istore_"+Integer.toString(symTable_index));
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
            	commands.get(class_name).add("   iload_"+Integer.toString(symTable_index));
            	commands.get(class_name).add("   istore_"+Integer.toString(real_index));
            }

		}
	}

  

	@Override
    public String toString() {
        return "CodeGeneration";
    }


}