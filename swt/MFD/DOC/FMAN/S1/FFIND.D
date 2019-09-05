

            ffind (1) --- look for a string (kmp style)              08/27/84


          | _U_s_a_g_e

          |      ffind <string> { -{<option>} } { <file_spec> }
          |         <option> ::=  c | i | l | o[<occurrences>] | v | x
          |         <file_spec> ::= <filename> | -[<stdin_number>] |
          |                           -n(<stdin_number>|<filename>)


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Ffind  is  a  filter  that  selects  lines matching a given
          |      string from the named files (or standard input if  no  files
          |      are  specified)  and copies them to standard output.  Unlike
          |      'find', 'ffind' cannot match the standard Subsystem patterns
          |      but will match only a _l_i_t_e_r_a_l string.   The  algorithm  used
          |      (Knuth,  Morris,  and  Pratt)  is very fast and is typically
          |      four to fives times faster than 'find'.

          |      The available options are:

          |           -c   If the "c" option is used, only  a  count  of  the
          |                lines that matched (differed) is printed.

          |           -i   If  the "i" option is used, the case of the string
          |                and the text of the search file(s) is ignored.

          |           -l   If the "l" option is used, each  line  printed  is
          |                preceded  by  its  relative line number within the
          |                file from which it was read.

          |           -o   If the "o" option is used, 'ffind' will quit sear-
          |                ching the current file after <occurrences>  match-
          |                ing  (differing)  lines have been found in it, and
          |                will continue with  the  next  file.   If  "o"  is
          |                specified  but  <occurrences> is omitted, only the
          |                first occurrence is found.

          |           -v   If the "v" option is specified, each line of  out-
          |                put  is  labelled  with the name of the input file
          |                from which the line was read.

          |           -x   If the "x" option is used, only lines that do  not
          |                match the string are printed.

          |      The  remaining  command line arguments are taken as names of
          |      files to be searched for the string.  The full syntax of the
          |      <file_spec> argument is described in  the  entry  for  'cat'
          |      (1).


          | _E_x_a_m_p_l_e_s

          |      lf -c | ffind .r
          |      guide -p sh | ffind the -ci




            ffind (1)                     - 1 -                     ffind (1)




            ffind (1) --- look for a string (kmp style)              08/27/84


          | _M_e_s_s_a_g_e_s

          |      "Usage:  ffind ..."  for bad arguments.
          |      "file:  can't open" for unreadable files.


          | _S_e_e _A_l_s_o

          |      cat (1), change (1), find (1)

          |      Knuth,  D.E.,  J.H.   Morris,  Jr.,  and V.R.  Pratt (1977).
          |      "Fast pattern matching in strings."  SIAM Journal on Comput-
          |      ing 6 (No.  2):  240-267.













































            ffind (1)                     - 2 -                     ffind (1)


