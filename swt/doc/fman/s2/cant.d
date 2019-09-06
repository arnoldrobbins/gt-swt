

            cant (2) --- print cant open file message                02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine cant (file_name)
                 character file_name (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Cant'  is  a  Kernighan/Plauger subroutine normally used to
                 report  errors  after  an  attempt  to  open  a  file.   The
                 'file_name'   supplied  (which  must  be  an  EOS-terminated
                 string) is printed on ERROUT, followed by the message "can't
                 open", and an immediate return to the shell is taken.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Cant' calls 'putlin' to print the  filename  supplied,  and
                 'error'  to print the "can't open" message and return to the
                 Subsystem command interpreter.


            _C_a_l_l_s

                 putlin, error


            _S_e_e _A_l_s_o

                 open (2), create (2), remark (2)


























            cant (2)                      - 1 -                      cant (2)


