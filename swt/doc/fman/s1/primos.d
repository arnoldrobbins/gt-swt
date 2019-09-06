

            primos (1) --- push a new Primos command interpreter     02/22/82


            _U_s_a_g_e

                 primos


            _D_e_s_c_r_i_p_t_i_o_n

                 'Primos'  allows users to use the Primos command interpreter
                 without terminating the  Subsystem.   The  'primos'  command
                 pushes   a   new   listener  level  of  the  Primos  command
                 interpreter with a call to the Primos routine  COMLV$.   The
                 Primos  command  interpreter  then  prompts  with  "OK," (or
                 whatever prompt has been set).  The user  can  then  execute
                 any  Primos commands (that do not disturb segments '4040 and
                 '4041) in the normal fashion.  Executing the Primos  command
                 REN  (re-enter),  or  executing the command "swt" will cause
                 the Subsystem to close any Primos file units that were  left
                 open by Primos commands and continue where it left off.


            _E_x_a_m_p_l_e_s

                 primos


            _S_e_e _A_l_s_o

                 stop (1), x (1), Primos comlv$






























            primos (1)                    - 1 -                    primos (1)


