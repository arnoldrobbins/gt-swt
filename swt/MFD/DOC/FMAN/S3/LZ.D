

            lz (3) --- post process 'fmt' output for laser printer   10/24/84


          | _U_s_a_g_e

          |      lz [-i] [-l <page_size>]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Lz'  post  processes  output  from 'fmt' for the Xerox 9700
          |      laser printer owned by the Georgia Tech Office of  Computing
          |      Services.   In  particular, it outputs the necessary control
          |      statements to get  actual  boldfacing  and  italics.   _T_h_e_s_e
          |      _c_o_n_t_r_o_l _s_t_a_t_e_m_e_n_t_s _a_r_e _G_e_o_r_g_i_a _T_e_c_h _s_p_e_c_i_f_i_c.

          |      The  'fmt'  input  files  should  expect  a page that is 100
          |      columns  wide  by  87  lines  down.    The   laser   printer
          |      automatically supplies 1/2 inch margins on all sides, so the
          |      ...mmm111   through   ...mmm444   values   in   'fmt'  need  to  be  set
          |      appropriately, as well as the page and margin  offsets,  and
          |      the left and right margins.

          |      'Lz'  does  actual  underlining for text that is underlined.
          |      If the '-i' option is supplied, 'lz' will  print  underlined
          |      text in italics, instead.

          |      The  length  of  the  output page can be given with the '-l'
          |      option.  'Lz' defaults to 87 lines per page.


          | _E_x_a_m_p_l_e_s

          |      fmt =fmac=/evl =doc=/guide/ed | lz >file_for_xerox


          | _M_e_s_s_a_g_e_s

          |      "Usage:  lz ..."  for improper arguments.


          | _B_u_g_s

          |      Locally supported.


          | _S_e_e _A_l_s_o

          |      fmt (1), os (1), =fmac=/evl, =fmac=/evl2












            lz (3)                        - 1 -                        lz (3)


