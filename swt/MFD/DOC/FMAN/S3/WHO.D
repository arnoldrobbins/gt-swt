

            who (3) --- find out who's on the system and where they are  08/20/83


          | _U_s_a_g_e

          |      who {-a|-l|-p|-q}


            _D_e_s_c_r_i_p_t_i_o_n

          |      'Who'  prints  a listing on standard output that shows which
          |      users are currently logged in.  Information provided on each
                 logged-in user includes his login name, his process  number,
          |      the  time  at  which he logged in, his full name, and either
          |      his location or his current login project.  If the length of
          |      a login name exceeds 8 characters then 'who' prints the name
          |      on a line by itself and the other information  on  the  next
          |      line.

          |      Available options are:

          |           -a   Display   information  on  all  active  processes,
          |                including phantoms;  by  default,  'who'  provides
          |                information only on real users.

          |           -l   Display  the  locations  of  the  logged in users.
          |                This is the default behavior.  This option  cannot
          |                be specified if the "-p" option is used.

          |           -p   Display  the  current  projects  of  the logged in
          |                users.  This option cannot  be  specified  if  the
          |                "-l" option is used.

          |           -q   Do not print the header lines.


            _E_x_a_m_p_l_e_s

                 who
                 who -a
          |      who -p


            _F_i_l_e_s

                 =userlist=  to  correlate  a login name with the user's full
                      name
                 =termlist=  to  correlate  process  numbers  with   terminal
                      locations


            _M_e_s_s_a_g_e_s

                 "Usage:  who ..."  for invalid argument syntax.
                 "can't read user list" when unable to read "=userlist=".
          |      "can't read terminal list" when unable to read "=termlist=".
          |      "can't  display  both location and project at the same time"
          |      when both "-l" and "-p" options are specified.



            who (3)                       - 1 -                       who (3)




            who (3) --- find out who's on the system and where they are  08/20/83


            _B_u_g_s

                 The date of login is not displayed; thus, the time displayed
          *      for phantom users is probably useless.


            _S_e_e _A_l_s_o

                 us (1)

















































            who (3)                       - 2 -                       who (3)


