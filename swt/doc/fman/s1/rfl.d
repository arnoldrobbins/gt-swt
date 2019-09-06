

            rfl (1) --- command file to rp, fc, and ld a Ratfor program  01/16/83


            _U_s_a_g_e

                 rfl [<file.r> [<ld_args>] [/ [<rp_args>] [/ [<fc_args>]]]]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Rfl'  is  a  shell program that causes the specified Ratfor
                 program to be preprocessed, compiled and loaded.  The source
                 file is expected to be  named  <program>.r  and  the  output
                 object  code  is named <program>.  A check is made to verify
                 the existence of the source program; if it is  not  present,
                 processing is discontinued.

                 A  few  examples  may clarify the (somewhat obscure) command
                 syntax.

                 'Rfl' shares the shell variable 'f' with the  shell  program
                 'e';  thus one may compile the last program edited simply by
                 typing "rfl" with no arguments.  If the source file is to be
                 named explicitly, it follows the "rfl" (e.g.  "rfl file.r").
                 The ".r" suffix on the source file  name  is  not  required,
                 although  'rfl'  requires  that  the source code reside in a
                 file named with a ".r" suffix; thus one may write "rfl file"
                 to compile the contents of "file.r".

                 Options for 'ld' (names of libraries, for example) may  fol-
                 low the name of the source file, e.g.  "rfl prog -l vthlib".
                 Special  options  for  'rp'  may  be  placed  after the 'ld'
                 options, as long  as  they  are  separated  by  an  argument
                 consisting only of a slash; for example, "rfl prog -l vthlib
                 /  -c".   Finally,  options for 'fc' may be placed after the
                 'rp' options, as long as the two groups are separated  by  a
                 slash.  Example:  "rfl prog -l vthlib / -c / -t".


            _E_x_a_m_p_l_e_s

                 rfl      # ratfor, fortran, and load the last file edited

                 rfl profile
                 rfl profile.r

                 rfl sol -l vthlib

                 rfl rsa -l vswtml / -t / -t -l rsa.list


            _M_e_s_s_a_g_e_s

                 "<source_file>:  can't open" for missing ".r" file
                 "no source file" for missing file name and no 'f' variable






            rfl (1)                       - 1 -                       rfl (1)




            rfl (1) --- command file to rp, fc, and ld a Ratfor program  01/16/83


            _S_e_e _A_l_s_o

                 rp (1), fc (1), fcl (1), ld (1)























































            rfl (1)                       - 2 -                       rfl (1)


