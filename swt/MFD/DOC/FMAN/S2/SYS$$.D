

            sys$$ (2) --- pass a command to the Primos shell         08/28/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function sys$$ (cmd, cominput)
                 character cmd (ARB)
                 file_des cominput

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Sys$$'  passes  the  Primos  command in 'cmd' to the Primos
                 shell with a call to the Primos  routine  CP$.   The  second
                 argument  'cominput'  specifies the file unit from which the
                 command takes its input.  If no change in command  input  is
                 desired, the argument should be ERR.

                 The  function return is ERR if the status returned by CP$ is
                 greater than zero (a fatal error), and OK otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Sys$$' converts the command to a varying  character  string
                 with  a  call to 'ctov'.  If 'cominput' isn't the value ERR,
                 the command input is switched to that file;  otherwise,  the
                 command  is  just  executed, with no change being made as to
                 where the command input is coming from.  After making a call
                 to the Primos routine MKONU$ to create an  on-unit  for  the
                 Primos  REENTER$  condition,  it  calls  CP$  to process the
                 Primos command.


            _C_a_l_l_s

                 ctov, flush$, mapfd, mapsu, Primos  break$,  Primos  comi$$,
                 Primos cp$, Primos mkonu$


            _B_u_g_s

                 If  the  user's program is loaded in segment 4000, then only
                 Primos internal  commands  may  be  executed  with  'sys$$'.
                 External commands will destroy the current memory image, and
                 may destroy the user's current Primos environment, requiring
          |      that the user reset it, using the Primos command "RLS -ALL".

          |      When  Primos  supports EPFs, this restriction will be lifted
          |      (on programs loaded with 'bind').


            _S_e_e _A_l_s_o

                 ldtmp$ (6)




            sys$$ (2)                     - 1 -                     sys$$ (2)


