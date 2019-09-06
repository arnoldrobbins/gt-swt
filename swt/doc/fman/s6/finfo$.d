

            finfo$ (6) --- return directory information about a file  09/10/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function finfo$ (path, entry, attach)
                 character path (ARB)
          |      integer entry (MAXDIRENTRY), attach

                 Library:  vswtlb  (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Finfo$' is an internal Subsystem routine used to return the
                 Primos  directory  entry  associated with a named file.  The
                 'path' argument is the pathname of the file whose  entry  is
                 desired;  'entry'  is  a buffer to receive the entry itself;
                 'attach' is set to YES if the user's attach point changed as
                 a side effect of obtaining the directory  entry,  NO  other-
                 wise.   The function return is OK if the directory entry was
                 obtained, ERR otherwise.

                 See Prime's File Management System guide for information  on
          |      the structure of directory entries as returned by the Primos
          |      routines DIR$RD and ENT$RD.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Getto'  is  called to attach to the parent directory of the
                 named file.  The 'attach' parameter is set as a side  effect
                 of  this  action.  The Primos routine SRCH$$ is then used to
          |      open the current  directory  for  reading,  and  the  Primos
          |      routine  ENT$RD  to fetch the entry for the named file.  The
                 current directory is then  closed  by  SRCH$$  and  'finfo$'
                 returns.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 entry, attach


            _C_a_l_l_s

          |      getto, Primos srch$$, Primos ent$rd


            _S_e_e _A_l_s_o

                 filtst (2), file (1), lf (1)









            finfo$ (6)                    - 1 -                    finfo$ (6)


