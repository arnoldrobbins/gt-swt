

            p4cl (3) --- compile and load Pascal 4 program           08/24/84


          | _U_s_a_g_e

                 p4cl <source> <ld arguments>


            _D_e_s_c_r_i_p_t_i_o_n

                 'P4cl'  is  a  shell  program  that  invokes  the  necessary
                 sequence of commands to convert a Pascal source file into an
                 executable program.  The first argument, <source>  specifies
                 the  file  that will contain the final executable version of
                 the program.  The Pascal source code is assumed to be in the
          |      file  named  <source>.p.   If  'p4cl'  is  invoked  with  no
          |      <source>  argument,  it  automatically  processes  the  last
          |      program edited, since it shares the shell variable 'f'  with
          |      the  shell  program 'e'.  Any further arguments appearing on
                 the command line are passed directly on to the loader, 'ld'.

                 The Pascal compiler, 'p4c', is first invoked to convert  the
                 contents  of  the  source  file  into  an equivalent Fortran
                 program and write it into the file named <source>.f.  A com-
                 pilation listing is also generated on the  file  <source>.l.
                 (This  listing contains Fortran forms control characters and
                 may be printed with 'sp' using the "-f" option.)

                 The Fortran compiler is then invoked, using 'fc', to produce
                 a binary relocatable version of  the  program  in  the  file
                 <source>.b, which is then prepared for execution by 'ld'.


            _E_x_a_m_p_l_e_s

                 p4cl copy
                 p4cl xref -t -m xref.m


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 p4c (3), fc (1), ld (1)














            p4cl (3)                      - 1 -                      p4cl (3)


