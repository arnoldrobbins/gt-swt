# eval --- expression evaluator

   subroutine eval_cmd

   define (MOD_OP,'%'c)          define (DIVIDE_OP,'/'c)
   define (MULTIPLY_OP,'*'c)     define (PLUS_OP,'+'c)
   define (MINUS_OP,'-'c)        define (LESS_OP,'<'c)
   define (EQUAL_OP,'='c)        define (NOT_OP,'~'c)
   define (OR_OP,'|'c)           define (GREATER_OP,'>'c)
   define (AND_OP,'&'c)          define (XOR_OP,'^'c)
   define (EXP_OP,-101)          define (NOT_EQUAL_OP,-102)
   define (LESS_EQUAL_OP,-103)   define (GREATER_EQUAL_OP,-104)
   define (LEFT_SHIFT_OP,-105)   define (RIGHT_SHIFT_OP,-106)
   define (CONSTANT,-107)        define (IDENT,-108)
   define (MAX_STACK,16)

   longint Evalue, Intval
   integer Estatus, Ebuf (MAXLINE), Ep, Token, Global_call
   integer getlin
   character Id (MAXLINE)
   string syntax_error "syntax error in expression"

   procedure concatenate_args forward
   procedure get_token forward
   procedure search_id forward
   procedure check_end_of_expr forward
   procedure expression recursive MAXSTACK forward
   procedure expr1 recursive MAXSTACK forward
   procedure expr2 recursive MAXSTACK forward
   procedure expr3 recursive MAXSTACK forward
   procedure expr4 recursive MAXSTACK forward
   procedure term recursive MAXSTACK forward
   procedure term1 recursive MAXSTACK forward
   procedure factor recursive MAXSTACK forward
   procedure factor1 recursive MAXSTACK forward

   concatenate_args        # collect arguments
   if (Ebuf (1) ~= EOS) {  # evaluate expr on command line
      Estatus = OK
      get_token
      Global_call = YES
      expression
      if (Estatus == OK)
         check_end_of_expr
      if (Estatus == OK)
         call print (STDOUT, "*l*n"p, Evalue)
      }
   else                    # read expressions from STDIN
      for (Estatus = OK; getlin (Ebuf, STDIN) ~= EOF; Estatus = OK) {
         Ep = 1
         get_token
         if (Token == NEWLINE)   # ignore blank lines
            next
         Global_call = YES
         expression
         check_end_of_expr
         if (Estatus == OK)
            call print (STDOUT, "*l*n"p, Evalue)
         }

   if (Estatus ~= OK)
      call seterr (1000)

   stop


   # concatenate_args --- concatenate arguments into a single string

      procedure concatenate_args {

      local j, l, n
      integer j, l, n
      integer getarg

      for ({l = 0; j = 1}; l < MAXLINE - 1; {l += n; j += 1}) {
         if (l > 0) {   # insert blank between args
            l += 1
            Ebuf (l) = ' 'c
            }
         n = getarg (j, Ebuf (l + 1), MAXLINE - l)
         if (n == EOF)
            break
         }

      Ebuf (l + 1) = EOS
      Ep = 1   # setup character pointer

      }


   # get_token --- get next basic token from argument string

      procedure get_token {

      local j
      integer j
      longint gctol

      SKIPBL (Ebuf, Ep)

      select (Ebuf (Ep))
         when (SET_OF_LETTERS, '_'c, '$'c) {    # identifier
            Token = IDENT
            j = 1
            repeat {
               Id (j) = Ebuf (Ep)
               Ep += 1
               j += 1
               } until ( ~ (  IS_LETTER (Ebuf (Ep))
                           || IS_DIGIT (Ebuf (Ep))
                           || Ebuf (Ep) == '_'c
                           || Ebuf (Ep) == '$'c))
            Id (j) = EOS
            }

         when (SET_OF_DIGITS) {  # constant
            Token = CONSTANT
            Intval = gctol (Ebuf, Ep, 10)
            }

         when ('<'c) {  #  <  <=  <<  <>
            Ep += 1
            select (Ebuf (Ep))
               when ('='c)
                  Token = LESS_EQUAL_OP
               when ('<'c)
                  Token = LEFT_SHIFT_OP
               when ('>'c)
                  Token = NOT_EQUAL_OP
               ifany
                  Ep += 1
            else
               Token = LESS_OP
            }

         when ('>'c) {  #  >  >=  >>
            Ep += 1
            select (Ebuf (Ep))
               when ('='c)
                  Token = GREATER_EQUAL_OP
               when ('>'c)
                  Token = RIGHT_SHIFT_OP
               ifany
                  Ep += 1
            else
               Token = GREATER_OP
            }

         when ('~'c, '!'c) {  #  ~  ~=  ~<  ~>  !  !=  !<  !>
            Ep += 1
            select (Ebuf (Ep))
               when ('='c)
                  Token = NOT_EQUAL_OP
               when ('<'c)
                  Token = GREATER_EQUAL_OP
               when ('>'c)
                  Token = LESS_EQUAL_OP
               ifany
                  Ep += 1
            else
               Token = NOT_OP
            }

         when ('='c) {  #  =  ==
            Ep += 1
            if (Ebuf (Ep) == '='c)
               Ep += 1
            Token = EQUAL_OP
            }

         when ('*'c) {  #  *  **
            Ep += 1
            if (Ebuf (Ep) == '*'c) {   # exponentiation
               Ep += 1
               Token = EXP_OP
               }
            else
               Token = MULTIPLY_OP
            }

         when (EOS, NEWLINE)
            Token = NEWLINE

      else {   # single character operator
         Token = Ebuf (Ep)
         Ep += 1
         }

      }



   # search_id --- return numeric value of a shell variable

      procedure search_id {

      local str, i
      character str (32)
      integer i
      integer svget
      longint gctol

      if (svget (Id, str, 32) == EOF) {   # fetch variable
         Intval = 0
         call print (ERROUT, "*s: undefined*n"p, Id)
         Estatus = ERR
         }
      else {
         i = 1
         Intval = gctol (str, i, 10)   # convert to integer
         if (str (i) ~= EOS) {
            Intval = 0
            call print (ERROUT, "*s: non-numeric (*s)*n"p, Id, str)
            Estatus = ERR
            }
         }

      }



   # check_end_of_expr --- make sure there's no garbage left over

      procedure check_end_of_expr {

      if (Token ~= NEWLINE) {
         Estatus = ERR
         call print (ERROUT, "*,#s*n"p, Ep - 1, Ebuf)
         call remark (syntax_error)
         }

      }



   # expression --- evaluate an expression

      procedure expression {

      #  This procedure evaluates the construct:
      #
      #  <expression> ::= <expr1> { '|' <expr1> }

      local val, op, sp
      integer sp, op (MAX_STACK)
      longint val (MAX_STACK)

      if (Estatus ~= ERR) {
         if (Global_call ~= NO)
            sp = 0
         sp += 1
         expr1
         val (sp) = Evalue
         while (Token == OR_OP || Token == XOR_OP) {
            op (sp) = Token
            get_token
            expr1
            select (op (sp))
               when (OR_OP)
                  val (sp) |= Evalue
               when (XOR_OP)
                  val (sp) ^= Evalue
            else {
               call remark ("in expression: can't happen"p)
               Estatus = ERR
               break
               }
            }
         Evalue = val (sp)
         sp -= 1
         }

      }



   # expr1 --- evaluate a single primary expression

      procedure expr1 {

      #  This procedure evaluates the construct:
      #
      #  <expr1> ::= <expr2> { '&' <expr2> }

      local val, sp
      integer sp
      longint val (MAX_STACK)

      if (Estatus ~= ERR) {
         if (Global_call ~= NO)
            sp = 0
         sp += 1
         expr2
         val (sp) = Evalue
         while (Token == AND_OP) {
            get_token
            expr2
            val (sp) &= Evalue
            }
         Evalue = val (sp)
         sp -= 1
         }

      }



   # expr2 --- evaluate a single tertiary expression

      procedure expr2 {

      #  This procedure evaluates the construct:
      #
      #  <expr2> ::= [ <unary_not> ] <expr3>

      if (Estatus ~= ERR)
         if (Token == NOT_OP) {
            get_token
            expr3
            Evalue = not (Evalue)
            }
         else
            expr3

      }



   # expr3 --- evaluate a single secondary expression

      procedure expr3 {

      #  This procedure evaluates the construct:
      #
      #  <expr3> ::= <expr4> { <relop> <expr4> }

      local val, op, sp
      integer sp, op (MAX_STACK)
      longint val (MAX_STACK)

      if (Estatus ~= ERR) {
         if (Global_call ~= NO)
            sp = 0
         sp += 1
         expr4
         val (sp) = Evalue
         while (Token == LESS_OP || Token == LESS_EQUAL_OP
               || Token == EQUAL_OP || Token == NOT_EQUAL_OP
               || Token == GREATER_EQUAL_OP || Token == GREATER_OP) {
            op (sp) = Token   # save operator
            get_token
            expr4
            select (op (sp))
               when (LESS_OP)
                  val (sp) = rt (val (sp) <  Evalue, 1)
               when (LESS_EQUAL_OP)
                  val (sp) = rt (val (sp) <= Evalue, 1)
               when (EQUAL_OP)
                  val (sp) = rt (val (sp) == Evalue, 1)
               when (NOT_EQUAL_OP)
                  val (sp) = rt (val (sp) ~= Evalue, 1)
               when (GREATER_EQUAL_OP)
                  val (sp) = rt (val (sp) >= Evalue, 1)
               when (GREATER_OP)
                  val (sp) = rt (val (sp) >  Evalue, 1)
            else {
               call remark ("in expr2: can't happen"p)
               Estatus = ERR
               break
               }
            }  # while (...)
         Evalue = val (sp)
         sp -= 1
         }

      }



   # expr4 --- evaluate a simple expression

      procedure expr4 {

      #  This procedure evaluates the construct:
      #
      #  <expr4> ::= <term> { <addop> <term> }

      local val, op, sp
      integer sp, op (MAX_STACK)
      longint val (MAX_STACK)

      if (Estatus ~= ERR) {
         if (Global_call ~= NO)
            sp = 0
         sp += 1
         term
         val (sp) = Evalue
         while (Token == PLUS_OP || Token == MINUS_OP) {
            op (sp) = Token
            get_token
            term
            select (op (sp))
               when (PLUS_OP)
                  val (sp) += Evalue
               when (MINUS_OP)
                  val (sp) -= Evalue
            else {
               call remark ("in expr4: can't happen"p)
               Estatus = ERR
               break
               }
            }
         Evalue = val (sp)
         sp -= 1
         }

      }



   # term --- evaluate a single term

      procedure term {

      #  This procedure evaluates the construct:
      #
      #  <term> ::= <term1> { <mulop> <term1> }

      local val, op, sp
      integer sp, op (MAX_STACK)
      longint val (MAX_STACK)

      if (Estatus ~= ERR) {
         if (Global_call ~= NO)
            sp = 0
         sp += 1
         term1
         val (sp) = Evalue
         while (Token == MULTIPLY_OP || Token == DIVIDE_OP
               || Token == MOD_OP || Token == LEFT_SHIFT_OP
               || Token == RIGHT_SHIFT_OP) {
            op (sp) = Token   # save operator
            get_token
            term1
            select (op (sp))
               when (MULTIPLY_OP)
                  val (sp) *= Evalue
               when (DIVIDE_OP)
                  val (sp) /= Evalue
               when (MOD_OP)
                  val (sp) %= Evalue
               when (LEFT_SHIFT_OP)
                  val (sp) = ls (val (sp), Evalue)
               when (RIGHT_SHIFT_OP)
                  val (sp) = rs (val (sp), Evalue)
            else {
               call remark ("in term: can't happen"p)
               Estatus = ERR
               break
               }
            }
         Evalue = val (sp)
         sp -= 1
         }

      }



   # term1 --- evaluate one secondary term

      procedure term1 {

      #  This procedure evaluates the construct:
      #
      #  <term1> ::= <factor> { <exp_op> <factor> }

      local val, sp
      integer sp
      longint val (MAX_STACK)

      if (Estatus ~= ERR) {
         if (Global_call ~= NO)
            sp = 0
         sp += 1
         factor
         val (sp) = Evalue
         while (Token == EXP_OP) {
            get_token
            factor
            val (sp) = val (sp) ** Evalue
            }
         Evalue = val (sp)
         sp -= 1
         }

      }



   # factor --- evaluate a single factor

      procedure factor {

      #  This procedure evaluates the construct:
      #
      #  <factor> ::= [ <unary_minus> ]  <factor1>

      if (Estatus ~= ERR)
         if (Token == MINUS_OP) {
            get_token
            factor1
            Evalue = - Evalue
            }
         else
            factor1

      }



   # factor1 --- evaluate a single primary factor

      procedure factor1 {

      # This procedure evaluates the construct:
      #
      # <factor1> ::= <ident> | <constant> | '(' <expression> ')'

      if (Estatus ~= ERR)
         if (Token == IDENT || Token == CONSTANT) {
            if (Token == IDENT)
               search_id
            Evalue = Intval
            get_token
            }
         elif (Token == '('c) {
            get_token
            Global_call = NO  # indicate that this is a recursive call
            expression
            if (Token == ')'c)
               get_token
            else {
               call remark ("missing right parenthesis"p)
               Estatus = ERR
               }
            }
         else {
            call print (ERROUT, "*,#s*n"p, Ep - 1, Ebuf)
            call remark (syntax_error)
            Estatus = ERR
            }

      }



   end
