

            find (1) --- look for a pattern                          08/27/84


          | _U_s_a_g_e

          |      find <pattern> { -{<option>} } { <file_spec> }
          |         <option> ::=  c | i | l | o[<occurrences>] | v | x
          |         <file_spec> ::= <filename> | -[<stdin_number>] |
          |                           -n(<stdin_number>|<filename>)


            _D_e_s_c_r_i_p_t_i_o_n

                 'Find'  is a filter that selects lines matching a given pat-
                 tern from the named files (or standard input if no files are
                 specified) and copies them to standard output.  The  pattern
                 supplied  as the first argument is a regular expression with
                 the  full  set  of  options  found  in  the  editor.    (See
                 _I_n_t_r_o_d_u_c_t_i_o_n  _t_o  _t_h_e  _S_o_f_t_w_a_r_e  _T_o_o_l_s  _T_e_x_t  _E_d_i_t_o_r  in the
                 _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _U_s_e_r_'_s _G_u_i_d_e for details.)

          |      The available options are:

          |           -c   If the "c" option is used, only  a  count  of  the
          |                lines that matched (differed) is printed.

          |           -i   If the "i" option is used, the case of the pattern
          |                and the text of the search file(s) is ignored.

          |           -l   If  the  "l"  option is used, each line printed is
          |                preceded by its relative line  number  within  the
          |                file from which it was read.

          |           -o   If  the "o" option is used, find will quit search-
          |                ing the current file after <occurrences>  matching
          |                (differing)  lines have been found in it, and will
          |                continue with the next file.  If "o" is  specified
          |                but  <occurrences>  is  omitted,  only  the  first
          |                occurrence is found.

          |           -v   If the "v" option is specified, each line of  out-
          |                put  is  labelled  with the name of the input file
          |                from which the line was read.

          |           -x   If the "x" option is used, or if the first charac-
          |                ter of the pattern is a tilde  ("~"),  only  lines
          |                that do not match the pattern are printed.

          |      The  remaining  command line arguments are taken as names of
          |      files to be searched for the pattern.  The  full  syntax  of
          |      the <file_spec> argument is described in the entry for 'cat'
          |      (1).   Most frequently, it will take the form of a Subsystem
          |      pathname.

                 'Find' is frequently used for processing  output  from  'lf'
                 before  performing  some operation on a number of files, and
                 for stripping out "uninteresting"  lines  from  data  to  be
                 further processed by other tools.



            find (1)                      - 1 -                      find (1)




            find (1) --- look for a pattern                          08/27/84


            _E_x_a_m_p_l_e_s

                 lf -c | find .r$
                 lf -c | find .r$ | find call -lv -n
                 find CALL -lv [lf -c | find .f$]
                 find "format" -c rf.r ed.r


            _M_e_s_s_a_g_e_s

                 "Usage:  find ..."  for bad arguments.
                 "illegal pattern" for bad pattern syntax.
                 "file:  can't open" for unreadable files.


            _S_e_e _A_l_s_o

          |      cat  (1),  change  (1), ffind (1), files (1), se (1), makpat
          |      (2), amatch (2), match (2),  _I_n_t_r_o_d_u_c_t_i_o_n  _t_o  _t_h_e  _S_o_f_t_w_a_r_e
                 _T_o_o_l_s _T_e_x_t _E_d_i_t_o_r






































            find (1)                      - 2 -                      find (1)


