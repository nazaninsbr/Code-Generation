package ast;

import ast.node.declaration.VarDeclaration;
import java.util.ArrayList;
import java.util.*;
import ast.node.expression.BinaryOperator;

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
    	return "";
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

	public void operationBetweenTwoConstantNumbers(String class_name, int x1, int x2, char op){
		commands.get(class_name).add("iconst_"+Integer.toString(x1));	
		commands.get(class_name).add("iconst_"+Integer.toString(x2));	
		performMathOPeration(class_name, op);
	}


	public void performMathOPeration(String class_name, BinaryOperator op){
		if (op == BinaryOperator.add){
			commands.get(class_name).add("iadd");
		}
		else if (op == BinaryOperator.sub){
			commands.get(class_name).add("isub");
		}
		else if (op == BinaryOperator.mult){
			commands.get(class_name).add("imul");
		}
        else if(op == BinaryOperator.div){
            commands.get(class_name).add("idiv");
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

	public void operationBetweenTwoVariables(String class_name, int indVar1, int indVar2, int var1, int var2, char op){
		commands.get(class_name).add("iload_"+Integer.toString(indVar1));
		commands.get(class_name).add("iload_"+Integer.toString(indVar2));	
		performMathOPeration(class_name, op);
	}
    public void operationBetweenVariableAndConstantNumber(String class_name, int indVar1, int x2, int var1, int var2, char op){ 
        commands.get(class_name).add("iload_"+Integer.toString(indVar1));
        commands.get(class_name).add("iconst_"+Integer.toString(x2)); 
        performMathOPeration(class_name, op);
    }
    public void operationBetweenConstantNumberAndVariable(String class_name, int x1, int indVar2, int var1, int var2, char op){ 
        commands.get(class_name).add("iconst_"+Integer.toString(x1));
        commands.get(class_name).add("iload_"+Integer.toString(indVar2));
        performMathOPeration(class_name, op);
    }  
	@Override
    public String toString() {
        return "CodeGeneration";
    }


}