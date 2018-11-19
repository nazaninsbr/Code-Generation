grammar Smoola;

@header{
    import java.util.List;
    import ast.node.Program;
    import ast.node.Node;
    import ast.node.declaration.*;
    import ast.node.expression.*;
    import ast.node.expression.Value.*;
    import ast.node.statement.*;
    import ast.Type.Type;
    import java.util.ArrayList;
    import ast.Type.PrimitiveType.*;
    import ast.Type.UserDefinedType.UserDefinedType;
    import ast.Type.ArrayType.ArrayType;
    import ast.node.expression.BinaryExpression;
    import ast.node.expression.BinaryOperator;
    import ast.node.expression.UnaryOperator;
}


@members {
    void print_program_content(Program prog){
    List<ClassDeclaration> classes = prog.getClasses(); 
    for(int i=0; i<classes.size(); i++){
        System.out.println(classes.get(i).getName().getName()); 
        System.out.println(classes.get(i).getParentName().getName());
        ArrayList<VarDeclaration> vars = classes.get(i).getVarDeclarations();
        for(int j=0; j<vars.size(); j++){
            System.out.println(vars.get(j).getIdentifier().getName());
            System.out.println(vars.get(j).getType().toString());
        }
        ArrayList<MethodDeclaration> methods = classes.get(i).getMethodDeclarations();
        for(int j=0; j<methods.size(); j++){
            System.out.println(methods.get(j).getName().getName());
            ArrayList<Statement> statements = methods.get(j).getBody();
            for(int k=0; k<statements.size(); k++){
                System.out.println(statements.get(k).toString());
            }
        }
    }
}
    Program create_program_object(){
        return new Program();
    }
    
    ClassDeclaration create_class_object(String class_name, String parent_name){
        Identifier class_id = create_identifier_object(class_name); 
        Identifier parent_class_id = create_identifier_object(parent_name); 
        ClassDeclaration this_class_dec = new ClassDeclaration(class_id, parent_class_id);
        return this_class_dec;
    }

    MethodDeclaration create_methodDeclaration_object(String method_name){
        Identifier method_id = create_identifier_object(method_name);
        return new MethodDeclaration(method_id);
    }

    VarDeclaration create_varDeclaration_object(String var_name, Type var_type){
        Identifier this_var_id = create_identifier_object(var_name);
        return new VarDeclaration(this_var_id, var_type);
    }

    MethodDeclaration create_main_method_object(String method_name){
        Identifier method_id = create_identifier_object(method_name);
        return new MethodDeclaration(method_id);
    }

    MethodDeclaration add_arg_to_MethodDeclaration(String arg_name, Type arg_type, MethodDeclaration this_method){
        Identifier arg_name_id = create_identifier_object(arg_name);
        VarDeclaration this_arg_dec = new VarDeclaration(arg_name_id, arg_type);
        this_method.addArg(this_arg_dec);
        return this_method;
    }

    Block create_block_statement_object(ArrayList<Statement> all_statements){
        Block this_statement = new Block();
        for(int i=0; i<all_statements.size(); i++){
            this_statement.addStatement(all_statements.get(i)); 
        }
        return this_statement;
    }

    NewClass create_class_instantiation_object(String class_name){
        Identifier class_id = create_identifier_object(class_name); 
        NewClass this_class = new NewClass(class_id); 
        return this_class;
    }

    ArrayCall create_array_call_instance(String name, Expression index){
        Identifier array_name_id = create_identifier_object(name); 
        ArrayCall this_array = new ArrayCall(array_name_id, index);
        return this_array; 
    }

    BooleanValue create_boolean_value_object(boolean constant){
        BooleanType this_type = new BooleanType();
        BooleanValue this_value = new BooleanValue(constant, this_type);
        return this_value;
    }

    IntValue create_int_value_object(int constant){
        IntType this_type = new IntType();
        IntValue this_value = new IntValue(constant, this_type);
        return this_value;
    }

    StringValue create_string_value_object(String constant){
        StringType this_type = new StringType();
        StringValue this_value  = new StringValue(constant, this_type);
        return this_value;
    }

    Identifier create_identifier_object(String name){
        return new Identifier(name);
    }

}


    program:
       {Program prog = create_program_object();} mainClass[prog] (classDeclaration[prog])* EOF
    ;
    mainClass[Program prog]:
        // name should be checked later
        'class' class_name = ID {ClassDeclaration main_class_dec = create_class_object($class_name.text, "null"); $prog.setMainClass(main_class_dec);} '{' 'def' method_name = ID {main_class_dec.addMethodDeclaration(create_main_method_object($method_name.text));} '()' ':' 'int' '{'  statements 'return' expression ';' '}' '}'
    ;
    classDeclaration[Program prog]:
        'class' class_name = ID ('extends' parent_class = ID )? { ClassDeclaration new_class_dec = create_class_object($class_name.text, $parent_class.text); $prog.addClass(new_class_dec);} '{' (var_dec = varDeclaration { new_class_dec.addVarDeclaration($var_dec.this_var);})* (method_dec = methodDeclaration {new_class_dec.addMethodDeclaration($method_dec.this_method);})* '}'
    ;
    varDeclaration returns [VarDeclaration this_var]:
        'var' var_name = ID ':' this_type = type ';' {VarDeclaration this_variable_dec = create_varDeclaration_object($var_name.text, $this_type.this_type);}
    ;
    methodDeclaration returns [MethodDeclaration this_method]:
        'def' method_name = ID { MethodDeclaration this_method = create_methodDeclaration_object($method_name.text);} ('()' | ('(' arg_name = ID ':' arg_type = type { this_method = add_arg_to_MethodDeclaration($arg_name.text, $arg_type.this_type, this_method);} (',' arg_name_2 = ID ':' arg_type_2 = type { this_method = add_arg_to_MethodDeclaration($arg_name_2.text, $arg_type_2.this_type, this_method);})* ')')) ':' type '{'  (this_var = varDeclaration {this_method.addLocalVar($this_var.this_var);})* statements 'return' expression ';' '}'
    ;
    statements returns [ArrayList<Statement> all_statements]:
        {ArrayList<Statement> all_statements = new ArrayList<>();} (this_statement = statement {all_statements.add($this_statement.this_statement);})*
    ;
    statement returns [Statement this_statement]:
        block_body = statementBlock {Block this_statement = create_block_statement_object($block_body.block_statements);} |
        statementCondition |
        statementLoop |
        statementWrite |
        statementAssignment 
    ;
    statementBlock returns [ArrayList<Statement> block_statements]:
        '{'  block_body = statements {ArrayList<Statement> block_statements = $block_body.all_statements;} '}'
    ;
    statementCondition returns [Expression conditional_expression, Statement consequence_body, Statement alternative_body]:
        'if' '(' cond_expre = expression {Expression conditional_expression = $cond_expre.this_expression;} ')' 'then' cons_body = statement {Statement consequence_body = $cons_body.this_statement;} ('else' alt_body = statement {Statement alternative_body = $alt_body.this_statement;})?
    ;
    statementLoop:
        'while' '(' expression ')' statement
    ;
    statementWrite:
        'writeln(' expression ')' ';'
    ;
    statementAssignment:
        expression ';'
    ;

    expression returns [Expression this_expression,Expression this_lvalue,Expression this_rvalue]:
        exp = expressionAssignment{
            if ($exp.this_expression_lvalue == null){
                $this_expression = $exp.this_expression_rvalue;
            }
            else{
                $this_lvalue = $exp.this_expression_lvalue;
                $this_rvalue = $exp.this_expression_rvalue;
                BinaryOperator binary_op = BinaryOperator.assign;
                $this_expression = new BinaryExpression ($exp.this_expression_lvalue,$exp.this_expression_rvalue,binary_op);
            ///???
            }
        }
	;

    expressionAssignment returns [Expression this_expression_lvalue,Expression this_expression_rvalue]:
        exp_lvalue = expressionOr '=' exp_rvalue = expressionAssignment{
            if($exp_rvalue.this_expression_lvalue == null){
                $this_expression_rvalue = $exp_rvalue.this_expression_rvalue;
            }
            else{
                BinaryOperator binary_op = BinaryOperator.assign;
                $this_expression_rvalue = new BinaryExpression($exp_rvalue.this_expression_lvalue,$exp_rvalue.this_expression_rvalue,binary_op);
            }
            $this_expression_lvalue = $exp_lvalue.this_expression;
        }
        |   exp = expressionOr {$this_expression_rvalue = $exp.this_expression;}

	;

    expressionOr returns [Expression this_expression]:
		left = expressionAnd half_exp = expressionOrTemp {
            if ($half_exp.this_half_expression != null){
                $this_expression = new BinaryExpression ($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
            }
            else{
                $this_expression = $left.this_expression;
            }
            
        }
	;

    expressionOrTemp returns [BinaryOperator this_binaryOperator,Expression this_half_expression]:
		op = '||'{$this_binaryOperator = BinaryOperator.or;} left = expressionAnd half_exp = expressionOrTemp{
            $this_half_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
        }
	    |
	;

    expressionAnd returns [Expression this_expression]:
		left = expressionEq half_exp = expressionAndTemp{
            if ($half_exp.this_half_expression != null){
                $this_expression = new BinaryExpression ($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
            }
            else{
                $this_expression = $left.this_expression;
            }
        }      
	;

    expressionAndTemp returns [BinaryOperator this_binaryOperator,Expression this_half_expression]:
		op = '&&'{$this_binaryOperator = BinaryOperator.and;} left = expressionEq half_exp = expressionAndTemp{
            $this_half_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
        }
	    |
	;

    expressionEq returns [Expression this_expression]:
		left = expressionCmp half_exp = expressionEqTemp{
            if ($half_exp.this_half_expression != null){
                $this_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
            }
            else{
                $this_expression = $left.this_expression;
            }
        }
	;

    expressionEqTemp returns [BinaryOperator this_binaryOperator,Expression this_half_expression]:
		(op = '=='{$this_binaryOperator = BinaryOperator.eq;}| op = '<>' {
            $this_binaryOperator = BinaryOperator.neq;}) left = expressionCmp half_exp = expressionEqTemp{
            $this_half_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
        }
	    |
	;

    expressionCmp returns [Expression this_expression]:
		left = expressionAdd half_exp = expressionCmpTemp{
            if ($half_exp.this_half_expression != null){
            $this_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
            }
            else{
                $this_expression = $left.this_expression;
            }
        }
	;

    expressionCmpTemp returns [BinaryOperator this_binaryOperator,Expression this_half_expression]:
		(op = '<'{$this_binaryOperator = BinaryOperator.lt;}| op = '>'{$this_binaryOperator = BinaryOperator.gt;}) left= expressionAdd half_exp = expressionCmpTemp{
             $this_half_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
        }
	    |
	;

    expressionAdd returns[Expression this_expression]:
		left = expressionMult half_exp = expressionAddTemp{
            if ($half_exp.this_half_expression != null){
                $this_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
            }
            else{
                $this_expression = $left.this_expression;
            }
        }
	;

    expressionAddTemp returns[BinaryOperator this_binaryOperator,Expression this_half_expression]:
		(op = '+'{$this_binaryOperator = BinaryOperator.add;}| op = '-'{$this_binaryOperator = BinaryOperator.sub;}) left = expressionMult half_exp = expressionAddTemp{
            $this_half_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
        }
	    |
	;

        expressionMult returns[Expression this_expression]:
		left = expressionUnary half_exp = expressionMultTemp{
            if ($half_exp.this_half_expression != null){
            $this_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
            }
            else{
                $this_expression = $left.this_expression;
            }
        }
	;

    expressionMultTemp returns[BinaryOperator this_binaryOperator,Expression this_half_expression]:
		(op = '*'{$this_binaryOperator = BinaryOperator.mult;}| op = '/'{$this_binaryOperator = BinaryOperator.div;}) left = expressionUnary half_exp = expressionMultTemp{
            $this_half_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
        }
	    |
	;

    expressionUnary returns[Expression this_expression]:
		{UnaryOperator unary_op;}(op = '!'{unary_op = UnaryOperator.not;}| op = '-'{unary_op = UnaryOperator.minus;}) unary_exp = expressionUnary{
            $this_expression = new UnaryExpression(unary_op,$unary_exp.this_expression);
        }
	    |	exp = expressionMem {$this_expression = $exp.this_expression;}
	;

    expressionMem returns[Expression this_expression]:
		instance_exp = expressionMethods index_exp = expressionMemTemp {
            if ($index_exp.this_expression != null){
                $this_expression = new ArrayCall($instance_exp.this_expression,$index_exp.this_expression);
            }
            else{
                $this_expression = $instance_exp.this_expression;
            }

        }
	;

    expressionMemTemp returns [Expression this_expression]:
		'[' exp = expression ']' {$this_expression = $exp.this_expression;}
	    |
	;
	expressionMethods returns [Expression this_expression]:
	    instance = expressionOther {Expression inst = $instance.this_expression;} expressionMethodsTemp[inst] {
        }
	;


    expressionMethodsTemp [Expression instance]:
    '.' (method_name1 = ID '()'{
        MethodCall this_half_instance; Identifier m_name1 = create_identifier_object($method_name1.text); this_half_instance = new MethodCall($instance,m_name1);
    }expressionMethodsTemp[(Expression) this_half_instance]|  method_name2 = ID '('{
        MethodCall this_half_instance; Identifier m_name2 = create_identifier_object($method_name2.text); this_half_instance = new MethodCall($instance,m_name2);
        } (arg1 = expression {this_half_instance.addArg($arg1.this_expression);}(',' arg2 = expression {this_half_instance.addArg($arg2.this_expression);})*) ')'expressionMethodsTemp[(Expression) this_half_instance] | 'length'{
           Length this_half_instance; this_half_instance = new Length($instance);
        }expressionMethodsTemp[(Expression) this_half_instance])
    |
;

    expressionOther returns [Expression this_expression]:
		number = CONST_NUM {IntValue this_expression = create_int_value_object(Integer.parseInt($number.text));}
        |	str = CONST_STR {StringValue this_expression = create_string_value_object($str.text);}
        |   'new ' 'int' '[' size_expression = expression ']' {NewArray this_expression = new NewArray(); this_expression.setExpression($size_expression.this_expression);}
        |   'new ' class_name = ID '()' {NewClass this_expression = create_class_instantiation_object($class_name.text);}
        |   'this' {This this_expression = new This();}
        |   'true' {BooleanValue this_expression = create_boolean_value_object(true);}
        |   'false' {BooleanValue this_expression = create_boolean_value_object(false);}
        |	name = ID {Identifier this_expression = create_identifier_object($name.text);}
        |   name = ID '[' index = expression ']' {ArrayCall this_expression = create_array_call_instance($name.text, $index.this_expression);}
        |	'(' exp = expression ')' {$this_expression = $exp.this_expression;//???
        }
	;
	type returns [Type this_type]:
	    'int' {IntType this_type = new IntType();} |
	    'boolean' {BooleanType this_type = new BooleanType();} |
	    'string' {StringType this_type = new StringType();} |
	    'int[]' {ArrayType this_type = new ArrayType();} |
	    name = ID {Identifier this_id = new Identifier($name.text); UserDefinedType this_type = new UserDefinedType(); this_type.setName(this_id);}
	;



    CONST_NUM:
		[0-9]+
	;

    CONST_STR:
		'"' ~('\r' | '\n' | '"')* '"'
	;
    NL:
		'\r'? '\n' -> skip
	;

    ID:
	   [a-zA-Z_][a-zA-Z0-9_]*
	;

    COMMENT:
		'#'(~[\r\n])* -> skip
	;

    WS:
    	[ \t] -> skip
    ;