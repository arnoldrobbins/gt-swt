

            basename (1) --- select part of a pathname               02/22/82


            _U_s_a_g_e

                 basename [-(b | f | s | d | g)] { <pathname> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Basename'  is  the  function that knows about the syntax of
                 pathnames and can select various portions of the name  based
                 on  its  arguments.   It  obtains  input  pathnames from its
                 argument list, or from standard input if  no  arguments  are
                 specified,  and  prints  the selected components on standard
                 output.  Options control the portion of the file name selec-
                 ted as follows:

                       _O_p_t_i_o_n                 _S_e_l_e_c_t_s
                 
                    -b or none        the base file name only
                        -s            the file suffix only
                        -d            the directory path only
                        -f            the directory path and file name
                        -g            the file name and suffix only


            _M_e_s_s_a_g_e_s

                 "Usage:  basename ..."  for bogus arguments.


            _E_x_a_m_p_l_e_s

                 basename -s myprog.plg
                 cd [basename -d [file]]; [basename -g [file]]
                 ld [basename [file]].b -o [basename [file]]


            _S_e_e _A_l_s_o

                 take (1), drop (1), rot (1)



















            basename (1)                  - 1 -                  basename (1)


