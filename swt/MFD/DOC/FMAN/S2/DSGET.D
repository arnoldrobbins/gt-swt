

            dsget (2) --- obtain a block of dynamic storage          01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 pointer function dsget (w)
                 integer w

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Dsget'  searches its available memory list for a block that
                 is at least as large as its first argument.  If such a block
                 is found, its index in the memory list is  returned;  other-
                 wise,   an   error   message  is  printed  and  the  program
                 terminates.

                 In order to use 'dsget', the following declarations must  be
                 present:

                    integer mem (MEMSIZE)
                    common /ds$mem/ mem

                 or  the "DS_DECL" system macro can used for the declarations
                 as follows:

                    DS_DECL (mem, MEMSIZE)

                 where MEMSIZE is supplied by the user, and may take  on  any
                 positive value between 6 and 32767, inclusive.  Furthermore,
                 memory must have been initialized with a call to 'dsinit':

                    call dsinit (MEMSIZE)


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Dsget'  is  an implementation of Algorithm A' on pages 437-
                 438 of Volume 1 of  _T_h_e  _A_r_t  _o_f  _C_o_m_p_u_t_e_r  _P_r_o_g_r_a_m_m_i_n_g,  by
                 Donald E.  Knuth.  The reader is referred to that source for
                 detailed information.

                 'Dsget'  searches  a linear list of available blocks for one
                 of sufficient size.   If  none  are  available,  a  call  to
                 'error'  results;  otherwise, the block found is broken into
                 two pieces, and the index (in array 'mem') of the  piece  of
                 the  desired  size  is  returned to the user.  The remaining
                 piece is left on the  available  space  list.   Should  this
          |      procedure  cause  a  block to be left on the available space
          |      list that is smaller than a threshold size,  the  few  extra
                 words  are  awarded  to  the  user  and the block is removed
                 entirely, thus speeding up the next search  for  space.   If
                 insufficient  space  is  available,  'dsget' reports "out of
                 storage space" and allows the  user  to  obtain  a  dump  of
                 dynamic storage space if he desires.




            dsget (2)                     - 1 -                     dsget (2)




            dsget (2) --- obtain a block of dynamic storage          01/07/83


            _C_a_l_l_s

                 dsdump, error, getlin, remark


            _B_u_g_s

                 Should  probably return error status to the user if space is
                 not found.  It is also somewhat annoying  for  the  user  to
                 have  to  declare  the  storage  area,  but Fortran prevents
                 effective use of pointers, so this inconvenience  is  neces-
                 sary for now.


            _S_e_e _A_l_s_o

                 dsfree (2), dsinit (2), dsdump (2), dsdbiu (6)









































            dsget (2)                     - 2 -                     dsget (2)


