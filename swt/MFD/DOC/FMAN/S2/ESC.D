

            esc (2) --- map substring into escaped character if appropriate  05/29/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 character function esc (array, i)
                 character array (ARB)
                 integer i

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Esc' examines the string 'array' at character position 'i'.
                 If  there  is  an escape character ("@") at this point, then
                 the next character in the array is examined.   If  it  is  a
                 letter  "n",  the  function return is the character NEWLINE.
                 If it is a letter "t", the function return is the  character
                 TAB.   If  the  character  is neither "n" nor "t", or if the
                 escape character was not present, the function return is the
                 character itself.  In all cases, 'i' is incremented to point
                 to the next unexamined character in the string.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 i


            _B_u_g_s

                 Should probably handle "b" for  backspace,  arbitrary  octal
                 and hex character constants, and a few other things.



























            esc (2)                       - 1 -                       esc (2)


