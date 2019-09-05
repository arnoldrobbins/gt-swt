

            detab (1) --- convert tabs to multiple spaces            02/22/82


            _U_s_a_g_e

                 detab { -t <tab character>       |
                         -r <replacement string>  |
                         <column number>          |
                         +<increment> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Detab'  expands  tab characters on its first standard input
                 file into an equivalent number of replacement characters  on
                 its first standard output file.

                 The  tab character may be specified by an argument following
                 the "-t" option; if not so specified, the ASCII TAB (ctrl-i)
                 is assumed.  Similarly, the string  from  which  replacement
                 characters are taken may be specified using the "-r" option.
                 Replacement  characters are taken as needed from the string,
                 starting with the first and wrapping around to the beginning
                 when the end of the string is reached.   If  no  replacement
                 string is specified, a single blank is assumed.

                 Any number of tab stops may be set by specifying the desired
                 column   number  as  an  argument.   If  the  "+<increment>"
                 construct is  used,  stops  will  be  set  at  intervals  of
                 <increment>  columns,  starting  with  the most recently set
                 stop.  Thus, the argument sequence

                           10 +5

                 would set stops in columns 10, 15, 20, etc.  In the  absence
                 of  any  other specification, default stops are set in every
                 fourth column, starting with column five.


            _E_x_a_m_p_l_e_s

                 file1> detab 21 36 41 66 -r " ." >file2
                 cat subr1 subr2 subr3 | detab +3 >prog.r
                 assembler.s> detab -t \ 10 20 35 >asm.s


            _M_e_s_s_a_g_e_s

                 "Usage:  detab ..."  for incorrect arguments.


            _S_e_e _A_l_s_o

                 entab (1)







            detab (1)                     - 1 -                     detab (1)


