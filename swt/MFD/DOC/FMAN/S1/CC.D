

            cc (1) --- compile a C program                           10/10/84


          | _U_s_a_g_e

          |      cc [<pathname>] [-afy]
          |                      {-D<name>[=<val>] | -I<dir>}
          |                      [-b[<b_pathname>]]
          |                      [-s[<s_pathname>]]
          |                      [-u<u_number>]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Cc'  compiles  the C program in <pathname>.  It is an error
          |      to invoke 'cc' without a path name.  The ".c" suffix on  the
          |      source  file  name  is optional, although 'cc' requires that
          |      the source code reside in a file named with a  ".c"  suffix.
          |      If  the  source  file  name specified in <pathname> does not
          |      have a ".c" suffix, 'cc' will append a ".c" and  attempt  to
          |      process a file with that name.  The object code is stored in
          |      "<pathname>.b".

          |      A  full description of the C language is beyond the scope of
          |      this document.  For complete information,  refer  to  _T_h_e  _C
          |      _P_r_o_g_r_a_m_m_i_n_g  _L_a_n_g_u_a_g_e  by  Brian W.  Kernighan and Dennis M.
          |      Ritchie (Prentice-Hall, 1978).

          |      The following options are available:

          |           -a   Abort all active shell programs if any errors were
          |                encountered during  processing.   This  option  is
          |                useful  in  shell programs like 'ccl' that wish to
          |                inhibit  compilation  and  loading  if  processing
          |                failed.   By default, this option is not selected;
          |                that is, errors in  processing  do  not  terminate
          |                active shell programs.

          |           -b   Compile the source code into the object file named
          |                "<b_pathname>".   'Cc'  effectively  ignores  this
          |                option if <b_pathname> is unspecified.

          |           -f   Suppress   automatic   inclusion    of    standard
          |                definitions   file.    Macro   and   common  block
          |                definitions for the C  Standard  I/O  Library  and
          |                interfacing  with the Subsystem reside in the file
          |                "=cdefs=".  'Cc' will  process  these  definitions
          |                automatically,   unless   the   "-f"   option   is
          |                specified.

          |           -s   Compile the source code  into  a  PMA  file  named
          |                "<s_pathname>".  The object code will be left in a
          |                file  named "<s_pathname>.b" (".s" suffix replaced
          |                by ".b").  If <s_pathname> is not specified,  'cc'
          |                places  the  compiler output in "<pathname>.s" and
          |                the  object   module   in   "<pathname>.b".    The
          |                "<s_pathname>"  will over-ride any path name given
          |                to the "-b" option.  In addition, 'cc' will _a_l_w_a_y_s
          |                use 'vcg' to generate binary.


            cc (1)                        - 1 -                        cc (1)




            cc (1) --- compile a C program                           10/10/84


          |           -u   Reserved.

          |           -y   Check for  potential  problems,  e.g.   type  mis-
          |                matches.   (This is similar in purpose to the Unix
          |                'lint' program.)

          |           -D   Defines  the  identifier  <name>   with   optional
          |                <value> for program internal use (maximum of 10).

          |           -I   Specifies  a  directory where include files reside
          |                (maximum of 10).  All "-I" directories  are  sear-
          |                ched   after  the  current  directory  and  before
          |                "=incl=".


          | _E_x_a_m_p_l_e_s

          |      cc file.c
          |      cc prog.c -af


          | _M_e_s_s_a_g_e_s

          |      Numerous and self-explanatory.


          | _B_u_g_s

          |      The "-a" flag doesn't always work yet.

          |      The "-y" option complains about many  things  that  are  not
          |      problems.  For instance, it does not know about the run-time
          |      library.

          |      TTThhhiiisss  ppprrrooogggrrraaammm  iiisss ooonnnlllyyy aaavvvaaaiiilllaaabbbllleee tttooo llliiiccceeennnssseeeeeesss ooofff VVVeeerrrsssiiiooonnn 222...000
          |      ooofff ttthhheee GGGeeeooorrrgggiiiaaa TTTeeeccchhh CCC CCCooommmpppiiillleeerrr...


          | _S_e_e _A_l_s_o

          |      compile (1), ccl (1), ld (1), ucc (1), vcg (1), bind (3), c1
          |      (5), _U_s_e_r_'_s _G_u_i_d_e _f_o_r _t_h_e _G_e_o_r_g_i_a _T_e_c_h _C _C_o_m_p_i_l_e_r
















            cc (1)                        - 2 -                        cc (1)


