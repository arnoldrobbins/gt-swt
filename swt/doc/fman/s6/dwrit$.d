

            dwrit$ (6) --- write raw characters to disk              02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function dwrit$ (buf, nwx, f)
                 integer buf (ARB), nwx, f

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Dwrit$'  is an internal Subsystem routine that performs the
                 function  of  'writef'  for  disk  files  only.   The  first
                 argument  is  the  array of words to be written to the file;
                 the second argument is the number of words  to  be  written;
                 the  third  argument  is  the file descriptor of the file to
                 which data will be written.  'Dwrit$' returns the number  of
                 words  written  (which  should  always equal 'nwx'), or EOF.
                 'Dwrit$' is not intended for general use; it is not  protec-
                 ted from user error, and may cause termination of the user's
                 program if used incorrectly.  It should always be referenced
                 through 'writef'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Dwrit$'  calls  the Primos subroutine PRWF$$ to write words
                 to disk.


            _C_a_l_l_s

                 Primos prwf$$, move$


            _B_u_g_s

                 EOF is returned  if  any  error  occurs;  the  user  is  not
                      informed of the actual error that occurs.


            _S_e_e _A_l_s_o

                 writef (2)















            dwrit$ (6)                    - 1 -                    dwrit$ (6)


