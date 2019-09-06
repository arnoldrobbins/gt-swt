

            execn (2) --- execute program named by a quoted string   03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine execn (path_name)
                 packedchar path_name (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 The  function  of  'execn'  is  almost  identical to that of
                 'exec'.  The only difference is in the form of the  argument
                 passed   to   the  two  routines.   'Exec'  expects  an  EOS
                 terminated string; 'execn' expects a  string  of  characters
                 packed two per word, terminated with a period.  Like 'exec',
                 'execn'  executes the program whose location is specified by
                 the given pathname if that is possible; if an error  occurs,
                 control  returns  to  the  calling program.  On a successful
                 call, control passes to the called program, and the  calling
                 program is lost.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Execn' calls 'ptoc' to unpack its argument into a temporary
                 area;  this  temporary area is then passed as an argument to
                 'exec', which does all the real work.


            _C_a_l_l_s

                 ptoc, exec


            _B_u_g_s

                 Same as 'exec'.


            _S_e_e _A_l_s_o

                 exec (2), ptoc (2)
















            execn (2)                     - 1 -                     execn (2)


