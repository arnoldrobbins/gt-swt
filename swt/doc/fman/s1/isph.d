

            isph (1) --- see if process is a phantom                 11/07/82


            _U_s_a_g_e

                 isph


            _D_e_s_c_r_i_p_t_i_o_n

                 'Isph' allows a shell file to test and see if its invoker is
                 a  phantom.   It  writes  a  "1"  to  standard output if the
                 invoker is a phantom, and a "0" it it is being  run  from  a
                 terminal.


            _E_x_a_m_p_l_e_s

                 if [isph]
                    then
                       error "screen editor must be run at a terminal"
                    else
                       se -a my_prog
                 fi





































            isph (1)                      - 1 -                      isph (1)


