

            mktemp (2) --- create a temporary file                   03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 file_des function mktemp (mode)
                 integer mode

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Mktemp'  is  used  to  make  a  temporary file.  The single
                 parameter is an i/o mode (WRITE  or  READWRITE).   The  tem-
                 porary file is created in directory =temp=, so write permis-
                 sion  in  the  home  directory  is  not  required.  'Mktemp'
                 returns a file descriptor if the temporary was  successfully
                 created, ERR otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Mktemp'  consists  of a loop that calls 'create' to attempt
                 the creation of files with names of the form  "=temp=/tm?*",
                 where "?*" represents a string of decimal digits.  If such a
                 file can be created, 'mktemp' returns a file descriptor that
                 can be used to access it; otherwise, ERR is returned.


            _C_a_l_l_s

                 encode, create


            _S_e_e _A_l_s_o

                 rmtemp (2), close (2), create (2), open (2)























            mktemp (2)                    - 1 -                    mktemp (2)


