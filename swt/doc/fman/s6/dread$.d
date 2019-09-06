

            dread$ (6) --- read raw words from disk                  02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function dread$ (buf, nw, f)
                 integer buf (ARB), nw
                 file_des f

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Dread$'  is an internal Subsystem routine that performs the
                 function of 'readf' for disk files only.  The first argument
                 specifies a string to receive the  words  read;  the  second
                 argument  is  the number of words to be read; and, the third
                 argument is the file descriptor of the file from which  data
                 will  be  read.  'Dread$' returns the number of words placed
                 in the receiving buffer if  the  read  was  successful;  EOF
                 otherwise.   'Dread$' is not intended for general use; it is
                 not protected from user error, and may cause termination  of
                 the user's program if used incorrectly.  It should always be
                 referenced through 'readf'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Dread$' calls the Primos subroutine PRWF$$ to fill a buffer
                 with words from disk file 'f'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 buf


            _C_a_l_l_s

                 move$, Primos prwf$$


            _B_u_g_s

                 EOF  is  returned  if  any  error  occurs;  the  user is not
                 informed of the actual error that occurs.


            _S_e_e _A_l_s_o

                 readf (2)









            dread$ (6)                    - 1 -                    dread$ (6)


