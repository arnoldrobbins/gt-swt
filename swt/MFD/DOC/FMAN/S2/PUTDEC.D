

            putdec (2) --- write decimal integer to a file           03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine putdec (n, w, fd)
                 integer n, w
                 file_des fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Putdec'  prints  a  decimal  integer  in  a  field of width
                 greater than or equal to the argument 'w'.  The argument 'n'
                 is the integer to be printed; 'w' is the field  width;  'fd'
                 is the file descriptor of the file to be written.  If 'w' is
                 insufficient  to  print the integer, enough additional space
                 on the file is used to insure that an  accurate  representa-
                 tion is printed.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Putdec'  calls 'itoc' to convert the integer to a character
                 representation.   Enough  blanks  are  output  by  calls  to
                 'putch' to right justify the string produced by 'itoc', then
                 the string itself is printed by multiple calls to 'putch'.


            _C_a_l_l_s

                 itoc, putch


            _S_e_e _A_l_s_o

                 itoc (2), encode (2), print (2)






















            putdec (2)                    - 1 -                    putdec (2)


