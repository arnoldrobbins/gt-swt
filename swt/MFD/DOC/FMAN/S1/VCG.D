

            vcg (1) --- Prime V-mode code generator                  10/22/84


          | _U_s_a_g_e

          |      vcg [-m <module>] [-b [<path>]] [-s [<path>]]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Vcg'  is  a  reusable, general purpose code generator which
          |      accepts a linearized intermediate form  tree  and  generates
          |      either  64V-mode object text or PMA or both.  For a complete
          |      description of 'vcg' see the _V_C_G _U_s_e_r_'_s _G_u_i_d_e.

          |      'Vcg' requires three input files; the first  contains  entry
          |      points,  the  second  contains  external definitions and the
          |      third contains the intermediate form tree.

          |      If given, the  "-m"  argument  specifies  the  name  of  the
          |      <module>  to  which  'vcg'  will append the suffixes ".ct1",
          |      ".ct2", and ".ct3" for the three  input  files.   Otherwise,
          |      'vcg' expects the three input files to be on its three stan-
          |      dard input ports.

          |      The following command line options are available:

          |         -b   Generate   'ld'-compatible   object  text  directly.
          |              'Vcg' generates object text by default and places it
          |              in the file "<path>".  If <path> is  not  specified,
          |              but a <module> name is given with the "-m" argument,
          |              'vcg'  will  place  the  object  text  in  the  file
          |              "<module>.b".  Otherwise, 'vcg' will print an  error
          |              message and exit.

          |         -s   Generate  assembly  code.   'Vcg' will produce Prime
          |              Macro Assembly Language (PMA) and place  it  in  the
          |              file "<path>".  Object text generation is suppressed
          |              unless the "-b" command line flag is also specified.
          |              If  <path>  is not specified, but a <module> name is
          |              given with the "-m" argument, 'vcg' will  place  the
          |              PMA in the file "<module>.s".  Otherwise, 'vcg' will
          |              simply  write  the  PMA on its first standard output
          |              port.

          |         -m   Specify input and output module names.  This  option
          |              was discussed above.

          |         In  general,  the  user  should  not  invoke this command
          |         directly.  Rather, 'vcg' should be called via one of  the
          |         compiler interludes, like 'cc'.


          |    _E_x_a_m_p_l_e_s

          |         vcg -m temp # use temp.ct(1 2 3)
          |         p.ent> p.ext> p.tree> vcg -s  # write PMA to stdout




            vcg (1)                       - 1 -                       vcg (1)




            vcg (1) --- Prime V-mode code generator                  10/22/84


          |    _M_e_s_s_a_g_e_s

          |         Numerous, but sometimes opaque.


          |    _B_u_g_s

          |         'Vcg'   expects  correctly  formed  input.   When  it  is
          |         presented with something else, it usually manages to com-
          |         plain, but it may either die or blithely  emit  incorrect
          |         code.  The major problem in dealing with 'vcg' is that it
          |         is often not easy to tell what part of the input is caus-
          |         ing the difficulty.

          |         TTThhhiiisss  ppprrrooogggrrraaammm  iiisss  ooonnnlllyyy aaavvvaaaiiilllaaabbbllleee tttooo llliiiccceeennnssseeeeeesss ooofff VVVeeerrrsssiiiooonnn
          |         222...000 ooofff ttthhheee GGGeeeooorrrgggiiiaaa TTTeeeccchhh CCC CCCooommmpppiiillleeerrr...


          |    _S_e_e _A_l_s_o

          |         cc (1), ccl (1), ucc (1), vcgdump (1), _A  _R_e_-_U_s_a_b_l_e  _C_o_d_e
          |         _G_e_n_e_r_a_t_o_r  _f_o_r  _P_r_i_m_e  _5_0_-_S_e_r_i_e_s  _C_o_m_p_u_t_e_r_s _U_s_e_r_'_s _G_u_i_d_e,
          |         _U_s_e_r_'_s _G_u_i_d_e _f_o_r _t_h_e _G_e_o_r_g_i_a _T_e_c_h _C _C_o_m_p_i_l_e_r



































            vcg (1)                       - 2 -                       vcg (1)


