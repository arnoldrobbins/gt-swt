

            nstat (3) --- remote node status command                 01/15/83


          | _U_s_a_g_e

          |      nstat <node> [us | di | ne | wh | lo]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Nstat'  uses the X.25 Primenet calls to send a request to a
          |      server phantom on the destination system.  Currently, <node>
          |      may be the systems "gt.a", "gt.b", "gt.c", and "gt.d".   The
          |      remote  server  process  then  executes a status command and
          |      routes the information back through the virtual  circuit  to
          |      the calling program.  Options include:

          |          us  (default) causes the equivalent of the Subsystem
          |              'us' command on the other system; same as a Primos
          |              STATUS USERS command.

          |          di  causes a status of active disks; same as a Primos
          |              STATUS DISK command.

          |          ne  causes a status of the network; same as a Primos
          |              STATUS NET command.

          |          wh  causes a verbose status listing of users; equivalent
          |              to the Subsystem 'who' command being executed for
          |              the named system.

          |          lo  causes the server phantom on the named system to
          |              logout.  This command may only be issued by user
          |              "system".


          | _E_x_a_m_p_l_e_s

          |      nstat gt.b us
          |      nstat gt.e di


          | _F_i_l_e_s

          |      The  server process uses the file "=temp=/netstat", and some
          |      files in the account(s) "//nstat"


          | _M_e_s_s_a_g_e_s

          |      "Usage:  nstat ..."  for improper arguments.
          |      Various other messages depending on network status.


          | _B_u_g_s

          |      Locally supported; experimental




            nstat (3)                     - 1 -                     nstat (3)




            nstat (3) --- remote node status command                 01/15/83


          | _S_e_e _A_l_s_o

          |      Primenet guides, X.25 routines























































            nstat (3)                     - 2 -                     nstat (3)


