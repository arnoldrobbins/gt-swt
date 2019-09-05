

            tlit (1) --- transliterate characters                    02/22/82


            _U_s_a_g_e

                 tlit <from set> [ <to set> { <string> } ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Tlit'   is   the  character  transliteration  program  from
                 _S_o_f_t_w_a_r_e _T_o_o_l_s.  Character strings are read from the command
                 line  arguments,  or  from  standard  input,  transliterated
                 according  to  instructions  provided  in  the  command line
                 arguments, and the results written to standard output.   The
                 <from  set>  and  <to set> arguments are sets of characters,
                 with some special shorthand notation.  Each set may have any
                 number of the following components:

                      <character>
                           The character specified becomes part  of  the
                           set.

                      <letter>-<letter>
                           The   letters   specified,  and  all  letters
                           between them alphabetically, become  part  of
                           the  set.  (Note that letters of a given case
                           are contiguous; A-Z means all upper case let-
                           ters.)

                      <digit>-<digit>
                           The digits specified, and all digits  between
                           them  in  numerical order, become part of the
                           set.

                      @n,@t
                           A NEWLINE (if the first form is  used)  or  a
                           TAB (if the second form is used) becomes part
                           of the set.

                 In  addition,  if the <from set> is preceded by a tilde (~),
                 the complement of the set  is  used.   For  example,  "~A-Z"
                 means all characters except upper case letters.

                 For  each character read that is a member of the <from set>,
                 the corresponding member of the <to set> is substituted.  If
                 the <to set> is shorter than the <from set>, each string  of
                 contiguous characters that are in the <from set> but have no
                 corresponding  element  in  the  <to  set>  is replaced by a
                 single occurrence of the last member of the  <to  set>.   If
                 the <to set> is empty or only a single argument is supplied,
                 such character strings are deleted.

                 When  strings are read from the argument list, each separate
                 argument is treated as a NEWLINE-terminated  string.   Thus,
                 lacking specific transliteration of NEWLINE characters, each
                 separate argument string will result in one line of output.




            tlit (1)                      - 1 -                      tlit (1)




            tlit (1) --- transliterate characters                    02/22/82


            _E_x_a_m_p_l_e_s

                 file> tlit a-z A-Z >uc_file
                 file> tlit A-Z a-z | tlit ~a-z @n >words
                 tlit a-z A-Z "output one line"
                 tlit a-z A-Z output three lines


            _M_e_s_s_a_g_e_s

                 "Usage:  tlit ..."  if no arguments are supplied.
                 "<from>  set too large" if <from set> cannot be contained in
                      the internal buffer.
                 "<to> set too large" if <to set> cannot be contained in  the
                      internal buffer.


            _S_e_e _A_l_s_o

                 change (1), ed (1), _S_o_f_t_w_a_r_e _T_o_o_l_s






































            tlit (1)                      - 2 -                      tlit (1)


