

            tail (1) --- print last n lines from standard input      01/09/82


            _U_s_a_g_e

                 tail [ <number of lines> ] [ <file> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Tail'  is  a filter that prints on standard output the last
                 few lines that it reads from standard input.  The number  of
                 lines  printed  may be specified as an integer argument; the
                 default value is twenty if none is  given.   Currently,  the
                 maximum  number  of  lines that can be printed is 300.  If a
                 number larger than this is specified, a value of 300 is used
                 and no error message is issued.

          |      If <number of lines> is preceded by  a  minus  sign,  'tail'
                 discards  the  first  <number of lines> lines from its input
                 file and copies the remainder to standard output.

                 If a file name is given as the second argument, 'tail' takes
                 its input from the named file instead of standard input.


            _E_x_a_m_p_l_e_s

                 log_file> tail 10
                 tail 10 log_file
                 lf -cw | sort | tail 5
                 listfile> tail -1
                 tail -1 listfile


            _B_u_g_s

                 For the single argument case, if argument is the string "0",
                 the program will read in the default number  of  lines  from
                 file "0".  If the single argument is a file name that starts
                 with  digits, those digits will be interpreted as the number
                 of lines to be read from standard input.

                 For the two argument case, if  the  first  argument  is  the
                 string  "0",  the second argument is ignored and a file name
                 of "0" is assumed.


            _S_e_e _A_l_s_o

                 slice (1)










            tail (1)                      - 1 -                      tail (1)


