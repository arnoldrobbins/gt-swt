

            mklib (1) --- convert binary relocatable to a library    02/22/82


            _U_s_a_g_e

                 mklib <file>


            _D_e_s_c_r_i_p_t_i_o_n

                 'Mklib'   runs   the  Primos  EDB  program  to  convert  the
                 relocatable object code output from FTN, PMA, or other  com-
                 pilers  contained  in the file named <file>.b into a library
                 format file in the file named <file>.

                 For example,

                      mklib swtlib

                 would convert the contents of the file named "swtlib.b" into
                 library format and  write  the  result  on  the  file  named
                 "swtlib".


            _E_x_a_m_p_l_e_s

                 mklib swtlib


            _M_e_s_s_a_g_e_s

                 Several possible messages from EDB.


            _S_e_e _A_l_s_o

                 Primos EDB command
























            mklib (1)                     - 1 -                     mklib (1)


