

            block (3) --- convert text to block letters              01/13/83


            _U_s_a_g_e

                 block [ -c <char> ] [ -w <width> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Block'  reads  lines  of text from standard input, converts
                 them to large block letters, and  writes  them  on  standard
                 output.   Each character produced is 5 columns in width by 9
                 lines in height, with 2 blank  columns  between  consecutive
                 block letters and 3 blank lines between consecutive lines of
                 block letters.

                 The  character  used  to  construct the block letters may be
                 specified  with  the  "-c  <char>"  argument  sequence;  the
                 default character is an asterisk (*).  Similarly, the length
                 (in regular characters) of the lines produced by 'block' may
                 be  specified with the "-w <width>" sequence.  If omitted, a
                 default width of 75 columns is assumed.   Input  lines  that
                 will not fit on a single output line are broken into as many
                 consecutive lines as necessary.

                 Normally,  'block'  ignores  control characters in the input
                 stream.  The two exceptions to this rule are NEWLINEs, which
                 force a new output line, and BACKSPACEs, which may  be  used
                 to produce underlined, boldfaced or other overstruck charac-
                 ters.


            _E_x_a_m_p_l_e_s

                 echo "@n@n  In Use" | block
                 cal 1981 | block -w132 >/dev/lps


            _M_e_s_s_a_g_e_s

                 "Usage:  block ..."  for invalid argument syntax.


            _S_e_e _A_l_s_o

                 banner (1)














            block (3)                     - 1 -                     block (3)


