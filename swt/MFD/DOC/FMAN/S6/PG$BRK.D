

            pg$brk (6) --- catch a break for the page subroutine     07/19/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      subroutine pg$brk (cp)
          |      long_int cp


          | _F_u_n_c_t_i_o_n

          |      'Pg$brk' is used by the 'page' subroutine to catch the QUIT$
          |      condition and return to a set place within it.

          |      The user should not call this routine directly.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      'Pg$brk' simply calls 'pl1$nl' with the 'Rtlabel' array from
          |      the Software Tools common block.  This was previously set to
          |      the proper label to return to.


          | _C_a_l_l_s

          |      Primos pl1$nl


          | _S_e_e _A_l_s_o

          |      page (2)





























            pg$brk (6)                    - 1 -                    pg$brk (6)


