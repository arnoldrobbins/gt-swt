

            makpat (2) --- make pattern, terminate at delimiter      08/17/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function makpat (arg, from, delim, pat)
                 character arg (ARB), delim, pat (MAXPAT)
                 integer from

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Makpat'  converts  the  standard character-string form of a
                 regular expression  into  the  internal  form  used  by  the
                 remainder  of  the  pattern matching routines.  The argument
                 'arg' is the regular  expression  to  be  converted;  'from'
                 specifies  the  starting  position  of the pattern in 'arg';
                 'delim'  contains  a  termination  character   which,   when
                 encountered,  causes  conversion to stop; 'pat' receives the
          |      internal form  of  the  regular  expression.   The  function
          |      returns  the  index of the delimiter in 'arg' if the conver-
                 sion succeeded, ERR otherwise.

                 For a full discussion of patterns and pattern matching,  see
                 _I_n_t_r_o_d_u_c_t_i_o_n  _t_o  _t_h_e  _S_o_f_t_w_a_r_e  _T_o_o_l_s  _T_e_x_t  _E_d_i_t_o_r  or, of
                 course, _S_o_f_t_w_a_r_e _T_o_o_l_s.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Makpat' traverses the regular expression a character  at  a
          |      time,  building the internal pattern with calls to 'addset'.
          |      To build character  classes,  'makpat'  calls  'getccl';  to
          |      build  closures  it  calls  'stclos'.  Calls to 'esc' handle
          |      escape sequences in the regular expression.  'Makpat' treats
          |      the special cases of "*" at beginning-of-line,  "%"  not  at
          |      BOL, and "$" not at end-of-line as regular characters.

          |      'Makpat'  takes an error return if the internal form becomes
          |      too large, if an attempt  is  made  to  use  closure  on  an
          |      illegal  pattern  element, if there are too many tagged sub-
          |      patterns, if not all tagged subpatterns are properly closed,
          |      or if 'delim' is never encountered.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 pat


            _C_a_l_l_s

                 addset, esc, getccl, stclos






            makpat (2)                    - 1 -                    makpat (2)




            makpat (2) --- make pattern, terminate at delimiter      08/17/84


            _S_e_e _A_l_s_o

                 match (2), amatch (2), find (1), change (1), ed (1), se (1),
                 _I_n_t_r_o_d_u_c_t_i_o_n _t_o _t_h_e _S_o_f_t_w_a_r_e  _T_o_o_l_s  _T_e_x_t  _E_d_i_t_o_r,  _S_o_f_t_w_a_r_e
                 _T_o_o_l_s





















































            makpat (2)                    - 2 -                    makpat (2)


