

            dsdump (2) --- produce semi-readable dump of storage     03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine dsdump (form)
                 character form

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Dsdump'  dumps  the contents of memory managed by 'dsinit',
                 'dsget', and 'dsfree' to ERROUT.  It is  primarily  intended
                 for debugging.

                 The  single  argument  is  either  the defined value LETTER,
                 signifying that a character-format dump is desired,  or  the
                 defined  value DIGIT, signifying that an integer-format dump
                 is desired.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Dsdump' simply steps through the  memory  area  (in  common
                 block  DS$MEM) printing the locations and sizes of available
                 blocks and calling 'dsdbiu' to dump the location, size,  and
                 contents  of each block that is in use.  The dump terminates
                 when the end of memory (as indicated by the contents of  the
                 first word of memory) is reached.

                 The routine 'print' is used for all output.


            _C_a_l_l_s

                 print, dsdbiu


            _B_u_g_s

                 As advertised, the dump is only semi-readable.


            _S_e_e _A_l_s_o

                 dsget (2), dsfree (2), dsinit (2), dsdbiu (6)













            dsdump (2)                    - 1 -                    dsdump (2)


