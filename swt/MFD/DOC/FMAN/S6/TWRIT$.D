

            twrit$ (6) --- write raw words to terminal               03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function twrit$ (buf, nw, f)
                 integer buf (ARB), nw
                 file_des f

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Twrit$'  is  the device-dependent driver for terminal line-
                 image i/o.  The first argument is a string of  words  to  be
                 written;  the  second  argument is the number of words to be
                 written; and, the third argument is the file  descriptor  of
                 the  file  to  which data will be written.  'Twrit$' returns
                 the number of  words  written  (which  should  always  equal
                 'nw').   'Twrit$' is not intended for general use; it is not
                 protected from user error, and may cause termination of  the
                 user's  program  if  used  incorrectly.  It should always be
                 referenced through 'writef'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Twrit$' calls the Primos subroutine T1OU 'nw'  times,  once
                 per  word  in 'buf'.  T1OU outputs one character to the user
                 terminal.


            _C_a_l_l_s

                 Primos t1ou


            _S_e_e _A_l_s_o

                 writef (2), tread$ (6), readf (2)




















            twrit$ (6)                    - 1 -                    twrit$ (6)


