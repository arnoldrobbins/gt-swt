

            wallclock (3) --- tell the time in a big way             08/30/84


          | _U_s_a_g_e

          |      wallclock [ <delay> [ <fill_char> ]]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Wallclock'  is  a  program  which  uses the CRT as a rather
          |      large (and expensive) digital display timepiece.  It  prints
          |      out  the time that the "clock" was started, in small charac-
          |      ters, and then  every  <delay>  seconds  (default  is  one),
          |      updates the current time, in large characters.

          |      The  characters  will  be  made  up of "*"s, unless the user
          |      cares to specify an alternate character in <fill_char>.

          |      To stop the clock, use the BREAK key, or type a control-p.


          | _E_x_a_m_p_l_e_s

          |      wallclock
          |      wallclock 5
          |      wallclock 10 $


          | _S_e_e _A_l_s_o

          |      clock (1), vt?* routines (2)





























            wallclock (3)                 - 1 -                 wallclock (3)


