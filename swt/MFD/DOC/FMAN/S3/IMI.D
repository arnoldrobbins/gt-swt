

            imi (3) --- generate IMI prom programmer down-line load stream  01/13/83


            _U_s_a_g_e

                 imi <object_file>  [ <relocation> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Imi'  takes the output of the Motorola 6800 cross-assembler
                 ('as6800'), relocates it to  the  desired  starting  address
                 (0000  by  default),  and  generates a down-line load stream
                 suitable for use by the  International  Microsystems,  Inc.,
                 prom programmer.

                 Note  that  the  relocation address is given in hexadecimal.
                 Other bases may be specified by preceding the  address  with
                 the   desired   base   followed  by  the  letter  "r,"  e.g.
                 "8r100000".


            _E_x_a_m_p_l_e_s

                 imi mux
                 imi highloader 4000


            _M_e_s_s_a_g_e_s

                 "Can't open" for unreadable object file.
                 "Usage:  imi ..."  for missing arguments.
                 "badly formed code file" for erroneous code files.


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 as6800 (3), lk (3), intel (3), mot (3)


















            imi (3)                       - 1 -                       imi (3)


