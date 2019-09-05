

            maksub (2) --- make substitution string                  01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function maksub (arg, from, delim, sub)
                 character arg (ARB), delim, sub (MAXPAT)
                 integer from

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Maksub'  converts  the  character  representation of a sub-
                 stitution string starting at "arg(from)"  into  an  internal
                 form   in   'sub'.    Conversion  proceeds  until  there  is
                 insufficient room in 'sub' to proceed or until the character
                 in 'delim' is encountered.  The function return is the  next
                 unexamined position in 'arg'.

                 For a full discussion of the syntax of substitution strings,
                 see either _I_n_t_r_o_d_u_c_t_i_o_n _t_o _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _T_e_x_t _E_d_i_t_o_r or
                 _S_o_f_t_w_a_r_e _T_o_o_l_s.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Straightforward   scan   of  the  substitution  string.   At
                 present,  the  metacharacter  sequences  in  a  substitution
                 string  are  "&" (meaning the string matched) and "@<digit>"
                 (meaning the <digit>th tagged subpattern matched).  'Esc' is
                 used to handle escape sequences; all  other  characters  are
                 substituted literally.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 sub


            _C_a_l_l_s

                 addset, esc, type


            _S_e_e _A_l_s_o

                 makpat  (2),  addset  (2),  change  (1),  ed  (1),  se  (1),
                 _I_n_t_r_o_d_u_c_t_i_o_n _t_o _t_h_e _S_o_f_t_w_a_r_e  _T_o_o_l_s  _T_e_x_t  _E_d_i_t_o_r,  _S_o_f_t_w_a_r_e
                 _T_o_o_l_s.










            maksub (2)                    - 1 -                    maksub (2)


