

            init$plg (2) --- force PL/I G i/o to recognize the Subsystem  01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 init$plg:  procedure;

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 A call to 'init$plg' from a PL/I G program attaches the PL/I
                 G file SYSIN to the file open as standard input (either disk
                 or  terminal)  and  attaches the PL/I G file SYSPRINT to the
                 file open as standard output (either disk or terminal).

                 To use 'init$plg', it must be declared in the main program,
                 
                    declare init$plg entry;
                 
                 and then called before any executable statements:
                 
                    call init$plg;
                 


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 First 'init$plg' calls 'flush$' on standard input and  stan-
                 dard  output  to  clean  up  any  unfinished  Subsystem I/O.
                 'Init$plg' then calls the Subsystem 'mapfd' to determine the
                 Primos file unit attached to  standard  input.   If  'mapfd'
                 returns a file descriptor, 'init$plg' opens SYSIN using that
                 file  descriptor; otherwise, it opens SYSIN on the terminal.
                 The procedure is then repeated for standard output  and  the
                 PL/I G file SYSPRINT.


            _C_a_l_l_s

                 flush$, mapfd, mapsu, Primos p$open


            _B_u_g_s

                 Files redirected to /dev/null are not supported.
                 
                 Output  on  SYSPRINT  not  followed by a line boundary (e.g.
                 PUT SKIP) will be ignored when the file is directed to disk.
                 It is usually best to terminate all programs with a PUT SKIP
                 to insure that this line boundary is present.


            _S_e_e _A_l_s_o

                 init$p (2), init$f (2)




            init$plg (2)                  - 1 -                  init$plg (2)


