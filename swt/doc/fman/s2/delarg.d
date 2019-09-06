

            delarg (2) --- delete a command line argument            03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function delarg (ap)
                 integer ap
                 
                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Delarg'  deletes  the  command  line  argument indicated by
                 'ap'.  Subsequent arguments  have  their  positions  shifted
                 left by one.  'Delarg' returns OK if there is an argument at
                 the position specified by 'ap', and EOF otherwise.

                 'Delarg'  can  be  used  by  an  argument parsing routine to
                 discard arguments that it recognizes,  while  leaving  other
                 arguments  for  later  action.   Then, routines subsequently
                 examining the command line arguments  are  not  bothered  by
                 arguments already processed.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Delarg'  simply shifts the pointers for arguments following
                 'ap' in the Subsystem common  area  down  by  one  and  then
                 reduces the argument count by one.


            _S_e_e _A_l_s_o

                 getarg (2), parscl (2)


























            delarg (2)                    - 1 -                    delarg (2)


