

            ucc (1) --- compile and load a C program (Unix-style)    10/10/84


          | _U_s_a_g_e

          |      ucc { <input_files> } [ <cc_opts> ] [ <compile_opts> ]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Ucc' is a "UNIX-style" C compiler and loader.  It does NOT,
          |      however,  behave  like  Unix's  'cc' or any other known Unix
          |      program!

          |      'Ucc'  compiles  and  loads  the  pathnames  specified.   It
          |      assumes  that  all  programs  require  C runtime support and
          |      loads them accordingly.

          |      'Ucc' recognizes the same set of options as 'cc'.  These are
          |      passed  as  C-specific  options  to  'compile'.   Any  other
          |      options  are passed on to 'compile' directly, which does the
          |      real work of recognizing suffixes and compiling and  loading
          |      the files appropriately.

          |      'Ucc' remains in existence mainly for compatibility with the
          |      first release of the C compiler.


          | _E_x_a_m_p_l_e_s

          |      ucc sort.c
          |      ucc sort.c -ud  # the -ud is automatically passed on to 'ld'
          |      ucc main.c lib.r lib.s -R-t


          | _B_u_g_s

          |      Has basically become obsolete.

          |      TTThhhiiisss  ppprrrooogggrrraaammm  iiisss ooonnnlllyyy aaavvvaaaiiilllaaabbbllleee tttooo llliiiccceeennnssseeeeeesss ooofff VVVeeerrrsssiiiooonnn 222...000
          |      ooofff ttthhheee GGGeeeooorrrgggiiiaaa TTTeeeccchhh CCC CCCooommmpppiiillleeerrr...


          | _S_e_e _A_l_s_o

          |      compile (1), cc (1), ccl (1), vcg (1),  ld  (1),  bind  (3),
          |      _U_s_e_r_'_s _G_u_i_d_e _f_o_r _t_h_e _G_e_o_r_g_i_a _T_e_c_h _C _C_o_m_p_i_l_e_r














            ucc (1)                       - 1 -                       ucc (1)


