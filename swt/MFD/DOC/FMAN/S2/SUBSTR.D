

            substr (2) --- take a substring from a string            03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function substr (from, to, first, length)
                 character from (ARB), to (ARB)
                 integer first, length

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Substr'  copies  the portion of the 'from' string specified
                 by the 'first' and 'length' arguments into the  'to'  string
                 and  returns  the  length  of  'to'  string  as  its result.
                 'First' specifies the starting character position in 'from';
                 if it is positive, it indicates a position relative  to  the
                 beginning  of  the  string,  whereas  if it is negative, the
                 indicated position is relative to the  end  of  the  string.
                 'Length' specifies the number of characters to be copied; if
          |      positive, 'length' characters _s_t_a_r_t_i_n_g with the one selected
          |      by  'first'  are  copied;  if  negative, 'length' characters
          |      _e_n_d_i_n_g with the one selected by 'first' are copied.  If  the
                 specified substring overlaps either the beginning or the end
                 of 'from', 'to' will be shorter than 'length' characters.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 to


            _C_a_l_l_s

                 length


            _S_e_e _A_l_s_o

                 stake  (2), sdrop (2), strim (2), take (1), drop (1), substr
                 (1)


















            substr (2)                    - 1 -                    substr (2)


