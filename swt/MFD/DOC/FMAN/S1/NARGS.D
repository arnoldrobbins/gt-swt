

            nargs (1) --- print number of command file arguments     03/20/80


            _U_s_a_g_e

                 nargs [ <level_offset> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Nargs' prints the number of arguments supplied on a command
                 line  at  some  higher  level  of command file/function call
                 nesting.  It is most often used in a function call within  a
                 command  file  to determine the number of arguments supplied
                 to that same command file.

                 As with the 'arg' and 'args' commands,  <level  offset>  may
                 optionally  be  specified  to  indicate the number of higher
                 nesting levels to skip before counting.  In keeping with its
                 most frequent mode of usage, the default value  is  one,  so
                 that the nesting level corresponding to the function call is
                 ignored.


            _E_x_a_m_p_l_e_s

                 nargs 0
                 echo [nargs]


            _S_e_e _A_l_s_o

                 arg (1), args (1), getarg (2)




























            nargs (1)                     - 1 -                     nargs (1)


