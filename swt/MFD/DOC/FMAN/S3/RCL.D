

            rcl (3) --- command file to rf, fc and ld a program      08/24/84


          | _U_s_a_g_e

                 rcl <program> [ <ld arguments> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Rcl'  is  a  shell  file  that  causes the specified Ratfor
                 program to be preprocessed, compiled and loaded.  The source
                 file is expected to be  named  <program>.r  and  the  output
                 object code is named <program>.  Default options are used on
          |      all  processors.   If  'rcl'  is  invoked  with no <program>
          |      argument,  it  automatically  processes  the  last   program
          |      edited,  since  it  shares  the  shell variable 'f' with the
          |      shell program 'e'.

                 If <ld arguments> are present, they will be presented to the
                 loader following the main program binary file.  This  allows
                 the  inclusion of subroutine and library files in the object
                 program.


            _E_x_a_m_p_l_e_s

                 rcl profile
          |      rcl math -l vswtmath


            _B_u_g_s

                 Will not be supported after Version 7.  Use  'rfl'  and  the
                 extended preprocessor 'rp' instead.


            _S_e_e _A_l_s_o

                 rf (3), fc (1), ld (1), pl1cl (1), rfl (1), rp (1)





















            rcl (3)                       - 1 -                       rcl (3)


