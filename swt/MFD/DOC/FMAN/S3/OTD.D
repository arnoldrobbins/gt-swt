

            otd (3) --- object text dumper                           09/10/84


          | _U_s_a_g_e

          |      otd <file_name>


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Otd'  is  a program that reads relocatable binary files and
          |      prints their contents in human-readable form.  It is  useful
          |      for  analyzing  the output of high level language compilers.
          |      You can use 'otd' to compare the quality of  two  compilers'
          |      code generation phases, or for debugging your own compilers.


          | _E_x_a_m_p_l_e_s

          |      otd hello.b


          | _M_e_s_s_a_g_e_s

          |      "usage:  otd ..."  if called with not arguments.

          |      "filename:  can't open" if it can't open the file.

          |      "bad  object  file"  for a an object file format it does not
          |      understand.

          |      "inconsistent block size"

          |      "unrecognized block type ..."

          |      "block size ...  exceeds buffer space"


          | _B_u_g_s

          |      Does not read its standard input  port  if  called  with  no
          |      arguments.


          | _S_e_e _A_l_s_o

          |      _V_C_G _U_s_e_r_'_s _G_u_i_d_e














            otd (3)                       - 1 -                       otd (3)


