

            brefs (5) --- print caller-callee pairs in an object file  01/03/83


            _U_s_a_g_e

                 brefs { <object file> | -n }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Brefs'  prints  the  precedence  relationships  between the
                 entry points that are defined and/or referenced  within  the
                 named  object  files.   Each  output line contains two entry
                 point names; the first is the name of  the  calling  routine
                 ($MAIN   for  Fortran  main  programs  or  unnamed  assembly
                 language routines), and the second is the name of an  exter-
                 nal  object  referenced  by  that  routine.  The output from
                 'brefs' is suitable for piping into 'tsort' to determine the
                 proper ordering for routines in a library.

                 If the "-n" argument appears in the place of an object  file
                 name,  'brefs'  will  obtain  names of object files from its
                 standard input.  For more information on  this  syntax,  see
                 the entry for 'cat' (1).


            _E_x_a_m_p_l_e_s

                 brefs ave.b ave_lib.b
                 brefs lib.b | tsort | bmerge lib.b >lib


            _M_e_s_s_a_g_e_s

                 "<object  file>:   can't open" if a non-existent or inacces-
                      sible file is specified.
                 "<object file>:  bad object file" if something other than an
                      object file is specified.
                 "block size exceeds buffer space"  if  the  object  file  is
                      badly formatted.


            _B_u_g_s

                 If  a  module has multiple entry points, only the last entry
                 point is recognized.


            _S_e_e _A_l_s_o

                 bmerge (5), bnames (5), ld (1), lorder (1), tsort (1)










            brefs (5)                     - 1 -                     brefs (5)


