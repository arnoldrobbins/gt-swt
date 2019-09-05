

            link (1) --- build Ratfor linkage declaration            08/27/84


          | _U_s_a_g_e

                 link [-{f | m}] {-n<filename> | <filename>}


            _D_e_s_c_r_i_p_t_i_o_n

                 'Link'  creates  a llliiinnnkkkaaagggeee statement for the files specified
                 as arguments in the command line.  An identifier needs to be
                 in a llliiinnnkkkaaagggeee statement if it is longer than  six  characters
                 and it meets one of the following conditions:

                       1) The identifier is in an external statement.
                       2) The identifier is the name of a named common block.
                       3) The identifier is a subroutine name.
                       4) The identifier is a function name.

                 The  llliiinnnkkkaaagggeee  statement  produced  by  'link'  includes  all
                 identifiers which are of one of the four types above, regar-
                 dless  of  the  number  of  characters  in  the  identifier.
                 Because  of this, 'link' creates a list of all external sym-
                 bols for the modules of a given program as well as a llliiinnnkkkaaagggeee
                 statement.

                 The following options are available:


                      f    Suppress   automatic   inclusion    of    standard
                           definitions   file.   Macro  definitions  for  the
                           manifest constants used throughout  the  Subsystem
                           reside  in  the  file  "=incl=/swt_def.r.i".  'Rp'
                           will  process  these  definitions   automatically,
                           unless the "-f" option is specified.

                      m    Map  all  identifiers  to  lower  case.  When this
                           option is selected,  'link'  considers  the  upper
                           case letters equivalent to the corresponding lower
                           case letters, except inside quoted strings.

                      n    Read  file  names  from an input file until EOF is
                           reached.  'link' observes the  convention  that  a
                           "-n"  argument  implies  that file names are to be
                           read from an input  file  until  EOF  is  reached,
                           rather  than  simply from the argument list.  "-n"
                           implies the standard  port  STDIN,  "-n2"  implies
                           STDIN2,  "-n3"  implies  STDIN3,  and "-nfilename"
                           implies the named file.

                 The remainder  of  the  command  line  is  used  to  specify
                 filenames  which  are part of the program for which the llliiinnn-
                 kkkaaagggeee statement is being created.


            _E_x_a_m_p_l_e_s

                 link -nrpfiles


            link (1)                      - 1 -                      link (1)




            link (1) --- build Ratfor linkage declaration            08/27/84


                 link xref.r xref.sort xref.out


            _F_i_l_e_s

                 =temp=/tm?* for internal temporaries
                 =incl=/swt_def.r.i for standard Subsystem macro definitions


            _M_e_s_s_a_g_e_s

          |      See the _U_s_e_r_'_s _G_u_i_d_e _f_o_r _t_h_e _R_a_t_f_o_r  _P_r_e_p_r_o_c_e_s_s_o_r  for  more
                 information on linkage statements.


            _S_e_e _A_l_s_o

                 rp (1), sep (1), gfnarg (2)








































            link (1)                      - 2 -                      link (1)


