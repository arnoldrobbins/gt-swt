

            putlin (2) --- put a line on a file                      03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function putlin (line, fd)
                 character line (ARB)
                 file_des fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Putlin'  is  the  primary  Subsystem  output  routine.  The
                 character string supplied as the first argument is placed on
                 the file specified by the  second  argument.   The  function
                 return is OK if the write was successful, ERR otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Putlin'  first calls 'mapsu' to map any standard unit which
                 may have been supplied on the call  to  a  file  descriptor.
                 The  file  specified by this descriptor is checked to insure
                 writeability.  If the last operation on the given  file  was
                 not  a  'putlin',  'flush$'  is  called  to place the file's
                 buffer in the empty state.  Depending  on  the  device  type
                 associated  with  the  file,  one  of  the  device dependent
                 drivers 'dputl$' (for disk files) or 'tputl$' (for  terminal
                 files)  is  called  to perform the actual data transfer.  No
                 data transfer takes place for the null  device  (/dev/null).
                 The  function  return  is  the  value returned by the device
                 dependent driver chosen, and is OK for a  successful  trans-
                 fer, ERR for an unsuccessful transfer.


            _C_a_l_l_s

                 mapsu, dputl$, tputl$, flush$


            _S_e_e _A_l_s_o

                 mapsu (2), dputl$ (6), tputl$ (6), putch (2), getlin (2)
















            putlin (2)                    - 1 -                    putlin (2)


