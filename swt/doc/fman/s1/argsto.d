

            argsto (1) --- print command file arguments              04/28/80


            _U_s_a_g_e

                 argsto <delim> [<num> [<start> [<level_offset>]]]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Argsto'  is  used  from  within  a shell program to print a
                 group of  arguments  specified  on  the  command  line  that
                 invoked  that  shell  program.  'Argsto' prints the group of
                 arguments delimited by arguments consisting  of  the  string
                 <delim>.   <Num>  is an integer that controls which group of
                 arguments  is  printed.   If  <number>  is  0  or   omitted,
                 arguments up to the first occurrence of <delim> are printed;
                 if <number> is 1, arguments between the first occurrence and
                 second  occurrence  of  <delim>  are  printed,  and  so  on.
                 <Start> is an integer indicating the argument at  which  the
                 scan  is to begin; if <start> is omitted (or is 1), the scan
                 begins at the first argument.

                 <Level_offset> is used to specify the number  of  levels  of
                 nested  input  files  and/or  function  calls that are to be
                 skipped before fetching the specified  argument  string.   A
                 value of zero means fetch the argument from the first higher
                 nesting level; one means skip one level to the second higher
                 level,  etc.  The strings thus obtained are printed on stan-
                 dard output 1, followed by a newlines.

                 Since 'argsto' is typically used in a function call within a
                 shell program, the default value of <level offset>  is  one,
                 so  that  the  level  corresponding  to the function call is
                 skipped and the shell program arguments are accessed.


            _E_x_a_m_p_l_e_s

                 rp [argsto / 2]
                 fc [argsto / 1]


            _S_e_e _A_l_s_o

                 args (1), nargs  (1),  getarg  (2),  _U_s_e_r_'_s  _G_u_i_d_e  _f_o_r  _t_h_e
                 _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r














            argsto (1)                    - 1 -                    argsto (1)


