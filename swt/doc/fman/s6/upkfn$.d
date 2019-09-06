

            upkfn$ (6) --- unpack a Primos file name; escape slashes  01/06/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function upkfn$ (name, len, str, max)
                 packed_char name (ARB)
                 integer len, max
                 character str (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Upkfn$' operates on the packed Primos file name or password
                 of  length  'len'  in  'name'.   It  converts  it to an EOS-
                 terminated string in 'str' by unpacking it and  placing  the
                 escape  character  ("@") in front of all slashes.  Thus, the
                 name in 'str' is acceptable to all Subsystem routines expec-
                 ting a file or path name.

                 The function value is the number  of  characters  placed  in
                 'str'.  In no case will more than 'max' elements of 'str' be
                 disturbed.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Upkfn$'  uses  the Subsystem macro 'fpchar' to take succes-
                 sive characters from the packed  name.   Each  character  is
                 copied  into  the  receiving  string  (preceded by an escape
                 character, if it is a slash) after  being  mapped  to  lower
                 case  until  the  string  is  full or the end of the name is
                 reached.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str


            _C_a_l_l_s

                 mapdn


            _S_e_e _A_l_s_o

                 follow (2), getto (2), open (2), ptoc (2)











            upkfn$ (6)                    - 1 -                    upkfn$ (6)


