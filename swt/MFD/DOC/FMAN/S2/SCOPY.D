

            scopy (2) --- copy one string to another                 02/25/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function scopy (from, i, to, j)
                 character from (ARB), to (ARB)
                 integer i, j

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Scopy'  copies  a  string  from  one place to another.  The
                 source string begins at the 'i'th character of  'from',  and
                 extends  to  an  EOS;  the  destination string begins at the
                 'j'th character of the string 'to'.  Copying takes place  by
                 character-by-character transfer until an EOS is encountered;
                 the  EOS  is transferred to the receiving string also.  When
                 it  finishes,  'scopy'  returns  the  number  of  characters
                 copied, excluding the trailing EOS.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A  simple  loop  copies  characters  from  one string to the
                 other, until an EOS is seen.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 to




























            scopy (2)                     - 1 -                     scopy (2)


