

            vtbaud (2) --- set vth's concept of the terminal speed   11/06/84


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vtbaud (rate)
                 integer rate

                 Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vtbaud' is used to set the terminal baud rate for other VTH
                 routines.   'Rate'  can be from 50 to 19200.  A number lower
                 than 50 will be set to 50 and one higher than 19200 will  be
                 set  to  19200.   This  value is used to determine the delay
                 times for special functions such as screen clearing and cur-
                 sor positioning.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 After truncating 'rate'  to  the  boundary  conditions,  the
                 value is saved in the SWT common blocks for later use.


            _S_e_e _A_l_s_o

                 other vt?* routines (2)































            vtbaud (2)                    - 1 -                    vtbaud (2)


