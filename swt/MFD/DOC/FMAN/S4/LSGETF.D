

            lsgetf (4) --- read an arbitrarily long linked string    01/03/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function lsgetf (ptr, fd)
                 pointer ptr
                 file_des fd

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 'Lsgetf'  reads  characters  from the file specified by 'fd'
                 into a linked string until a NEWLINE character is  read.   A
                 pointer  to  the  string is returned in 'ptr'.  The function
                 value is the number of characters read, or  EOF  if  end-of-
                 file was encountered before a NEWLINE was seen.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A  new  string  of  zero  length is allocated with a call to
                 'lsallo' and 'ptr' is set to point to it.  Subroutine  'get-
                 lin'  is  then  called  repeatedly  until  a line whose last
                 character (before the EOS) is a NEWLINE is returned, or end-
                 of-file is encountered.  Each line returned is  then  joined
                 to the end of the linked string with a call to 'lsjoin'.  If
                 EOF  is  encountered  before  a  NEWLINE is seen, the entire
                 string is deallocated with a call to 'lsfree'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 ptr


            _C_a_l_l_s

                 getlin, lsallo, lsjoin, lsmake, lspos


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 lsputf (4)










            lsgetf (4)                    - 1 -                    lsgetf (4)


