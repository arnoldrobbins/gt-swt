

            dopen$ (6) --- open a disk file                          07/04/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function dopen$ (path, fd, mode[, typ[, limit]])
                 character path (ARB)
                 integer mode, typ, limit
                 file_des fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Dopen$'  is an internal Subsystem routine that performs the
                 function of 'open' for disk files only.  The first  argument
                 is  the pathname of the file to be opened; it must be an EOS
                 terminated  string  (i.e.   dopen$('/dir/file1's....).   The
                 second  argument is the file descriptor assigned to the file
                 in 'open'.  The third argument is the mode, READ,  WRITE  or
                 READWRITE.   The  fourth argument is optional.  It specifies
                 the type of the file.  The fifth argument  is  optional;  it
                 specifies  the number of times to retry the open if the file
                 is in use.  'Dopen$'  returns  the  value  of  'fd'  if  the
                 attempt  to  open was successful; ERR if the attempt failed.
                 The user is always left  in  the  home  directory  after  an
                 attempt to open.

                 By   default,  'dopen$'  returns  a  file  descriptor  to  a
                 sequential access method (SAM) file.  If creating  a  direct
                 access method file (DAM) is desired, the 'mode' argument may
                 be  ORed with the KNDAM file key (i.e., 'mode' can be "READ-
                 WRITE+KNDAM" to create a DAM  file  opened  for  reading  or
                 writing).    The   constant   KNDAM   is  contained  in  the
                 "PRIMOS_KEYS" include file.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Dopen$' calls 'getto'  to  reach  the  UFD  containing  the
                 desired  file  and  pack the filename into an array suitable
                 for use with Primos routines.  If 'getto' is successful, the
                 Primos subroutine SRCH$$ is called to  open  the  file.   If
          |      either  'getto'  or SRCH$$ fails, Primos AT$HOM is called to
          |      return the user to the home directory, and ERR  is  returned
                 as the function value of 'dopen$'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 typ


            _C_a_l_l_s

          |      getto,  Primos  at$hom, Primos missin, Primos srch$$, Primos
          |      sleep$



            dopen$ (6)                    - 1 -                    dopen$ (6)




            dopen$ (6) --- open a disk file                          07/04/83


            _S_e_e _A_l_s_o

                 open (2)























































            dopen$ (6)                    - 2 -                    dopen$ (6)


