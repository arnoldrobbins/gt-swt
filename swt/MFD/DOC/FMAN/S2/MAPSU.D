

            mapsu (2) --- map standard unit to file descriptor       03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 file_des function mapsu (std_unit)
                 file_des std_unit

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Mapsu'  is  used  to  map  standard  units  (such as STDIN,
                 STDOUT, and ERROUT) to the file descriptor  associated  with
                 the  file to which they are currently equivalent.  It is not
                 intended for general use.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Mapsu' checks the file unit mapping  information  contained
                 in   the  Subsystem  I/O  common  area.   If  the  parameter
                 'std_unit' is one of the following:

                       STDIN       STDOUT
                       STDIN1      STDOUT1
                       STDIN2      STDOUT2
                       STDIN3      STDOUT3
                       ERRIN       ERROUT

                 then the function return is the file descriptor  correspond-
                 ing  to these standard units; otherwise, the function return
                 is the same as the value of 'std_unit'.

                 Note that if the standard port mapping table contains a cir-
                 cular definition, the file descriptor of the user's terminal
                 will be returned.























            mapsu (2)                     - 1 -                     mapsu (2)


