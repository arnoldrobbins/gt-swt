

            lscopy (4) --- copy linked string                        01/03/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine lscopy (ptr1, pos1, ptr2, pos2)
                 pointer ptr1, ptr2
                 integer pos1, pos2

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 The string specified by 'ptr1', beginning at position 'pos1'
                 is  copied  to  the  string specified by 'ptr2' beginning at
                 position 'pos2'.  If 'ptr2' is zero, a string of the  proper
                 length  is  allocated  and  the pointer to it is returned in
                 'ptr2' after copying.  If in copying, the  resultant  string
                 would overflow the space allocated for the second string, no
                 new space is allocated, and the copy terminates.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The  first  string  is  positioned to position 'pos1' with a
                 call to 'lspos'.  Then, if 'ptr2' is zero, a string  of  the
                 proper  length  is  allocated  with a call to 'lsallo'.  The
                 second string is then  positioned  to  position  'pos2'  and
                 characters are copied until the end of one string is reached
                 by using 'lsgetc' and 'lsputc'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 ptr2 (if zero)


            _C_a_l_l_s

                 lsallo, lsgetc, lslen, lspos, lsputc


            _B_u_g_s

                 Locally supported.















            lscopy (4)                    - 1 -                    lscopy (4)


