

            show (3) --- print a file showing control characters     01/15/83


            _U_s_a_g_e

                 show [-m | -o] { <file spec> }
                      <file spec> ::= <pathname> | -[<stdin_number>]
                                    | -n(<stdin number> | <pathname>)


            _D_e_s_c_r_i_p_t_i_o_n

                 'Show'  concatenates  the contents of the files specified in
                 its  argument  list,  replacing  any  imbedded  non-printing
                 characters  with  printable  representations, and writes the
                 result on its first standard  output.   Normally,  the  non-
                 printing  characters are displayed as digraphs consisting of
                 a caret ("^") followed by an uppercase letter or punctuation
                 character.  However, if the "-m" option is  specified,  non-
                 printing characters are represented as their ASCII mnemonics
                 enclosed  in  angle  brackets  (e.g.,  a  NEWLINE  would  be
                 represented as "<LF>").  If the "-o"  option  is  specified,
                 the  characters  are  displayed as a caret followed by three
                 octal digits.

                 Input files may be specified in any of several ways:

                 <pathname>          an ordinary Subsystem pathname.

                 -<stdin number>     a dash followed  by  a  decimal  number,
                                     'n',   designates   the  'n'th  standard
                                     input.  'n' must  be  a  legal  standard
                                     input number.

                 -                   this  is  the  same  as  specifying "-1"
                                     (i.e., standard input 1).

                 -n<stdin number>    "-n" followed by a  decimal  number  'n'
                                     indicates that the names of the files to
                                     be  concatenated are to be read from the
                                     'n'th standard input.

                 -n                  this is the same as "-n1".

                 -n<pathname>        the   names   of   the   files   to   be
                                     concatenated  are  to  be  read from the
                                     named file.

                 If no arguments appear, input is read from the  first  stan-
                 dard input port.



            _E_x_a_m_p_l_e_s

                 show weird_file
                 files .r$ | show -m -n




            show (3)                      - 1 -                      show (3)




            show (3) --- print a file showing control characters     01/15/83


            _M_e_s_s_a_g_e_s

                 "Usage:  show ..."  for invalid argument syntax.
                 "<pathname>:   can't  open"  if  a  specified  file can't be
                      opened for reading.


            _S_e_e _A_l_s_o

                 cat (1), copy (1), print (1), pr (1), tee (1)
















































            show (3)                      - 2 -                      show (3)


