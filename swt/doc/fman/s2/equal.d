

            equal (2) --- compare two strings for equality           03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function equal (str1, str2)
                 character str1 (ARB), str2 (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Equal'  is used to compare EOS-terminated strings.  The two
                 arguments are the  strings  to  be  compared;  the  function
                 return is YES if they are equal (on a character-by-character
                 basis), NO if they are not.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Equal'  simply  loops through each of the two strings, com-
                 paring characters.  If a mismatch occurs,  NO  is  returned;
                 otherwise, YES is returned.  Comparison stops when an EOS is
                 encountered.   To  be equal, strings must be of equal length
                 (EOS's must match).


            _S_e_e _A_l_s_o

                 strcmp (2)






























            equal (2)                     - 1 -                     equal (2)


