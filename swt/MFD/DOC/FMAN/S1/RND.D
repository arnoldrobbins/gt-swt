

            rnd (1) --- generate random numbers                      03/20/80


            _U_s_a_g_e

                 rnd  { -l <lower> | -u <upper> | -n <number> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Rnd' may be used to generate one or more pseudo-random num-
                 bers,  uniformly distributed over a given range of integers.
                 The arguments specify the range and number of  pseudo-random
                 integers to be generated.

                 The  "-l"  and  "-u" options set the lower and upper bounds,
                 respectively, of the range.  The default values  are  1  for
                 the  lower  bound  and  100  for  the upper bound.  The "-n"
                 option  controls  the  number  of  integers  generated;  the
                 default is 1.


            _E_x_a_m_p_l_e_s

                 rnd
                 rnd -n 10 | stats -tq
                 rnd -u 10
                 rnd -l -5 -u 5


            _B_u_g_s

                 Round-off  error  may make this program not quite uniform in
                 the long run.


            _S_e_e _A_l_s_o

                 'rnd' function in Fortran library






















            rnd (1)                       - 1 -                       rnd (1)


