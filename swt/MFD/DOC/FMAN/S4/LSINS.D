

            lsins (4) --- insert in linked string                    01/03/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine lsins (ptr1, pos1, ptr2, pos2, len)
                 pointer ptr1, ptr2
                 integer pos1, pos2, len

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 The substring specified by 'ptr2' (from position 'pos2' with
                 length  'len')  is  inserted  into  the  string specified by
                 'ptr1' after position 'pos1'.  String 2 is _n_o_t destroyed.  A
                 pointer to the resulting string is returned in 'ptr1'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 If 'pos1'  is  less  than  or  equal  to  zero,  the  string
                 specified  by  'ptr2'  (string 2) is prepended to the string
                 specified by 'ptr1' (string 1).   This  is  accomplished  by
                 copying  string  2  into  a  new string (string 3), pointing
                 'ptr1' to string 3, and replacing the EOS of string 3 with a
                 pointer to string 1.

                 If 'pos1' is greater than zero, string 2 is inserted  within
                 string  1 (if 'pos1' is greater than the length of string 1,
                 it is assumed to be  equal  to  the  length  of  string  1).
                 String  2 is copied to a new string (string 3) with an extra
                 position at  the  beginning.   String  1  is  positioned  to
                 'pos1'.   The  character  at  this position is placed at the
                 beginning of string 3, a pointer to string 3  replaces  this
                 character,  and  the  EOS  of  string  3  is replaced with a
                 pointer to 'pos1' + 1 of string 1.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 ptr1


            _C_a_l_l_s

                 lscopy, lsdel, lslen, lspos, lssubs


            _B_u_g_s

                 In appending string 2 to  string  1,  it  is  slightly  less
                 efficient  to  specify  a  large  number  for 'pos1' than to
                 specify the exact length of string 1.

                 Locally supported.




            lsins (4)                     - 1 -                     lsins (4)




            lsins (4) --- insert in linked string                    01/03/83


            _S_e_e _A_l_s_o

                 lssubs (4)























































            lsins (4)                     - 2 -                     lsins (4)


