

            vcgdump (1) --- display 'vcg' input files                10/10/84


          | _U_s_a_g_e

          |      vcgdump [ <path prefix> ]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Vcgdump'  displays  an  input  file intended for 'vcg' in a
          |      semi-readable format.  For a complete description  of  'vcg'
          |      see  the  _A  _R_e_-_U_s_a_b_l_e  _C_o_d_e  _G_e_n_e_r_a_t_o_r  _f_o_r _P_r_i_m_e _5_0_-_S_e_r_i_e_s
          |      _C_o_m_p_u_t_e_r_s _U_s_e_r_'_s _G_u_i_d_e.

          |      'Vcgdump' requires three input  files;  the  first  contains
          |      entry  points,  the second contains external definitions and
          |      the third  contains  the  intermediate  form  tree.   If  no
          |      argument is given, these files are read from standard inputs
          |      1,  2  and 3 respectively.  Otherwise, 'vcgdump' will append
          |      the suffixes ".ct1", ".ct2", and ".ct3" to <path prefix> and
          |      use these names for the input files.

          |      The output of 'vcgdump' is placed on standard output.


          | _E_x_a_m_p_l_e_s

          |      vcgdump temp | pg    # use temp.ct(1 2 3)
          |      p.ent> p.ext> p.tree> vcgdump | pr


          | _B_u_g_s

          |      TTThhhiiisss ppprrrooogggrrraaammm iiisss ooonnnlllyyy aaavvvaaaiiilllaaabbbllleee tttooo llliiiccceeennnssseeeeeesss ooofff  VVVeeerrrsssiiiooonnn  222...000
          |      ooofff ttthhheee GGGeeeooorrrgggiiiaaa TTTeeeccchhh CCC CCCooommmpppiiillleeerrr...


          | _S_e_e _A_l_s_o

          |      cc  (1),  ccl  (1),  ucc  (1),  vcg  (1),  _A  _R_e_-_U_s_a_b_l_e _C_o_d_e
          |      _G_e_n_e_r_a_t_o_r _f_o_r _P_r_i_m_e _5_0_-_S_e_r_i_e_s _C_o_m_p_u_t_e_r_s _U_s_e_r_'_s _G_u_i_d_e



















            vcgdump (1)                   - 1 -                   vcgdump (1)


