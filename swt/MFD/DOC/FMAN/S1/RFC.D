

            rfc (1) --- command file to rp and fc a Ratfor program   08/21/84


          | _U_s_a_g_e

          |      rfc <file.r> [ [<rp_args>] [/ [<fc_args>]]]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Rfc'  is  a  shell program that causes the specified Ratfor
          |      program to be preprocessed and compiled, but not loaded.  It
          |      is useful for rebuilding single modules  in  a  multi-module
          |      program.    The   source   file  is  expected  to  be  named
          |      <program>.r and the output object code is named <program>.b.
          |      A check is made  to  verify  the  existence  of  the  source
          |      program; if it is not present, processing is discontinued.

          |      The  ".r"  suffix  on  the source file name is not required,
          |      although 'rfc' requires that the source  code  reside  in  a
          |      file named with a ".r" suffix; thus one may write "rfc file"
          |      to compile the contents of "file.r".

          |      Special  options for 'rp' may be placed after the file name.
          |      Options for 'fc' may be placed after the  'rp'  options,  as
          |      long  as  the two groups are separated by a slash.  Example:
          |      "rfc prog -a / -c".


          | _E_x_a_m_p_l_e_s

          |      rfc profile.r
          |      rfc profile

          |      rfc stuff.r / -do0q


          | _M_e_s_s_a_g_e_s

          |      "<source_file>:  can't open" for missing ".r" file
          |      "Usage:  rfc ..."  for no arguments


          | _S_e_e _A_l_s_o

          |      rp (1), fc (1), fcl (1), ld (1), rfl (1)















            rfc (1)                       - 1 -                       rfc (1)


