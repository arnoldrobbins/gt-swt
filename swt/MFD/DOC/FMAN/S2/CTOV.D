

            ctov (2) --- convert EOS-terminated string to varying string  03/01/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function ctov (str, i, var, len)
                 character str (ARB)
                 integer i, len
                 packed_char var (len)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Ctov'  converts _S_o_f_t_w_a_r_e _T_o_o_l_s style EOS-terminated strings
                 to PL/I style "character varying" strings.  Character  vary-
                 ing  strings consist of a one-word length field, followed by
                 up to 32767 words of packed character data.

                 The argument 'str' contains the EOS-terminated string to  be
                 converted.   The integer 'i' gives the position of the first
                 character in the string to be converted, i.e.  the  starting
                 point  of  the  substring  to be packed.  'Var' is the array
                 which is to receive the character varying string, and  'len'
                 is  the  number  of  words  in  'var'  available for holding
                 characters plus one (for the string length  word).   Conver-
                 sion  starts  at  the  'i'th position in 'str' and continues
                 until an EOS is encountered in 'str' or 'var' is  completely
                 filled.   The  function  return  is the number of characters
                 packed.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Ctov', like 'ctop', makes repeated calls  on  the  standard
                 macro  'spchar'  to  pack  characters  into  the destination
                 array.  Once all characters in the string have been  packed,
                 or no room remains in the destination, 'ctov' sets the first
                 word of the destination array to the number of characters it
                 contains and returns this number as the function value.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 i, var


            _S_e_e _A_l_s_o

                 other conversion routines ('cto?*' and '?*toc') (2)










            ctov (2)                      - 1 -                      ctov (2)


