

            ptoc (2) --- convert packed string to EOS-terminated string  03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function ptoc (pstr, term, str, len)
                 packed_char pstr (ARB)
                 integer len
                 character term, str (len)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Ptoc'  is  used  to convert packed character strings (e.g.,
                 Fortran Hollerith literals) into the EOS-terminated unpacked
                 form normally used by all Subsystem routines.  The  argument
                 'pstr'  is  the  packed  array to be converted.  'Term' is a
                 "termination  character";  if  the   termination   character
                 appears  unescaped  in the packed string, then the unpacking
                 operation will be terminated.  (For example,  most  uses  of
                 packed  strings  in  _S_o_f_t_w_a_r_e  _T_o_o_l_s  included a period as a
                 termination character, since in general there  is  no  other
                 way  for  a  subprogram  to  tell  where a Hollerith literal
                 ends.)  The argument 'str' is an array to receive the unpac-
                 ked string; its maximum length is specified by the  argument
                 'len'.

                 The function return is the length of the string in 'str' (as
                 usual, excluding the EOS character).

                 A  note  on  a  rather  common  use  of 'ptoc':  Many Primos
                 routines return packed character strings that do not have  a
                 termination  character,  but do have a maximum length.  When
                 using 'ptoc' to convert the output of  these  routines,  one
                 may  use EOS as the termination character to obtain a fixed-
                 length result.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Ptoc' uses the standard Subsystem macro  'fpchar'  to  pull
                 successive characters from the packed array.  These are sim-
                 ply  copied  into  the  receiving string until the string is
                 full or an unescaped instance of the  termination  character
                 is found.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str


            _S_e_e _A_l_s_o

                 other    conversion    routines   ('cto?*'   and   '?*toc'),
                 particularly 'ctop' (2), 'vtoc' (2), and 'ctov' (2)



            ptoc (2)                      - 1 -                      ptoc (2)


