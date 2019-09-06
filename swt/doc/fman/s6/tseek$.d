

            tseek$ (6) --- seek on a terminal device                 01/06/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function tseek$ (pos, f, ra)
                 longint pos
                 file_des f
                 integer ra

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Tseek$'  is an internal Subsystem routine that performs the
                 function of 'seekf' for  terminal  files  only.   The  first
                 argument  is a long integer value which specifies the amount
                 of positioning relative to the  current  position  (negative
                 and   absolute  positioning  are  not  allowed  on  terminal
                 devices).  The second argument is the file descriptor of the
                 file whose file pointer is  being  manipulated.   The  third
                 argument  must  equal REL.  The function return is OK if the
                 positioning was successful, ERR if 'ra' is ABS or  if  'pos'
                 is  negative.   'Tseek$' is not intended for general use; it
                 is not protected from user error, and may cause  termination
                 of the user's program if used incorrectly.  It should always
                 be referenced through 'seekf'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Tseek$'  calls  the  Primos  subroutine C1IN 'pos' times to
                 "skip over" 'pos' characters.


            _C_a_l_l_s

                 Primos c1in


            _S_e_e _A_l_s_o

                 seekf (2)

















            tseek$ (6)                    - 1 -                    tseek$ (6)


