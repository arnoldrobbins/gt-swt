

            ccl (1) --- compile and load a C program                 10/10/84


          | _U_s_a_g_e

          |      ccl [<pathname>] [<'ld' args>] [/ <'cc' args>]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Ccl'  is  a  shell  program  that  compiles and loads the C
          |      program  in  <pathname>.   If  'ccl'  is  invoked  with   no
          |      <pathname>  argument,  it  automatically  processes the last
          |      program edited, since it shares the shell variable 'f'  with
          |      the shell program 'e'.  If the source file name specified in
          |      <pathname>  does not have a ".c" suffix, 'ccl' will append a
          |      ".c" and attempt to process a file with that name.  The ".c"
          |      suffix on the source file name  is  not  required,  although
          |      'ccl'  requires  that the source code reside in a file named
          |      with a ".c"  suffix.   The  executable  code  is  stored  in
          |      <pathname>,  or  a file named appropriately from <'ld' args>
          |      (e.g., "-o gorf") or from <'cc' args> (e.g., "-b bonzo").

          |      Options for 'ld' (names of libraries, for example) may  fol-
          |      low  the name of the source file, e.g.  "ccl prog -l mylib".
          |      Special options for  'cc'  may  be  placed  after  the  'ld'
          |      options,  as  long  as  they  are  separated  by an argument
          |      consisting only of a slash; for example, "ccl prog -l  mylib
          |      / -f".  Aberrent command syntax may produce bizarre results.


          | _E_x_a_m_p_l_e_s

          |      ccl      # cc and ld the last file edited with 'e'

          |      ccl profile
          |      ccl profile.c

          |      ccl change -l mylib


          | _M_e_s_s_a_g_e_s

          |      "<source_file>:  can't open" for missing ".c" file


          | _B_u_g_s

          |      TTThhhiiisss  ppprrrooogggrrraaammm  iiisss ooonnnlllyyy aaavvvaaaiiilllaaabbbllleee tttooo llliiiccceeennnssseeeeeesss ooofff VVVeeerrrsssiiiooonnn 222...000
          |      ooofff ttthhheee GGGeeeooorrrgggiiiaaa TTTeeeccchhh CCC CCCooommmpppiiillleeerrr...


          | _S_e_e _A_l_s_o

          |      compile (1), cc (1), vcg (1), ld (1), ucc (1), c1 (5),  bind
          |      (3), _U_s_e_r_'_s _G_u_i_d_e _f_o_r _t_h_e _G_e_o_r_g_i_a _T_e_c_h _C _C_o_m_p_i_l_e_r





            ccl (1)                       - 1 -                       ccl (1)


