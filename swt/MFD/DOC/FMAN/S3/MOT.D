

            mot (3) --- generate Motorola format object tape         01/15/83


            _U_s_a_g_e

                 mot <object_file>  [ <relocation> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Mot'  takes the output of the Motorola 6800 cross-assembler
                 ('as6800'), relocates it to  the  desired  starting  address
                 (0000  by default), and generates a Motorola standard format
                 object tape on its first standard output.

                 'Mot' is useful for  down-line  loading  assembled  code  to
                 development systems equipped with the MIKBUG/MINIBUG ROM (or
                 any of the many other commercially available ROM's using the
                 same load format).

                 Unlike MIKBUG's Punch command, 'mot' generates an "L" before
                 and  an  "S9"  after  the  object text, thus permitting con-
                 venient loading of multiple files  without  operator  inter-
                 vention.


            _E_x_a_m_p_l_e_s

                 mot mux
                 mot highloader 16384


            _M_e_s_s_a_g_e_s

                 "Can't open" for unreadable object file.
                 "Usage:  mot ..."  for missing arguments.
                 "badly  formed code file" when an error is found in the code
                 file.


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 as6800 (3), lk (3), intel (3)













            mot (3)                       - 1 -                       mot (3)


