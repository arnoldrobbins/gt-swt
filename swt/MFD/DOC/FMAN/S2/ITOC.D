

            itoc (2) --- convert integer to character string         03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function itoc (int, str, size)
                 integer int, size
                 character str (size)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Itoc'  converts the integer given as its first parameter to
                 a character string that is returned as its second parameter.
                 The last 'size' - 1 digits of the number, and no  more,  are
                 returned.   The  number  is  left  justified, with a leading
                 minus sign if the number is negative.  The  function  return
                 is the length of the character string returned.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Itoc'  performs  a  rather  standard  conversion  by  using
                 modular arithmetic to fetch one digit at  a  time  from  the
                 integer  value  supplied.  The character string generated is
                 placed backward in the receiving field, then  reversed  just
                 before exit.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str


            _S_e_e _A_l_s_o

                 other conversion routines ('cto?*' and '?*toc') (2)






















            itoc (2)                      - 1 -                      itoc (2)


