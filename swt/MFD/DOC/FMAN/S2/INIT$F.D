

            init$f (2) --- force Fortran i/o to recognize the Subsystem  01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine init$f

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 A  call  to 'init$f' from a Fortran 66 or Fortran 77 program
                 attaches Fortran unit 5 to the file open as  standard  input
                 (either disk or terminal) and attaches Fortran unit 6 to the
                 file open as standard output (either disk or terminal).  The
                 attachment of unit 1 to the terminal is not changed.

                 To  use  'init$f', it must be called as the first executable
                 statement in the main program:
                 
                    call init$f
                 


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 First 'init$f' calls 'flush$' on standard input and standard
                 output to clean up any unfinished Subsystem  I/O.   'Init$f'
                 then  calls  the  Subsystem  'mapfd' to determine the Primos
                 file unit attached to standard input.  If 'mapfd' returns  a
                 file  descriptor,  'init$f' calls Fortran 'attdev' to attach
                 unit 5 to that Primos disk unit; otherwise,  'init$f'  calls
                 the  Primos routine ATTDEV to attach unit 5 to the terminal.
                 The procedure is  then  repeated  for  standard  output  and
                 Fortran unit 6.


            _C_a_l_l_s

                 flush$, mapfd, mapsu, Primos attdev


            _B_u_g_s

                 Files redirected to /dev/null are not supported.


            _S_e_e _A_l_s_o

                 init$p (2), init$plg (2)










            init$f (2)                    - 1 -                    init$f (2)


