

            gitoc (2) --- convert single precision integer to any radix string  03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function gitoc (int, str, size, base)
                 integer int, size, base
                 character str (size)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Gitoc'  will convert a single precision (16 bit) integer to
                 a character string representation in any radix from 2 to  16
                 (inclusive).   The integer to be converted may be considered
                 as either a signed, two's-complement number with 15 bits  of
                 precision,  or  as  an  unsigned  number  with  16  bits  of
                 precision.

                 'Int' is the integer to be converted; 'str' is  a  character
                 array  into  which the string representation will be stored;
                 'size' is the size of 'str'.  The absolute value  of  'base'
                 is  the conversion radix.  If 'base' is negative, then 'int'
                 is treated  as  an  unsigned  number;  otherwise,  'int'  is
                 considered  to be a signed, two's-complement number.  If the
                 specified radix is not in the range  2:16,  then  a  decimal
                 conversion is performed.

                 For  a  signed conversion, if the integer is less than zero,
                 its absolute value is preceded by a minus sign in  the  con-
                 verted  string;  a  positive  number  is never preceded by a
                 sign.

                 The function return is the number of characters required  to
                 represent the integer.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Gitoc'  uses  a  typical  divide-and-remainder algorithm to
                 perform the conversion; that is, a  digit  is  generated  by
                 taking  the  remainder  when  the  integer is divided by the
                 radix.  For signed conversions, the absolute  value  of  the
                 number  is  first taken, the digits generated, and the minus
                 sign inserted if  needed.   For  unsigned  conversions,  the
                 least  significant  bit of the number is saved, and then the
                 number is shifted right one bit position to put it into  the
                 precision  range  of  15  bits (and effectively dividing the
                 unsigned number  by  2).   Then,  as  each  digit  value  is
                 generated,  it  is  doubled  and added to the carry from the
                 previous digit position (with the initial  carry  being  the
                 saved  least  significant  digit)  and  a new carry value is
                 generated.






            gitoc (2)                     - 1 -                     gitoc (2)




            gitoc (2) --- convert single precision integer to any radix string  03/23/80


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str


            _S_e_e _A_l_s_o

                 gltoc (2), itoc (2), other conversion routines ('cto?*'  and
                 '?*toc') (2)

















































            gitoc (2)                     - 2 -                     gitoc (2)


