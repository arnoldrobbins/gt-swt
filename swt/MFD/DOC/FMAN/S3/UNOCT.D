

            unoct (3) --- convert UNIX 'od' output to binary         03/23/80


            _U_s_a_g_e

                 unoct  [ <filename> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Unoct'  will read the ASCII output of the UNIX program 'od'
                 (octal dump) present  on  the  named  file,  convert  it  to
                 binary,  and  write  the  result in sixbit code suitable for
                 loading on the GT40 graphics terminal.  (If the filename  is
                 omitted, standard input is assumed.)

                 At  present,  'unoct' is necessary for loading such programs
                 as FOCAL-GT.


            _E_x_a_m_p_l_e_s

                 unoct focal


            _M_e_s_s_a_g_e_s

                 "<filename>:  can't open" for obvious problems.


            _B_u_g_s

                 'Unoct' is kind of an ad hoc solution  to  the  object  code
                 porting  problem  that  will hopefully become unnecessary in
                 the near future.   It  is  also  somewhat  peculiar  to  the
                 environs of Georgia Tech.

                 Locally supported.


            _S_e_e _A_l_s_o

                 scroll (3), information in GT40 directory (//gt40).


















            unoct (3)                     - 1 -                     unoct (3)


