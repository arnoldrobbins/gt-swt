

            gctoi (2) --- generalized character to integer conversion  03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function gctoi (str, i, radix)
                 character str (ARB)
                 integer radix, i

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Gctoi'  is  similar  to  the routine 'ctoi', except that it
                 accepts base indicators and signs.  Conversion begins on the
                 string 'str' at position  'i'.   The  converted  integer  is
                 returned  as the value of the function.  'I' will be updated
                 to indicate the first position not used in the conversion.

                 Input to 'gctoi' consists of a number containing an optional
                 plus or minus sign, an optional base indicator, and a string
                 of digits allowable for the input base.  The base  indicator
                 consists of the (decimal) radix of the desired base followed
                 by  the  letter  "r" (in the style of Algol 68).  The digits
                 corresponding to the numbers 10 through 15  are  entered  as
                 the letters "a" through "f".  If no base indicator occurs in
                 the  string,  the  number  in 'radix' is used as the default
                 base.  Conversion stops when a character  not  allowable  in
                 the number is encountered.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Gctoi'  first  checks for a leading sign, and records it if
                 found.  If the first one or two digits  of  the  number  are
                 numeric  and  if they are followed by a lower case "r", then
                 they are converted to binary and used as the  radix  of  the
                 remaining  digits;  otherwise, the 'radix' argument is used.
                 The remaining digits of the number are converted by a simple
                 multiply-and-add-successive-digits algorithm.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 i


            _C_a_l_l_s

                 index


            _S_e_e _A_l_s_o

                 gctol (2), ctoi (2), other conversion routines ('cto?*'  and
                 '?*toc') (2)




            gctoi (2)                     - 1 -                     gctoi (2)


