

            cck1 (5) --- First phase of C program checker            10/10/84


          | _U_s_a_g_e

          |      cck1


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Cck1'  is  the  first  phase  of  the UNIX (tm) 'lint' like
          |      facility provided by the Georgia Tech Software Tools C  com-
          |      piler.   This program is normally not called directly by the
          |      user, but instead via one of the C compiler interludes, with
          |      the '-y' option.

          |      'Cck1' reads a '.ck' file on its first standard  input,  and
          |      produces  output which should be sorted and passed on to the
          |      second phase, 'cck2'.

          |      The '.ck' file is produced automatically by  'c1'  when  the
          |      '-y'  option  is  passed  on  to it from one of the compiler
          |      interludes.


          | _E_x_a_m_p_l_e_s

          |      prog.ck> cck1 | sort | cck2


          | _F_i_l_e_s

          |      ?*.ck file output by 'c1' with  the  '-y'  option,  used  as
          |      input to 'cck1'.


          | _M_e_s_s_a_g_e_s

          |      "Too many nesting levels"

          |      "Nesting stack overflow"


          | _B_u_g_s


          |      TTThhhiiisss  ppprrrooogggrrraaammm  iiisss ooonnnlllyyy aaavvvaaaiiilllaaabbbllleee tttooo llliiiccceeennnssseeeeeesss ooofff VVVeeerrrsssiiiooonnn 222...000
          |      ooofff ttthhheee GGGeeeooorrrgggiiiaaa TTTeeeccchhh CCC CCCooommmpppiiillleeerrr...


          | _S_e_e _A_l_s_o

          |      cc (1), ccl (1), ucc (1), c1 (5), cck2 (5), _U_s_e_r_'_s _G_u_i_d_e  _t_o
          |      _t_h_e _G_e_o_r_g_i_a _T_e_c_h _C _C_o_m_p_i_l_e_r







            cck1 (5)                      - 1 -                      cck1 (5)


