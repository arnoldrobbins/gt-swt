

            getccl (2) --- expand character class into pattern       05/29/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function getccl (arg, i, pat, j)
                 character arg (ARB), pat (MAXPAT)
                 integer i, j

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Getccl' converts the character class specification starting
                 at  'arg(i)'  into  a  pattern element starting at 'pat(j)'.
                 The pattern element consists of a character  count  followed
                 by  a  list  of  all  characters in the class.  The function
                 return is OK if the character class  was  successfully  con-
                 verted, ERR otherwise.

                 For   a   discussion   of   character  classes,  see  either
                 _I_n_t_r_o_d_u_c_t_i_o_n _t_o _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _T_e_x_t _E_d_i_t_o_r  or  _S_o_f_t_w_a_r_e
                 _T_o_o_l_s.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 If  the  first  character  in  the  class specification is a
                 tilde, the class generated is a negated  class  rather  than
                 the standard class.  Room is then reserved for the character
                 count,  and  'filset'  is called to expand the specification
                 into the vector of characters.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 i, pat, j


            _C_a_l_l_s

                 addset, filset


            _S_e_e _A_l_s_o

                 makpat (2), addset (2),  filset  (2),  _I_n_t_r_o_d_u_c_t_i_o_n  _t_o  _t_h_e
                 _S_o_f_t_w_a_r_e _T_o_o_l_s _T_e_x_t _E_d_i_t_o_r, _S_o_f_t_w_a_r_e _T_o_o_l_s












            getccl (2)                    - 1 -                    getccl (2)


