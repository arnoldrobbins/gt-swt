

            intel (3) --- generate Intel format object tape          01/13/83


            _U_s_a_g_e

                 intel <object_file>  [ <relocation> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Intel'  takes  the output of the Intel 8080 cross-assembler
                 ('as8080'), relocates it to  the  desired  starting  address
                 (0000  by  default),  and generates an Intel standard format
                 object tape on its first standard output.

                 'Intel' is useful for down-line loading  assembled  code  to
                 development systems equipped with a standard ROM loader.


            _E_x_a_m_p_l_e_s

                 intel mux
                 intel highloader 16384


            _M_e_s_s_a_g_e_s

                 "Can't open" for unreadable object file.
                 "badly formed code file" for erroneous code files.


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 as8080 (3), lk (3), mot (3)






















            intel (3)                     - 1 -                     intel (3)


