

            radix (1) --- change radix of numbers                    08/07/81


            _U_s_a_g_e

                 radix [ -i <input radix> ] [ -o <output radix> ] { <number> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Radix'  is  a  simple  tool  that converts numbers from one
                 radix representation to another.  The "-i" option  specifies
                 the default input radix.  (This radix can be overridden with
                 the  "<radix>r<number>"  notation accepted by 'gctol').  The
                 "-o" option specifies the output radix.  If either is  omit-
                 ted, 10 is assumed.

                 The numbers specified as arguments are converted to the out-
                 put  radix  and  printed  on standard output, one number per
                 line.  If no <number> arguments are specified, 'radix' reads
                 numbers from standard input (one per line),  converts  them,
                 and writes them on standard output (one per line).

                 If  an  illegal character is encountered in a number, it and
                 all following characters in the number are ignored.


            _E_x_a_m_p_l_e_s

                 radix 8r177
                 radix -i10 -o2 39 12 5
                 radix -i 16


            _M_e_s_s_a_g_e_s

                 "Usage:  radix ..."  for invalid argument syntax.


            _S_e_e _A_l_s_o

                 gctol (2)



















            radix (1)                     - 1 -                     radix (1)


