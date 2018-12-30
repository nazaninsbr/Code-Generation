package ast;
import java.util.ArrayList;

public class Translator {

	private HashMap<String, Arraylist<String>> commands;

	public Translator() {
        this.commands = new HashMap<String, Arraylist<String>>();
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
    	System.out.println(c.get(0));
    }

	public void operationBetweenTwoConstantNumbers(int x1, int x2, char op){
		commands.add("iconst_"+Integer.toString(x1));	
		commands.add("iconst_"+Integer.toString(x2));	
		if op.equals("+"){
			commands.add("iadd");
		}
		else if op.equals("-"){
			commands.add("isub");
		}
		else if op.equals("*"){
			commands.add("imul");
		}
		return commands;
	}


	public void operationBetweenTwoVariables(int indVar1, int indVar2, int var1, int var2, char op){
		commands.add("iload_"+Integer.toString(indVar1));
		commands.add("iload_"+Integer.toString(indVar2));	
		if op.equals("+"){
			commands.add("iadd");
		}
		else if op.equals("-"){
			commands.add("isub");
		}
		else if op.equals("*"){
			commands.add("imul");
		}
		return commands;
	}

}