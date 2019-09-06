

            fos (1) --- format, overstrike, and spool a document     12/16/81


            _U_s_a_g_e

                 fos [ <pathname> { <spool options> } ]


            _D_e_s_c_r_i_p_t_i_o_n

                 The  shell  program  'fos'  executes  the proper pipeline to
                 produce a formatted document on the line printer.  If called
                 with any arguments, the first argument must be the  file  to
                 be  formatted,  possibly followed by spooler options.  If no
                 arguments are supplied, then 'fos' will attempt to  use  the
                 'f'  variable  that is set by 'e' (if declared).  If the 'f'
                 variable is not declared, then an error message is  printed.
                 The spool options are any options acceptable to 'sp'.

                 'Fos'  can  take  only  one <pathname>, while 'fmt' can take
                 many.  To make 'fos' accept several names, one can type:

                      fos "file1 file2 file3"


            _E_x_a_m_p_l_e_s

                 fos report
                 fos book -c 1000


            _M_e_s_s_a_g_e_s

                 "Usage ..."   for  missing  pathname  argument  and  no  'f'
                      variable


            _S_e_e _A_l_s_o

                 e (1), sp (1), fmt (1), os (1)





















            fos (1)                       - 1 -                       fos (1)


