

            eval (1) --- evaluate arithmetic expressions             03/20/80


            _U_s_a_g_e

                 eval { <expression_element> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Eval'  is used to evaluate arithmetic expressions involving
                 32-bit integers and shell variables.  The expression  to  be
                 evaluated  is  given in the arguments, and may be spread out
                 over as many arguments as desired.  The value of the expres-
                 sion is printed on standard output one.

                 'Eval' supports the following operators:

                      +         addition
                      -         subtraction and unary minus
                      *         multiplication
                      /         division
                      %         modulus
                      <<        logical left shift
                      >>        logical right shift
                      **        exponentiation
                      <         less than (returns 1 or 0)
                      >         greater than
                      =         equal to
                      <=        less than or equal to
                      >=        greater than or equal to
                      ~=        not equal to
                      &         bitwise logical and
                      |         bitwise logical or
                      ~         bitwise logical complement

                 Operator priority, from highest to lowest, is as follows:

                      -   (unary minus)
                      **
                      *      /     %     <<    >>
                      +      -
                      <      <=    =     ~=    >=    >
                      ~
                      &
                      |

                 Parentheses may be freely used to specify the desired  order
                 of evaluation.

                 Shell variables may appear in expressions; their values will
                 be  substituted  when  necessary.  As always, shell function
                 calls may be included as part of the command line, and  will
                 be processed before 'eval' sees the expression.

                 Care  should  be taken in using characters recognized by the
                 shell as meta-characters (e.g.  parentheses,  vertical  bar,
                 greater than sign).  For this reason, it is probably wise to
                 enclose the expression in quotes.


            eval (1)                      - 1 -                      eval (1)




            eval (1) --- evaluate arithmetic expressions             03/20/80


            _E_x_a_m_p_l_e_s

                 eval 10 - 14 + 37**2
                 set i = [eval i + 1]
                 cat file_stack[eval sp-1]


            _M_e_s_s_a_g_e_s

                 "Bad  element  in  expression" for missing or unrecognizable
                      expression element.
                 "<var>:  domain error" for reference  to  non-numeric  shell
                      variable.
                 "<var>:   value  error"  for  reference  to  undefined shell
                      variable.


            _S_e_e _A_l_s_o

                 cmp (1), declare (1), forget (1), set (1), hp (1)






































            eval (1)                      - 2 -                      eval (1)


