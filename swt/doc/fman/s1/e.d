

            e (1) --- invoke proper editor for current terminal      07/24/84


          | _U_s_a_g_e

                 e  [ <filename> { <se options> } ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'E'  is  a shell file used to invoke the proper editor ('ed'
                 or 'se') for a given terminal.  In addition, 'e' will remem-
                 ber the name of the last file edited, and reuse that name if
                 none is specified on the command line.

                 'E' will make use of the variables 'f'  and  'se_params'  if
                 the  user  has  declared them at the terminal level.  'F' is
                 used  to  store  the  name  of   the   last   file   edited;
                 consequently,  the  user  need  only type the command "f" to
                 have that  name  printed.   'Se_params'  is  used  to  store
                 personally-preferred  instructions for the initialization of
                 'se', such as the choice between absolute and relative  line
                 numbers, case mapping, etc.  It may be any sequence of legal
                 'se'   arguments,   separated   by   blanks.    Furthermore,
                 additional screen editor options may be selected by  includ-
                 ing  them  on  the  'e'  command  line  after  the file name
                 argument.  If either 'f' or 'se_params' is not  declared  at
                 lexic level 0, 'e' will assume that they are empty.

                 'E'  selects  the  proper  editor  to  invoke by calling the
                 'term_type' command to see if the screen editor supports the
                 current terminal type.


            _E_x_a_m_p_l_e_s

                 e time_sheet
                 e


            _M_e_s_s_a_g_e_s

                 None from 'e', but several may result from  the  editors  or
                      the shell.


          | _B_u_g_s

          |      Since 'se' knows about users' terminal types, and since 'se'
          |      now reads personal commands in =home=/.serc, this command is
          |      pretty much obsolete.


            _S_e_e _A_l_s_o

                 ed (1), se (1), if (1), term_type (1)





            e (1)                         - 1 -                         e (1)


