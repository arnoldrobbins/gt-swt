

            putlit (2) --- write literal string on a file            02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine putlit (message, delimiter, fd)
                 packed_char message (ARB)
                 character delimiter
                 file_des fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Putlit' provides a way to place a literal string on a file.
                 Its  first argument is a packed character string, terminated
                 by a character specified in the second argument.  The  third
                 argument is the file descriptor of the file to be used.

                 'Putlit'  is  maintained for compatibility with earlier ver-
                 sions of the Subsystem.  In the future, 'Putlin'  should  be
                 used to write literal strings.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Putlit'  calls  'ptoc'  to  unpack its first argument, then
                 calls 'putlin' to print the unpacked string on the specified
                 file.


            _C_a_l_l_s

                 ptoc, putlin


            _B_u_g_s

                 Returns no status to indicate whether or not the  write  was
                 successful.


            _S_e_e _A_l_s_o

                 ptoc (2), putlin (2), print (2), encode (2)















            putlit (2)                    - 1 -                    putlit (2)


