

            rmfil$ (6) --- remove a file, return status              08/30/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function rmfil$ (name)
          |      packed_char name (MAXPACKEDFNAME)

                 Library:  vswtlb  (standard Subsystem library)


            _F_u_n_c_t_i_o_n

          |      'Rmfil$'  is  used to remove files, segment directories, and
          |      access categories by name.  The sole argument is the name of
                 a file (of either type, in  the  current  directory)  to  be
                 deleted.   Note  that  the  name  is  _n_o_t  an EOS-terminated
                 string; it is a packed, blank-filled  array  of  characters.
                 The  function  return  is  OK  if the deletion occurred, ERR
                 otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Rmfil$' uses the Primos routine SRCH$$ to delete  the  file
                 if  possible.   If  this attempt fails because the file is a
                 non-empty segment directory, it is opened and cleaned out by
          |      a call to 'rmseg$', then deleted by  SRCH$$.   If  it  fails
          |      because  the  file is an access category, it calls CAT$DL to
          |      remove it.


            _C_a_l_l_s

          |      ptov, Primos cat$dl, Primos srch$$, rmseg$


            _S_e_e _A_l_s_o

                 remove (2), del (1), rmseg$ (6)





















            rmfil$ (6)                    - 1 -                    rmfil$ (6)


