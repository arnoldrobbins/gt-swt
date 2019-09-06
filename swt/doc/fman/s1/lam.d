

            lam (1) --- laminate lines from separate files           03/20/80


            _U_s_a_g_e

                 lam {-i<string> | <filename>}


            _D_e_s_c_r_i_p_t_i_o_n

                 'Lam'  is  used  to  combine multiple input streams into one
                 output stream by placing corresponding lines from each input
                 stream end-to-end.  For example, if STDIN1 contains

                      line #
                      line #

                 and STDIN2 contains

                      1
                      2

                 then the result of the command "lam" will be

                      line #1
                      line #2

                 If an input stream is shorter than the others, its contribu-
                 tion to the output is null once it reaches EOF.

                 The "-i" arguments may be used to insert  arbitrary  strings
                 into  the output stream, either before the lamination, after
                 it, or between any two files.  The  string  to  be  inserted
                 must  follow  the  "-i" immediately; it may not be placed in
                 the following argument.

                 If no arguments are given  on  the  command  line,  standard
                 input  1  is  laminated  to standard input 2, i.e.  "lam" is
                 equivalent to "lam /dev/stdin1 /dev/stdin2".  Otherwise,  at
                 least one file name argument must be supplied on the command
                 line.


            _E_x_a_m_p_l_e_s

                 file1> file2> lam >lamination
                 lam col1 -i\ col2 -i\ /dev/stdin1 | detab -t \
                 lam -i">>" file >junk


            _S_e_e _A_l_s_o

                 cat (1), tee (1), common (1), field (1), join (1), diff (1),
                 take (1), drop (1)







            lam (1)                       - 1 -                       lam (1)


