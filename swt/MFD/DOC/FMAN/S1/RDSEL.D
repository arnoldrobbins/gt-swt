

            rdsel (1) --- select tuples of a relation                08/03/81


            _U_s_a_g_e

                 rdsel <sel exp>
                    <sel expr> ::= <term> { '|' <term> }
                        <term> ::= <factor> { & <factor> }
                      <factor> ::= ~ <factor> | <primary>
                     <primary> ::= <object> <rel op> <object>
                      <object> ::= <domain>
                                 | <integer> | <real> | <string>
                      <rel op> ::= < | > | = | <= | >= | ~= | == | <>


            _D_e_s_c_r_i_p_t_i_o_n

                 'Rdsel'  is  part of the toy relational data base management
                 system 'rdb'.  It selects tuples from a relation based on  a
                 selection expression given as an argument.  Standard input 1
                 must  be  directed  to  a file containing an 'rdb' relation.
                 The result relation is written to standard output.

                 The input relation must be a file containing a relation that
                 was created by 'rdmake' or other 'rdb' programs;  the  rela-
                 tion  cannot be read from the terminal.  The output relation
                 is displayed in a readable  format  if  standard  output  is
                 directed  to  a terminal (display in binary would be quite a
                 mess); otherwise, the output relation is written in  binary,
                 internal format for processing by other 'rdb' programs.

                 The  new  relation is formed (effectively) by evaluating the
                 selection expression for each tuple in the  input  relation.
                 Tuples  for which the selection expression is false are then
                 discarded and the remaining tuples are placed in the  output
                 relation.

                 The   selection   expression  is  formed  from  the  logical
                 operators "&" (and), "|"  (or),  and  "~"  (not)  connecting
                 relational  conditions involving two domains or a domain and
                 a  literal.    The   usual   operator   hierarchy   applies:
                 relational  conditions  first, followed by "~", "&" and then
                 "|".  Literals must be the same type as the domain to  which
                 they  are  compared:  string literals must be quoted (either
                 single or double quotes) and integer and real literals  must
                 follow the syntax allowed by 'gctol' and 'ctod'.


            _E_x_a_m_p_l_e_s

                 p.rel> rdsel "pno>'p1'&(color='Red'|weight<15" | rdprint -r
                 sp.rel> rdsel "sno<='s3'"
                 p.rel rdsel "weight>5&weight<20"


            _M_e_s_s_a_g_e_s

                 "Usage:  rdsel <selection expr>"
                 "Cannot load input relation"


            rdsel (1)                     - 1 -                     rdsel (1)




            rdsel (1) --- select tuples of a relation                08/03/81


                 "Sorry, a relation can't be read from the terminal"
                 "Relation is corrupted!!"
                 "Invalid expression"
                 "Unbalanced parentheses"
                 "Missing relational operator"
                 "Comparing two literals is bogus!"
                 "Comparing two literals is bogus!"
                 "Types to be compared are not compatible"
                 "Expected domain name or literal"
                 "<domain>:  domain not found or ambiguous"
                 "Too many literals"
                 "Invalid integer constant"
                 "Invalid real constant"
                 "Missing quote"
                 "Illegal character"
                 "Selection expression too complicated"


            _B_u_g_s

                 If  standard  output is directed to "/dev/lps", the relation
                 is written in binary.


            _S_e_e _A_l_s_o

                 ctod (2), gctol (2), rdcat  (1),  rdextr  (1),  rdjoin  (1),
                 rdmake  (1), rdprint (1), rdproj (1), rdsel (1), rdsort (1),
                 rduniq (1)





























            rdsel (1)                     - 2 -                     rdsel (1)


