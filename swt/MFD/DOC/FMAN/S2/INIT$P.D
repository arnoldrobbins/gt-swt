

            init$p (2) --- force Pascal i/o to recognize the Subsystem  01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 procedure init$p;

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 A call to 'init$p' from a Pascal program attaches the Pascal
                 file  INPUT  to the file open as standard input (either disk
                 or terminal) and attaches the Pascal file OUTPUT to the file
                 open as standard output (either disk or terminal).

                 To use 'init$p', it must be declared as a level 1 procedure,
                 
                    procedure init$p; extern;
                 
                 and then called as the first statement after  the  BEGIN  in
                 the main program:
                 
                    init$p;
                 


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 First 'init$p' calls 'flush$' on standard input and standard
                 output  to  clean up any unfinished Subsystem I/O.  'Init$p'
                 then calls the Subsystem 'mapfd'  to  determine  the  Primos
                 file  unit attached to standard input.  If 'mapfd' returns a
                 file descriptor, 'init$p' tweaks  the  Pascal  file  control
                 block  'p$ainp'  and  calls  the  Primos  routine  ATTDEV to
                 establish the unit mapping.  Next 'init$p' calls 'gfnam$' to
                 obtain the pathname of the disk file.  If 'gfnam$' returns a
                 valid pathname, 'mktr$' is called to  convert  the  pathname
                 into  a  Primos  treename.  This treename is copied into the
                 Pascal file control block so that Pascal  can  use  it  when
                 reporting  I/O errors.  If 'gfnam$' returns ERR, the message
                 'pathname unobtainable'  is  copied  into  the  Pascal  file
                 control  block  as the file name.  Otherwise, since INPUT is
                 already directed to the  terminal,  'init$p'  does  nothing.
                 This  procedure is then repeated for standard output and the
                 Pascal file OUTPUT.


            _C_a_l_l_s

                 ctop, flush$, gfnam$, mapfd, mapsu, mktr$, Primos attdev


            _B_u_g_s

                 Files redirected to /dev/null are not supported.




            init$p (2)                    - 1 -                    init$p (2)




            init$p (2) --- force Pascal i/o to recognize the Subsystem  01/07/83


            _S_e_e _A_l_s_o

                 init$f (2), init$plg (2), file$p (2)























































            init$p (2)                    - 2 -                    init$p (2)


