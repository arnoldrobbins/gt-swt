

            dmark$ (6) --- return the position of a disk file        03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 file_mark function dmark$ (f)
                 file_des f

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Dmark$'  performs  the  function of 'markf' for disk files.
                 The single argument is the file descriptor of a  disk  file;
                 the  function  return  is the current file pointer value for
                 the selected file.  ERR is returned if the position  of  the
                 file could not be determined.

                 As  with all Subsystem routines whose names contain the dol-
                 lar sign ($), 'dmark$' is  not  intended  for  general  use.
                 'Markf'  is  normally  used  to  provide  the required func-
                 tionality.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The Primos routine PRWF$$ is used to return the current file
                 position, which is in units of words past the  beginning  of
                 file.   If  for  any  reason  PRWF$$  cannot  determine  the
                 position, 'dmark$' returns ERR.


            _C_a_l_l_s

                 Primos prwf$$


            _S_e_e _A_l_s_o

                 markf (2), tmark$ (6), seekf (2)




















            dmark$ (6)                    - 1 -                    dmark$ (6)


