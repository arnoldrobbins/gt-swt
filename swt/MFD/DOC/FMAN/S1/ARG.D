

            arg (1) --- print command file arguments                 03/20/80


            _U_s_a_g_e

                 arg <argument_number> [ <level_offset> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Arg'  is  used  from  within  a  shell  program to print an
                 argument specified on the command  line  that  invoked  that
                 shell program.  <Argument_number> is the ordinal position of
                 the  argument  desired.  (A value of zero corresponds to the
                 command name, one corresponds to the first  argument,  etc.)
                 <Level_offset>  is  used  to specify the number of levels of
                 nested input files and/or function  calls  that  are  to  be
                 skipped  before  fetching  the specified argument string.  A
                 value of zero means fetch the argument from the first higher
                 nesting level; one means skip one level to the second higher
                 level, etc.  The string thus obtained is printed on standard
                 output 1, followed by a newline.

                 Since 'arg' is typically used in a function  call  within  a
                 shell  program,  the default value of <level offset> is one,
                 so that the level corresponding  to  the  function  call  is
                 skipped and the shell program arguments are accessed.

                 If  <argument  number>  is  out  of  range for the specified
                 level, the empty string is returned and only  a  newline  is
                 printed.


            _E_x_a_m_p_l_e_s

                 print [arg 1]     # These two commands fetch the
                 arg 1 0           # same argument.

                 echo [arg 1] [arg 2] [arg 3]


            _S_e_e _A_l_s_o

                 args  (1),  nargs  (1),  getarg  (2),  _U_s_e_r_'_s  _G_u_i_d_e _f_o_r _t_h_e
                 _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r
















            arg (1)                       - 1 -                       arg (1)


