

            entab (1) --- convert multiple blanks to tabs            03/20/80


            _U_s_a_g_e

                 entab { -t <tab character> |
                         <column number>    |
                         +<increment> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Entab' converts multiple blanks on its first standard input
                 into  an  equivalent  number of blanks and tab characters on
                 its  first  standard  output.   The  tab  character  may  be
                 specified  as  an  argument  with  the  "-t <tab character>"
                 argument sequence; otherwise,  the  ASCII  TAB  (ctrl-i)  is
                 used.

                 Any number of tab stops may be set by specifying the desired
                 column  numbers as arguments.  If the +<increment> construct
                 is used, stops will  be  set  at  intervals  of  <increment>
                 columns,  starting  with  the most recently set stop.  Thus,
                 the argument sequence

                           10 +5

                 would set stops in columns 10, 15, 20, etc.  In the  absence
                 of  any  other specification, default stops are set in every
                 fourth column, starting with column five.


            _E_x_a_m_p_l_e_s

                 prog.f> entab 7 >compressed_prog.f
                 term_paper> entab -t \


            _M_e_s_s_a_g_e_s

                 "Usage:  entab ..."  for incorrect arguments.


            _S_e_e _A_l_s_o

                 detab (1)















            entab (1)                     - 1 -                     entab (1)


