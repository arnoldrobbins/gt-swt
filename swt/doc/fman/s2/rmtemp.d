

            rmtemp (2) --- remove a temporary file                   03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function rmtemp (fd)
                 file_des fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Rmtemp'  is  used  to  remove  a  temporary file created by
                 'mktemp'.  The file specified by 'fd' is rewound,  truncated
                 to zero length, and closed.  This action is as close as pos-
                 sible  to  actually  deleting  the  file.  If the attempt to
                 close the file is successful, 'rmtemp'  returns  OK;  other-
                 wise, it returns ERR.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Rmtemp'  simply  calls  'rewind',  'trunc', and 'close', in
                 that order, on the given file descriptor.  If  the  call  to
                 'close' fails, ERR is returned; otherwise, OK is returned.


            _C_a_l_l_s

                 rewind, trunc, close


            _S_e_e _A_l_s_o

                 mktemp (2), rewind (2), trunc (2), close (2)

























            rmtemp (2)                    - 1 -                    rmtemp (2)


