grammar Smoola;

@header{
    import java.util.List;
    import ast.node.Program;
    import ast.VisitorImpl;
    import ast.Visitor;
    import ast.node.Node;
    import ast.node.declaration.*;
    import ast.node.expression.*;
    import ast.node.expression.Value.*;
    import ast.node.statement.*;
    import ast.Type.Type;
    import ast.Type.PrimitiveType.*;
    import ast.Type.UserDefinedType.UserDefinedType;
    import ast.Type.ArrayType.ArrayType;
    import ast.node.expression.BinaryExpression;
    import ast.node.expression.BinaryOperator;
    import ast.node.expression.UnaryOperator;
    import ast.node.statement.Write;
    import java.util.ArrayList;
    import java.util.List;
}


@members {
    Program create_program_object(){
        return new Program();
    }
    ClassDeclaration create_class_object(String class_name, String parent_name){
        Identifier class_id = create_identifier_object(class_name); 
        if(parent_name==null){
            parent_name = "null";
        }
        Identifier parent_class_id = create_identifier_object(parent_name); 
        ClassDeclaration this_class_dec = new ClassDeclaration(class_id, parent_class_id);
        return this_class_dec;
    }

    MethodDeclaration create_methodDeclaration_object(String method_name){
        Identifier method_id = create_identifier_object(method_name);
        return new MethodDeclaration(method_id);
    }

    VarDeclaration create_varDeclaration_object(String var_name, Type var_type, int line_number){
        Identifier this_var_id = create_identifier_object(var_name);
        VarDeclaration this_var = new VarDeclaration(this_var_id, var_type);
        this_var.set_line_number(line_number);
        return this_var;
    }

    MethodDeclaration create_main_method_object(String method_name){
        Identifier method_id = create_identifier_object(method_name);
        return new MethodDeclaration(method_id);
    }

    MethodDeclaration add_arg_to_MethodDeclaration(String arg_name, int line_number, Type arg_type, MethodDeclaration this_method){
        Identifier arg_name_id = create_identifier_object(arg_name);
        VarDeclaration this_arg_dec = new VarDeclaration(arg_name_id, arg_type);
        this_arg_dec.set_line_number(line_number);
        this_method.addArg(this_arg_dec);
        return this_method;
    }

    MethodDeclaration add_body_statements_to_method(MethodDeclaration this_method, ArrayList<Statement> all_statements){
        for(int i=0; i<all_statements.size(); i++){
            this_method.addStatement(all_statements.get(i)); 
        }
        return this_method;
    }

    Block create_block_statement_object(ArrayList<Statement> all_statements){
        Block this_statement = new Block();
        for(int i=0; i<all_statements.size(); i++){
            this_statement.addStatement(all_statements.get(i)); 
        }
        return this_statement;
    }

    Conditional create_conditional_statement_object(Expression conditional_expression, Statement consequence_body, Statement alternative_body){
        Conditional this_statement = new Conditional(conditional_expression, consequence_body);
        if (alternative_body!=null){
            this_statement.setAlternativeBody(alternative_body);
        }
        return this_statement; 
    }

    While create_loop_statement_object(Expression conditional_expression, Statement body){
        While this_statement = new While(conditional_expression, body);
        return this_statement;
    }

    NewClass create_class_instantiation_object(String class_name){
        Identifier class_id = create_identifier_object(class_name); 
        NewClass this_class = new NewClass(class_id); 
        return this_class;
    }

    ArrayCall create_array_call_instance(String name, Expression index, int line_number){
        Identifier array_name_id = create_identifier_object(name); 
        array_name_id.set_line_number(line_number);
        index.set_line_number(line_number);
        ArrayCall this_array = new ArrayCall(array_name_id, index);
        this_array.set_line_number(line_number);
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

    MethodCall create_method_call_object(String method_name, Expression instance){
        Identifier m_name1 = create_identifier_object(method_name); 
        return new MethodCall(instance , m_name1);
    }

    Type create_user_defined_type(String name){
        Identifier this_id = create_identifier_object(name); 
        UserDefinedType this_udef_type = new UserDefinedType(); 
        this_udef_type.setName(this_id); 
        return this_udef_type;
    }

    ClassDeclaration get_user_defined_type_class_def(String name, Program prog){
        String main_class_name = prog.getMainClass().getName().getName();
        if (main_class_name.equals(name)){
            return prog.getMainClass();
        }
        else{
            List<ClassDeclaration> classes = prog.getClasses();
            for(int i=0; i<classes.size(); i++){
                String class_name = classes.get(i).getName().getName(); 
                if (class_name.equals(name)){
                    return classes.get(i);
                }
            }
        }
        return create_class_object("Object", "null");
    }

    void complete_incomple_var_declarations(Program prog){
        List<ClassDeclaration> classes = prog.getClasses(); 
        for(int i=0; i<classes.size(); i++){
            ArrayList<VarDeclaration> vars = classes.get(i).getVarDeclarations();
            for(int j=0; j<vars.size(); j++){
                if (vars.get(j).getType().getClass().getName().equals("ast.Type.UserDefinedType.UserDefinedType")){
                    UserDefinedType x = (UserDefinedType) vars.get(j).getType(); 
                    x.setClassDeclaration(get_user_defined_type_class_def(x.getName().getName(), prog));
                } 
            }
            ArrayList<MethodDeclaration> methods = classes.get(i).getMethodDeclarations();
            for(int j=0; j<methods.size(); j++){
                ArrayList<VarDeclaration> localVars = methods.get(j).getLocalVars();
                for(int l=0; l<localVars.size(); l++){
                    if (localVars.get(l).getType().getClass().getName().equals("ast.Type.UserDefinedType.UserDefinedType")){
                        UserDefinedType x = (UserDefinedType) localVars.get(l).getType(); 
                        x.setClassDeclaration(get_user_defined_type_class_def( x.getName().getName(), prog));
                    }
                }
                ArrayList<VarDeclaration> args = methods.get(j).getArgs();
                for(int l=0; l<args.size(); l++){
                    if (args.get(l).getType().getClass().getName().equals("ast.Type.UserDefinedType.UserDefinedType")){
                        UserDefinedType x = (UserDefinedType) args.get(l).getType(); 
                        x.setClassDeclaration(get_user_defined_type_class_def( x.getName().getName(), prog));
                    }
                }
                if (methods.get(j).getReturnType().getClass().getName().equals("ast.Type.UserDefinedType.UserDefinedType")){
                    UserDefinedType x = (UserDefinedType) methods.get(j).getReturnType(); 
                    x.setClassDeclaration(get_user_defined_type_class_def( x.getName().getName(), prog));
                }
            }
        }
    }

    Identifier create_identifier_object(String name){
        return new Identifier(name);
    }

}

    program:
       {Program prog = create_program_object();} mainClass[prog] (classDeclaration[prog])* {complete_incomple_var_declarations(prog);} EOF {Visitor prog_visitor = new VisitorImpl(); prog.accept(prog_visitor);} 
    ;
    mainClass[Program prog]:
        // name should be checked later
        'class' class_name = ID {ClassDeclaration main_class_dec = create_class_object($class_name.text, "null"); ((Node)((Declaration)main_class_dec)).set_line_number($class_name.getLine()); $prog.setMainClass(main_class_dec);} '{' 'def' method_name = ID {MethodDeclaration main_method = create_main_method_object($method_name.text); main_method.set_line_number($method_name.getLine()); main_class_dec.addMethodDeclaration(main_method); main_method.setReturnType(new IntType());} '()' ':' 'int' '{'  method_body = statements {main_method = add_body_statements_to_method(main_method, $method_body.all_statements);} l_num = 'return' ret_expr = expression {$ret_expr.this_expression.set_line_number($l_num.getLine()); main_method.setReturnValue($ret_expr.this_expression);} ';' '}' '}'
    ;
    classDeclaration[Program prog]:
        'class' class_name = ID ('extends' parent_class = ID )? { ClassDeclaration new_class_dec = create_class_object($class_name.text, $parent_class.text);new_class_dec.set_line_number($class_name.getLine()); $prog.addClass(new_class_dec);} '{' (var_dec = varDeclaration { new_class_dec.addVarDeclaration($var_dec.this_var);})* (method_dec = methodDeclaration {new_class_dec.addMethodDeclaration($method_dec.this_method);})* '}'
    ;
    varDeclaration returns [VarDeclaration this_var]:
        'var' var_name = ID ':' this_type = type ';' {$this_var = create_varDeclaration_object($var_name.text, $this_type.this_type, $var_name.getLine());$this_var.set_line_number($var_name.getLine());}
    ;
    methodDeclaration returns [MethodDeclaration this_method]:
        'def' method_name = ID { $this_method = create_methodDeclaration_object($method_name.text);$this_method.set_line_number($method_name.getLine());} ('()' | ('(' arg_name = ID ':' arg_type = type { $this_method = add_arg_to_MethodDeclaration($arg_name.text, $arg_name.getLine(), $arg_type.this_type, $this_method);} (',' arg_name_2 = ID ':' arg_type_2 = type { $this_method = add_arg_to_MethodDeclaration($arg_name_2.text, $arg_name_2.getLine(), $arg_type_2.this_type, $this_method);})* ')')) ':' ret_type = type { $this_method.setReturnType($ret_type.this_type); } '{'  (this_var = varDeclaration {$this_method.addLocalVar($this_var.this_var);})* method_body = statements {$this_method = add_body_statements_to_method($this_method, $method_body.all_statements);} l_num = 'return' ret_expr = expression {$ret_expr.this_expression.set_line_number($l_num.getLine()); $this_method.setReturnValue($ret_expr.this_expression);} ';' '}'
    ;


    statements returns [ArrayList<Statement> all_statements]:
        {$all_statements = new ArrayList<>();} (our_statement = statement {$all_statements.add($our_statement.this_statement);} )*
    ;
    statement returns [Statement this_statement]:
        block_body = statementBlock {$this_statement = create_block_statement_object($block_body.block_statements);} |
        conditional_statement = statementCondition {$this_statement = create_conditional_statement_object($conditional_statement.conditional_expression, $conditional_statement.consequence_body, $conditional_statement.alternative_body); $this_statement.set_line_number($conditional_statement.line_number);}|
        loop_statement = statementLoop {$this_statement = create_loop_statement_object($loop_statement.conditional_expression, $loop_statement.body);  $this_statement.set_line_number($loop_statement.line_number);} |
        write_statement = statementWrite {$this_statement = new Write($write_statement.print_expression); $this_statement.set_line_number($write_statement.line_number);} |
        assign_statement = statementAssignment {$this_statement = $assign_statement.this_statement; $this_statement.set_line_number($assign_statement.line_number);}
    ;
    statementBlock returns [ArrayList<Statement> block_statements]:
        '{'  block_body = statements {$block_statements = new ArrayList<>($block_body.all_statements);} '}'
    ;
    statementCondition returns [Expression conditional_expression, Statement consequence_body, Statement alternative_body,int line_number]:
        if_ = 'if' '(' cond_expre = expression {$line_number = $if_.getLine(); $conditional_expression = $cond_expre.this_expression;} ')' 'then' cons_body = statement {$consequence_body = $cons_body.this_statement;} ('else' alt_body = statement {$alternative_body = $alt_body.this_statement;})?
    ;
    statementLoop returns [Expression conditional_expression, Statement body,int line_number]:
        while_ = 'while' '(' cond_expre = expression {$line_number = $while_.getLine();$conditional_expression = $cond_expre.this_expression;} ')' loop_body = statement {$body = $loop_body.this_statement;}
    ;
    statementWrite returns [Expression print_expression, int line_number]:
        l_num = 'writeln(' print_expr = expression {$print_expression = $print_expr.this_expression; $line_number = $l_num.getLine();} ')' ';'
    ;
    statementAssignment returns [Statement this_statement,int line_number]:
        exp = expression l_num = ';' {
            if ($exp.this_expression.getClass().getName().equals("ast.node.expression.MethodCall")){
                MethodCallInMain methodCallInMain = new MethodCallInMain(((MethodCall)$exp.this_expression).getInstance(),(((MethodCall)$exp.this_expression).getMethodName()));
                ArrayList<Expression> method_args = ((MethodCall)($exp.this_expression)).getArgs();
                for (int i = 0; i < method_args.size(); i++){
                    methodCallInMain.addArg(method_args.get(i));
                }
                $this_statement = methodCallInMain;
                $this_statement.set_line_number($exp.this_expression.get_line_number());
                $line_number = $l_num.getLine(); 
            }
            else {
                {$this_statement = new Assign($exp.this_lvalue, $exp.this_rvalue); $this_statement.set_line_number($exp.this_expression.get_line_number()); $line_number = $l_num.getLine();}
            }
        }
    ;
    expression returns [Expression this_expression,Expression this_lvalue,Expression this_rvalue]:
        exp = expressionAssignment{
            if ($exp.this_expression_lvalue == null){
                $this_expression = $exp.this_expression_rvalue;
                $this_rvalue = $exp.this_expression_rvalue;
            }
            else{
                $this_lvalue = $exp.this_expression_lvalue;
                $this_rvalue = $exp.this_expression_rvalue;
                BinaryOperator binary_op = BinaryOperator.assign;
                $this_expression = new BinaryExpression ($exp.this_expression_lvalue,$exp.this_expression_rvalue,binary_op);
                $this_expression.set_line_number($exp.this_expression_lvalue.get_line_number());
            }
        }
    ;
    expressionAssignment returns [Expression this_expression_lvalue,Expression this_expression_rvalue]:
        exp_lvalue = expressionOr assign_op = '=' exp_rvalue = expressionAssignment
        {
            if($exp_rvalue.this_expression_lvalue == null){
                $this_expression_rvalue = $exp_rvalue.this_expression_rvalue;
                $this_expression_lvalue = $exp_lvalue.this_expression;
            } else{
                BinaryOperator binary_op = BinaryOperator.assign;
                $this_expression_rvalue = new BinaryExpression($exp_rvalue.this_expression_lvalue,$exp_rvalue.this_expression_rvalue,binary_op);
                $this_expression_rvalue.set_line_number($exp_rvalue.this_expression_lvalue.get_line_number());
                $this_expression_lvalue = $exp_lvalue.this_expression;
            }
        }
        |   exp = expressionOr {$this_expression_rvalue = $exp.this_expression; $this_expression_lvalue = null;}

    ;

    expressionOr returns [Expression this_expression]:
        left = expressionAnd half_exp = expressionOrTemp {
            if ($half_exp.this_half_expression != null){
                $this_expression = new BinaryExpression ($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
                $this_expression.set_line_number($left.this_expression.get_line_number());

            }
            else{
                $this_expression = $left.this_expression;
            }
        }
    ;

    expressionOrTemp returns [BinaryOperator this_binaryOperator,Expression this_half_expression]:
        op = '||'{$this_binaryOperator = BinaryOperator.or;} left = expressionAnd half_exp = expressionOrTemp{
            if($half_exp.this_binaryOperator == null ) $this_half_expression = $left.this_expression;
            else $this_half_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
            $this_half_expression.set_line_number($left.this_expression.get_line_number());
        }
        |
    ;

    expressionAnd returns [Expression this_expression]:
        left = expressionEq half_exp = expressionAndTemp{
            if ($half_exp.this_half_expression != null){
                $this_expression = new BinaryExpression ($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
                $this_expression.set_line_number($left.this_expression.get_line_number());
            }
            else{
                $this_expression = $left.this_expression;
            }
        }      
    ;

    expressionAndTemp returns [BinaryOperator this_binaryOperator,Expression this_half_expression]:
        op = '&&'{$this_binaryOperator = BinaryOperator.and;} left = expressionEq half_exp = expressionAndTemp{
            if($half_exp.this_binaryOperator == null ) $this_half_expression = $left.this_expression;
            else $this_half_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator); 
            $this_half_expression.set_line_number($left.this_expression.get_line_number());           
            //$this_half_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
        }
        |
    ;

    expressionEq returns [Expression this_expression]:
        left = expressionCmp half_exp = expressionEqTemp{
            if ($half_exp.this_half_expression != null){
                $this_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
                $this_expression.set_line_number($left.this_expression.get_line_number());   
            }
            else{
                $this_expression = $left.this_expression;
            }
        }
    ;

    expressionEqTemp returns [BinaryOperator this_binaryOperator,Expression this_half_expression]:
        (op = '=='{$this_binaryOperator = BinaryOperator.eq;}| op = '<>' {
            $this_binaryOperator = BinaryOperator.neq;}) left = expressionCmp half_exp = expressionEqTemp{
            if($half_exp.this_binaryOperator == null ) $this_half_expression = $left.this_expression;
            else $this_half_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator); 
            $this_half_expression.set_line_number($left.this_expression.get_line_number());              
            //$this_half_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
        }
        |
    ;

    expressionCmp returns [Expression this_expression]:
        left = expressionAdd half_exp = expressionCmpTemp{
            if ($half_exp.this_half_expression != null){
                $this_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
                $this_expression.set_line_number($left.this_expression.get_line_number());   
            }
            else{
                $this_expression = $left.this_expression;
            }
        }
    ;

    expressionCmpTemp returns [BinaryOperator this_binaryOperator,Expression this_half_expression]:
        (op = '<' {$this_binaryOperator = BinaryOperator.lt;} | op = '>' {$this_binaryOperator = BinaryOperator.gt;} ) left= expressionAdd half_exp = expressionCmpTemp 
        {
           if($half_exp.this_binaryOperator == null ) $this_half_expression = $left.this_expression;
           else $this_half_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
           $this_half_expression.set_line_number($left.this_expression.get_line_number());  
            //$this_half_expression = new BinaryExpression($left.this_expression, $half_exp.this_half_expression, $half_exp.this_binaryOperator);

        }
        |
    ;

    expressionAdd returns[Expression this_expression]:
        left = expressionMult half_exp = expressionAddTemp{
            if ($half_exp.this_half_expression != null){
                $this_expression = new BinaryExpression($left.this_expression, $half_exp.this_half_expression, $half_exp.this_binaryOperator);
                $this_expression.set_line_number($left.this_expression.get_line_number()); 
               // $this_expression.set_line_number($half_exp.line_number);
            }
            else{
                $this_expression = $left.this_expression;
            }
        }
    ;

    expressionAddTemp returns[BinaryOperator this_binaryOperator,Expression this_half_expression, int line_number]:
        (op = '+' {$this_binaryOperator = BinaryOperator.add; $line_number = $op.getLine();} | op = '-' {$this_binaryOperator = BinaryOperator.sub;$line_number = $op.getLine();} ) left = expressionMult half_exp = expressionAddTemp
        {
            if($half_exp.this_binaryOperator == null ) $this_half_expression = $left.this_expression;
            else {
                $this_half_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
                $this_half_expression.set_line_number($left.this_expression.get_line_number()); 
               // $this_half_expression.set_line_number($op.getLine());
            }

        }
        |
    ;

    expressionMult returns[Expression this_expression]:
        left = expressionUnary half_exp = expressionMultTemp{
            if ($half_exp.this_half_expression != null){
                $this_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator);
                $this_expression.set_line_number($left.this_expression.get_line_number()); 
                //$this_expression.set_line_number($half_exp.this_half_expression.get_line_number());
            }
            else{
                $this_expression = $left.this_expression;
            }
        }
    ;

    expressionMultTemp returns[BinaryOperator this_binaryOperator,Expression this_half_expression]:
        (op = '*'{$this_binaryOperator = BinaryOperator.mult;}| op = '/'{$this_binaryOperator = BinaryOperator.div;}) left = expressionUnary half_exp = expressionMultTemp{
            if($half_exp.this_binaryOperator == null ) $this_half_expression = $left.this_expression;
            else {
                $this_half_expression = new BinaryExpression($left.this_expression,$half_exp.this_half_expression,$half_exp.this_binaryOperator); 
                $this_half_expression.set_line_number($left.this_expression.get_line_number());
                //$this_half_expression.set_line_number($op.getLine());
            }           
        }
        |
    ;

    expressionUnary returns[Expression this_expression]:
        {UnaryOperator unary_op;}(op = '!'{unary_op = UnaryOperator.not;}| op = '-'{unary_op = UnaryOperator.minus;} ) unary_exp = expressionUnary{
            $this_expression = new UnaryExpression(unary_op,$unary_exp.this_expression); $this_expression.set_line_number($op.getLine());
            $this_expression.set_line_number($unary_exp.this_expression.get_line_number());
        }
        |   exp = expressionMem 
            {
                $this_expression = $exp.this_expression; 
            }
    ;

    expressionMem returns[Expression this_expression]:
        instance_exp = expressionMethods index_exp = expressionMemTemp 
        {
            if ($index_exp.this_expression != null){
                $this_expression = new ArrayCall($instance_exp.this_expression, $index_exp.this_expression);
                $this_expression.set_line_number($instance_exp.this_expression.get_line_number());
            }
            else{
                $this_expression = $instance_exp.this_expression;
            }
        }
    ;

    expressionMemTemp returns [Expression this_expression]:
        l_num = '[' exp = expression ']' {$this_expression = $exp.this_expression;}
        |
    ;
    expressionMethods returns [Expression this_expression]:
        instance = expressionOther {Expression inst = $instance.this_expression;} expr_temp = expressionMethodsTemp[inst] 
        {
            if ($expr_temp.this_expression==null)
                $this_expression = inst;
            else {
                $this_expression = $expr_temp.this_expression;
            }
        }
    ;


    expressionMethodsTemp [Expression instance] returns [Expression this_expression]:
        '.' (method_name1 = ID '()' 
                { MethodCall this_half_instance_1 = create_method_call_object($method_name1.text, $instance);this_half_instance_1.set_line_number($instance.get_line_number());}
                exp = expressionMethodsTemp[this_half_instance_1] {
                    if($exp.this_expression==null)
                        $this_expression = this_half_instance_1;
                    else
                        $this_expression=$exp.this_expression;                    
                    //$this_expression=$exp.this_expression;
                }
                | method_name2 = ID '(' 
                    { MethodCall this_half_instance = create_method_call_object($method_name2.text, $instance);
                    this_half_instance.set_line_number($instance.get_line_number());
                    } 
                    (arg1 = expression 
                        {this_half_instance.addArg($arg1.this_expression);}
                        (',' arg2 = expression 
                            {this_half_instance.addArg($arg2.this_expression);}) 
                        *) 
                ')' exp = expressionMethodsTemp[this_half_instance] 
                {   
                    if($exp.this_expression==null)
                        $this_expression = this_half_instance;
                    else
                        $this_expression=$exp.this_expression;
                } 
                | l_num = 'length' { Length length_expression = new Length($instance); length_expression.set_line_number($instance.get_line_number());} exp=expressionMethodsTemp[length_expression] 
                {
                    if($exp.this_expression == null) 
                        $this_expression = length_expression;
                    else 
                        $this_expression=$exp.this_expression;
                })
        |
    ;

    expressionOther returns [Expression this_expression]:
        number = CONST_NUM {$this_expression = create_int_value_object(Integer.parseInt($number.text)); $this_expression.set_line_number($number.getLine());}
        |   str = CONST_STR {$this_expression = create_string_value_object($str.text); $this_expression.set_line_number($str.getLine());}
        |   'new ' this_int = 'int' '[' size_expression = CONST_NUM ']' {NewArray this_array = new NewArray(); this_array.setIntSize(Integer.parseInt($size_expression.text)); this_array.setExpression(create_int_value_object(Integer.parseInt($size_expression.text))); this_array.set_line_number($this_int.getLine()); $this_expression = this_array;}
        |   'new ' class_name = ID '()' {$this_expression = create_class_instantiation_object($class_name.text); $this_expression.set_line_number($class_name.getLine());}
        |   this_ = 'this' {$this_expression = new This(); $this_expression.set_line_number($this_.getLine());}
        |   true_ = 'true' {$this_expression = create_boolean_value_object(true); $this_expression.set_line_number($true_.getLine());}
        |   false_ = 'false' {$this_expression = create_boolean_value_object(false); $this_expression.set_line_number($false_.getLine());}
        |   name = ID {$this_expression = create_identifier_object($name.text); $this_expression.set_line_number($name.getLine());}
        |   name = ID '[' index = expression ']' {$this_expression = create_array_call_instance($name.text, $index.this_expression, $name.getLine()); $this_expression.set_line_number($name.getLine());}
        |   p_ = '(' expr = expression ')' {$this_expression = $expr.this_expression; $this_expression.set_line_number($p_.getLine());}
    ;
    type returns [Type this_type]:
        'int' {$this_type = new IntType();} |
        'boolean' {$this_type = new BooleanType();} |
        'string' {$this_type = new StringType();} |
        'int[]' {$this_type = new ArrayType();} |
        name = ID {$this_type = create_user_defined_type($name.text);}
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