

            error (1) --- output error message, return error code    03/20/80


            _U_s_a_g_e

                 error [ -<error_code> ]  { <arbitrary_string> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Error'  is  used in shell programs to announce the presence
                 of an error condition and return an error code.  The  option
                 argument  specifies  the error code returned; the default is
                 1000 (identical to the  value  returned  by  the  subprogram
                 'error').   The  arguments  specified are written to ERROUT,
                 separated by spaces and terminated by a NEWLINE.


            _E_x_a_m_p_l_e_s

                 error File not found.
                 error -1 "Attention: your program has just been destroyed"


            _B_u_g_s

                 Probably should understand escape sequences, like 'echo'.


            _S_e_e _A_l_s_o

                 echo (1), error (2), seterr (2)





























            error (1)                     - 1 -                     error (1)


