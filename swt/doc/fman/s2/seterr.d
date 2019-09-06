

            seterr (2) --- set Subsystem error return code           08/28/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine seterr (stat)
                 integer stat

                 Library:  vswtlb  (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Seterr'  is  used  to set the error status code variable in
                 the Subsystem common area.  This variable is examined by the
                 Shell when it regains control after the execution of a  user
                 program;  if the value of the status code is greater than or
                 equal to 1000, then the Shell  assumes  a  fatal  error  has
          |      occurred and shuts down all currently active shell programs.


            _S_e_e _A_l_s_o

                 error (1), error (2)





































            seterr (2)                    - 1 -                    seterr (2)


