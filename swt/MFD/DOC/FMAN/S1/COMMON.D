

            common (1) --- print lines common to two sorted files    03/20/80


            _U_s_a_g_e

                 common [ -{1 | 2 | 3} ] [ <file1> [ <file2> ] ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Common'  prints  the  lines common to two sorted files.  It
                 normally produces  three  columns  of  output:   Column  one
                 contains  lines  present  in  <file1>  but  not  present  in
                 <file2>; column two contains lines present  in  <file2>  but
                 not  in  <file1>;  and column three contains lines common to
                 both files.

                 The first argument may be used to select the columns  to  be
                 printed.  A dash followed by a "1" selects the first column,
                 a  dash  followed  by "12" selects columns one and two, etc.
                 For example, to print lines in the second file  or  in  both
                 files  (i.e.  columns two and three), the argument should be
                 "-23".

                 If the second file name argument is omitted, the first stan-
                 dard input is used for <file2>; if no <file >name  arguments
                 appear,  the  first  and second standard inputs will be used
                 for <file1> and <file2> respectively.


            _E_x_a_m_p_l_e_s

                 lf -c =bin= | sort >file1;
                    lf -c =doc=/fman/s1 | sort >file2;
                       common -1 file1 file2

                 common -1 wordlist =dictionary=


            _M_e_s_s_a_g_e_s

                 "Usage:  common ..."  for illegal arguments.


            _S_e_e _A_l_s_o

                 diff (1), sort (1), lf (1)














            common (1)                    - 1 -                    common (1)


