

            prime (4) --- retrieve the 'i'th prime number            07/20/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 long_int function prime (i)
                 long_int i

          |      Library: vswtmath (Subsystem mathematical library)


            _F_u_n_c_t_i_o_n

                 'Prime'  is  used to retrieve a specified prime number.  The
                 argument is the ordinal of the prime  number  desired.   The
                 function return is the specified prime.  For example, if 'i'
                 is  1,  the  function return is 2; if 'i' is 3, the function
                 return is 5, etc.

                 'Prime'  uses  the  table  of  prime  numbers  in  the  file
                 "=aux=/primes".   This file contains the prime numbers up to
                 one   million   in   long-integer   binary    format.     If
                 "=aux=/primes"  is  unreadable or if 'i' is less than one or
                 greater than 78498, the function return is zero.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The  file  "=aux=/primes"  is  opened  for   reading.    The
                 read/write pointer for the file is then moved to the desired
                 location  and  the  prime  number  read.   The  file is then
                 closed.


            _C_a_l_l_s

                 open, close, mapfd, Primos prwf$$


            _B_u_g_s

                 Should probably raise cain if the prime numbers file is  not
                 available, rather than meekly returning zero.

                 Locally supported.
















            prime (4)                     - 1 -                     prime (4)


