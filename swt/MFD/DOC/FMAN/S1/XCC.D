

            xcc (1) --- compile a C program with Prime compiler      08/27/84


          | _U_s_a_g_e

          |      xcc <pathname> [-c] [-b[<b_pathname>]] [-l[<l_pathname>]]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Xcc'  compiles  the  C program in <pathname> with Prime's C
          |      compiler.  The ".c"  suffix  on  the  source  file  name  is
          |      optional,  although  'xcc'  requires  that  the  source code
          |      reside in a file named with a ".c" suffix.   If  the  source
          |      file  name  specified  in  <pathname>  does  not have a ".c"
          |      suffix, 'xcc' will append a ".c" and attempt  to  process  a
          |      file   with  that  name.   The  object  code  is  stored  in
          |      "<pathname>.b".  If the "-b" command-line argument specifies
          |      <b_pathname>, 'xcc' stores the object code in  a  file  with
          |      that name.

          |      A  full description of the C language is beyond the scope of
          |      this document.  For complete information,  refer  to  _T_h_e  _C
          |      _P_r_o_g_r_a_m_m_i_n_g  _L_a_n_g_u_a_g_e  by  Brian W.  Kernighan and Dennis M.
          |      Ritchie (Prentice-Hall, 1978).

          |      The following options are available:

          |           -b   Compile the source code into the object file named
          |                "<b_pathname>".  'Xcc' places the object code into
          |                the  file  "<pathname>.b"  if   this   option   or
          |                <b_pathname> is unspecified.

          |           -c   Invoke the "-CHECKOUT" option.  This option causes
          |                the  compiler  to  parse  the  source code without
          |                producing object code.  This option suppresses the
          |                "-b" and "-l" options.

          |           -l   Produce a listing in  the  file  "<l_pathname>.l".
          |                If  <l_pathname>  is unspecified, 'xcc' places the
          |                listing in the file named "<pathname>.l".


          | _E_x_a_m_p_l_e_s

          |      xcc file.c
          |      xcc prog.c -l prog_list -b bonzo.b
          |      xcc test.c -c -l


          | _M_e_s_s_a_g_e_s

          |      Numerous and self-explanatory.


          | _B_u_g_s

          |      There is no way to tell Prime C programs about the  Subsytem
          |      standard input/output ports.


            xcc (1)                       - 1 -                       xcc (1)




            xcc (1) --- compile a C program with Prime compiler      08/27/84


          |      Does  not  give full access to the all the options available
          |      with Prime's C compiler.


          | _S_e_e _A_l_s_o

          |      ld (1), xccl (1), bind (3)



















































            xcc (1)                       - 2 -                       xcc (1)


