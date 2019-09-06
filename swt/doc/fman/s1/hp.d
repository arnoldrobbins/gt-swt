

            hp (1) --- Reverse Polish Notation calculator            03/20/80


            _U_s_a_g_e

                 hp  { <expression elements> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Hp'  is  a desk calculator program using the Reverse Polish
                 Notation familiar to all stack machine aficionados and users
                 of Hewlett-Packard calculators.  It accepts expressions com-
                 posed of operands and operators  from  either  its  argument
                 list or its first standard input and evaluates them.

                 If  the expressions to be evaluated are given on the command
                 line, 'hp' prints the resulting value automatically;  other-
                 wise,  the  user  must  request printing with the "p" or "P"
                 commands.

                 An  acceptable  expression  consists  of   a   sequence   of
                 "constants" and "commands."  Constants are numeric constants
                 written  in  the style of Fortran, and are stored internally
                 as double precision  floating-point  values.   Commands  are
                 single characters that request an arithmetic, stack control,
                 or  control  flow  operation.   The  following  commands are
                 currently implemented:

                      p    print the value on the top of the stack.

                      P    print all the values currently on the stack.

                      d    delete the top value on the stack (throw it away).

                      D    empty the stack completely (throw all stacked data
                           away).

                      +    add top two items on the stack, place sum  on  the
                           stack.

                      -    subtract  top  of  stack  from  next to top, place
                           difference on the stack.

                      *    multiply top two items on the stack, place product
                           on the stack.

                      /    divide next to top of stack by top of stack, place
                           quotient on the stack.

                      ^    evaluate (next to top of stack)  to  the  (top  of
                           stack) power, place result on the stack.

                      <    if next to top of stack is less than top of stack,
                           place  a  1  on the stack; otherwise, place a 0 on
                           the stack.

                      =    if next to top of stack equals top of stack, place
                           a 1 on the stack; otherwise,  place  a  0  on  the


            hp (1)                        - 1 -                        hp (1)




            hp (1) --- Reverse Polish Notation calculator            03/20/80


                           stack.

                      >    if  next  to  top  of stack is greater than top of
                           stack, place a 1 on the stack; otherwise, place  a
                           0 on the stack.

                      &    if  next  to  top  of  stack is nonzero and top of
                           stack is nonzero, place a 1 on the  stack;  other-
                           wise, place a 0 on the stack.

                      |    if next to top of stack is nonzero or top of stack
                           is  nonzero,  place  a  1 on the stack; otherwise,
                           place a 0 on the stack.

                      ~    if top of stack is nonzero, replace it with  a  0;
                           if  it  is  zero,  replace  it  with  a 1 (logical
                           negation).



            _E_x_a_m_p_l_e_s

                 hp 32.75 4.5 *
                 hp
                 1 2 3 4 5 6 7P++++++pd
                 3.1416 2.7183^ 2.7183 3.1416^>p


            _M_e_s_s_a_g_e_s

                 "stack underflow" if an attempt is made to perform an opera-
                      tion with insufficient operands on the stack.
                 "<char>:   unrecognized  command"  if   an   character   not
                      corresponding to any command appears in an expression.


            _S_e_e _A_l_s_o

                 eval (1), stacc (1)



















            hp (1)                        - 2 -                        hp (1)


