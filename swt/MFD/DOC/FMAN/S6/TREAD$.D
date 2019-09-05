

            tread$ (6) --- read raw words from the terminal          03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function tread$ (buf, nw, f)
                 integer buf(ARB), nw
                 file_des f

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Tread$'  is  the device-dependent driver for terminal line-
                 image i/o.  The first argument is an array  to  receive  the
                 words read; the second argument is the number of words to be
                 read;  the third argument is the file descriptor of the file
                 from which data will be read.  'Tread$' returns  the  number
                 of words placed in the receiving buffer if the read was suc-
                 cessful,  EOF  otherwise.   'Tread$'  is  not  intended  for
                 general use; it is not protected from user  error,  and  may
                 cause termination of the user's program if used incorrectly.
                 It should always be referenced through 'readf'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Tread$'  calls  the  Primos  subroutine C1IN 'nw' times, or
                 until a NEWLINE or EOF is encountered.  C1IN gets  the  next
                 character from the terminal or command input stream.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 buf


            _C_a_l_l_s

                 Primos c1in


            _B_u_g_s

          |      The  semantics  of  'tread$'  are  a little shaky; since one
          |      character per word is stored in a terminal buffer,  'tread$'
                 actually reads characters instead of raw words.


            _S_e_e _A_l_s_o

                 readf (2), dread$ (6)








            tread$ (6)                    - 1 -                    tread$ (6)


