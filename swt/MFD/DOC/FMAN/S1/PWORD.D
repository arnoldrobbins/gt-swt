

            pword (1) --- change login password                      08/24/84


          | _U_s_a_g_e

          |      pword


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Pword'  changes  a  user's  login password.  A Primos login
          |      password consists of up to 16 letters, numbers, and the fol-
          |      lowing special characters:  '#', '$', '&',  '*',  '-',  '.',
          |      and  '/'.   Null passwords (consisting of no characters) may
          |      or may not be allowed depending on the specific system.

          |      'Pword' turns off terminal echo  (to  prevent  someone  from
          |      peeking)  and  requests  the old password.  It then requests
          |      the new password.  The new password is  requested  a  second
          |      time to verify that the user is changing his password to the
          |      correct  string.  If the two new passwords differ in any way
          |      then an error message is printed and the users  password  is
          |      left  unchanged.   'Pword'  then  calls  the  Primos routine
          |      CHG$PW to  change  the  user's  password.   Any  errors  are
          |      interpreted and printed on the terminal.


          | _E_x_a_m_p_l_e_s

          |      pword
          |      Old password: old.password
          |      New password: new.password$
          |      Reenter new password for verification: new.password$


          | _M_e_s_s_a_g_e_s

          |      "One  of the passwords was illegal" if a password containing
          |      an illegal character is entered.

          |      "The old password did not match the actual password" if  the
          |      old  password  entered did not match the actual old password
          |      of the account.

          |      "Disk is write protected.  See system administrator" if  the
          |      disk on which the passwords reside is write protected.


          | _S_e_e _A_l_s_o

          |      Primos CHANGE_PASSWORD command, Primos chg$pw










            pword (1)                     - 1 -                     pword (1)


