

            mapfd (2) --- convert fd to Primos funit                 01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function mapfd (fd)
                 file_des fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 Certain   applications   require  the  Primos  funit  number
                 associated with a given open disk file.   'Mapfd'  retrieves
                 the funit number corresponding to a file descriptor.  If the
                 file  open  on the given file descriptor is not a disk file,
                 the function return is ERR; otherwise,  it  is  the  desired
                 funit number.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The  Primos  funit  associated  with each file descriptor is
                 available in the Subsystem I/O common area.  'Mapfd'  simply
                 checks   to   make   sure   the  specified  file  descriptor
                 corresponds to a disk file, then returns the funit.


            _C_a_l_l_s

                 mapsu


            _S_e_e _A_l_s_o

                 mapsu (2)
























            mapfd (2)                     - 1 -                     mapfd (2)


