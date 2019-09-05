

            lsdel (4) --- delete characters from a linked string     03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine lsdel (ptr, pos, len)
                 pointer ptr
                 integer pos, len

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 Characters  are  deleted  from the string specified by 'ptr'
                 starting  from  position  'pos'  and  continuing  for  'len'
                 characters.   'Len'  may  be  specified  as a huge number to
                 delete all remaining characters in the string.  Even if  all
                 characters  in  the  string  are  deleted,  the pointer that
                 remains in 'ptr' is still  valid  and  points  to  a  string
                 containing EOS.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The  string  is  positioned  to position 'pos' with 'lspos'.
                 'Lsfree' is called to free 'len'  characters.   If  'lsfree'
                 returns  0 as a pointer value (meaning it ran past the EOS),
                 EOS is placed is  position  'pos';  otherwise,  the  pointer
                 returned by 'lsfree' is placed in position 'pos'.


            _C_a_l_l_s

                 lsfree, lspos


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 lsdrop (4), lssubs (4), lstake (4)
















            lsdel (4)                     - 1 -                     lsdel (4)


