

            cat (1) --- concatenate and print files                  08/24/84


          | _U_s_a_g_e

          |      cat { <file_spec> | -h | -s }

                 <file_spec> ::= <filename> | -[<stdin_number>] |
                                 -n(<stdin_number>|<filename>)


            _D_e_s_c_r_i_p_t_i_o_n

                 'Cat'  concatenates  the  contents of the files specified in
                 its argument list and writes the result on its  first  stan-
                 dard  output.   Files to be concatenated may be specified in
                 any of several ways:

                 <filename>          an ordinary Subsystem pathname.

                 -<stdin_number>     a dash followed  by  a  decimal  number,
                                     'n',   designates   the  'n'th  standard
                                     input.  'n' must  be  a  legal  standard
                                     input number.

                 -                   this  is  the  same  as  specifying "-1"
                                     (i.e.  standard input 1).

                 -n<stdin_number>    "-n" followed by a  decimal  number  'n'
                                     indicates that the names of the files to
                                     be  concatenated are to be read from the
                                     'n'th standard input.

                 -n                  this is the same as "-n1".

                 -n<filename>        the   names   of   the   files   to   be
                                     concatenated  are  to  be  read from the
                                     named file.

                 If no arguments appear, the first  standard  input  file  is
                 copied to standard output until end-of-file.

                 If  the  "-h" argument is given, 'cat' precedes the contents
                 of each file copied with a header line consisting of  twenty
                 equals-signs  ("=")  followed  by  a  blank, the name of the
          |      file, another blank, and twenty more equals signs.

          |      If the "-s" argument is given, 'cat' will be  "silent".   In
          |      other words, if it cannot open a file, it will not complain.
          |      This  is mainly for the benefit of shell scripts like 'sep',
          |      and the Subsystem 'build' procedures.


            _E_x_a_m_p_l_e_s

                 cat time_sheet
                 cat >junk
                 print_file> cat
                 prog | cat -2 - >two_and_one


            cat (1)                       - 1 -                       cat (1)




            cat (1) --- concatenate and print files                  08/24/84


                 files .r$ | cat -n
                 cat -h -nnamelist >/dev/lps


            _M_e_s_s_a_g_e_s

          |      "<file>:  can't open" if it can't open the named  file,  and
          |      the "-s" option was not specified.


            _S_e_e _A_l_s_o

                 copy (1), cp (1), print (1), pr (1), tee (1), gfnarg (2)













































            cat (1)                       - 2 -                       cat (1)


