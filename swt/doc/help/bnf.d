




            Conventions Used in Describing Command Syntax

            Throughout  the  documentation  available from the 'help' command
            and in the _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _R_e_f_e_r_e_n_c_e _M_a_n_u_a_l, the  syntax
            of  commands  is  described  through  the  use  of various 'meta-
            symbols'.  These symbols comprise a system of  notation  commonly
            known  as  'Backus-Naur  Form', or simply BNF.  What follows is a
            brief description of the BNF that is used in this documentation.

                 <>   A word or phrase enclosed in left and right angle brac-
                      kets stands for any string of characters whose  meaning
                      is  either  suggested by the word or phrase so enclosed
                      or explicitely defined later in the syntax.  For  exam-
                      ple,  "<number>"  might  stand  for  "127"  or  "3"  or
                      "98.6".  Words or phrases enclosed  in  these  brackets
                      are called 'meta-linguistic variables'.

                 ::=  This  symbol  means  "is defined as"  and it is used to
                      separate   a   meta-linguistic   variable   from    its
                      definition.  For example,

                           <number> ::= <integer>

                      would  be  read  "a  number  is defined as an integer."
                      Everything to the right of the "::=" is called a 'meta-
                      linguistic formula'.

                 |    The vertical bar means "or" and  is  used  to  separate
                      alternatives  within  a  meta-linguistic  formula.  For
                      example,

                           <number> ::= <integer> | <real>

                      would be read "a number is defined as an integer  or  a
                      real."

                 ()   Parentheses  are  used  to  enclose  a series of alter-
                      natives in a formula when the series comprises only one
                      part of the formula.  For example,

                           <signed_number> ::= (+|-)<number>

                      would be read "a signed number is  defined  as  a  plus
                      sign or a minus sign, followed by a number."

                 []   Formulae (or parts thereof) that are enclosed in square
                      brackets are optional.  For example,

                           <command> ::= <filename> [<parameters>]

                      would  be  read  "a  command  is defined as a filename,
                      optionally followed by parameters."

                 {}   Formulae that are  enclosed  in  curly  braces  may  be
                      repeated  any  number  of  times,  including zero.  For
                      example,










                           <integer> ::= <digit>{<digit>}

                      would be read "an integer is defined as  a  digit  fol-
                      lowed by zero or more digits."

            In  situations  where  the  syntax requires that one of the above
            meta-symbols  appear  literally,  the  symbol  is   enclosed   in
            apostrophes.  For example, in

                 <vertical_bar> ::= '|'

            the  vertical  bar  on  the  right  hand side is interpreted as a
            literal character, not as an "or" symbol.
















































