

            markf (2) --- get the current position of a file         03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 file_mark function markf (fd)
                 file_des fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Markf' is used to determine the current position of an open
                 file.  The position is normally recorded and later reused by
                 'seekf' for random I/O.

                 The  single  argument  specifies  a  file  whose position is
                 desired.  The function return is ERR if the  position  could
                 not  be  determined  or if "position" has no meaning for the
                 device currently associated with the given file descriptor.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 If necessary, 'markf' calls 'flush$' to empty the  Subsystem
                 buffer  belonging  to  the  file.  If the file is associated
                 with a terminal  device,  'tmark$'  is  called  to  get  the
                 position.   Similarly,  'dmark$'  is called if the file is a
                 disk file.  The null device is always at position zero.


            _C_a_l_l_s

                 mapsu, flush$, tmark$, dmark$


            _B_u_g_s

                 'Markf' may fail between two characters in a  line,  because
                 files  under  Primos  are  word-addressed, rather than byte-
                 addressed.  'Markf' should only be used at  word  boundaries
                 (for  binary files) or line boundaries (for standard charac-
                 ter files).


            _S_e_e _A_l_s_o

                 dmark$ (6), tmark$ (6), seekf (2)












            markf (2)                     - 1 -                     markf (2)


