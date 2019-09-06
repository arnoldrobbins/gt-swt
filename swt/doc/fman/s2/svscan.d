

            svscan (2) --- scan a user's list of shell variables     05/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function svscan (name, maxlen, info [, offset] )
          |      character name (maxlen)
          |      integer maxlen, info (3), offset

          |      Library:  vshlib (shell routine library)


          | _F_u_n_c_t_i_o_n

          |      'Svscan'  provides  the user with a way of retrieving a list
          |      of the shell variables that are  currently  declared.   Each
          |      call  to  'svscan' returns one variable name.  The first and
          |      second arguments are  the  returned  name  and  the  maximum
          |      length  (including  the  EOS) that the name can attain.  The
          |      third argument is a three word array that 'svscan'  uses  to
          |      keep  track  of  its position in the internal shell variable
          |      data structure.  The user should set the  first  element  of
          |      this  array  to  zero  before the first call to 'svscan' and
          |      afterwards should leave it alone.  The last argument  is  an
          |      optional offset from the current lexic level of the shell at
          |      which to scan for the shell variables.  If 'offset' is omit-
          |      ted, 'svscan' scans the current level.  The function returns
          |      the  length  of  the returned shell variable name, or EOF if
          |      all variables have been returned.  The user should not  make
          |      any  subroutine  calls  that will change any shell variables
          |      between the first call to 'svscan' and the final one.  Doing
          |      so may cause duplicate names to be  returned  or  may  cause
          |      some names to be skipped.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      If the first element of the information array is 0, 'svscan'
          |      initializes  the  rest  of  the  array.  Otherwise it checks
          |      information in the array 'info' for validity and then  scans
          |      the  variable  data  structures  for the next shell variable
          |      starting at the previous position.  If all  shell  variables
          |      have  already been returned, 'svscan' returns EOF, otherwise
          |      it copies as much of the variable name as  possible  to  the
          |      user's receiving buffer and returns the number of characters
          |      copied as the function return.


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      name, info


          | _C_a_l_l_s

          |      ctoc





            svscan (2)                    - 1 -                    svscan (2)




            svscan (2) --- scan a user's list of shell variables     05/27/83


          | _S_e_e _A_l_s_o

          |      other sv?* routines (2)























































            svscan (2)                    - 2 -                    svscan (2)


