

            broadcast (3) --- send a Primos message to a user on all machines  07/20/83


          | _U_s_a_g_e

          |      broadcast [(<user> | all) [<message>]]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      The  'broadcast'  command allows users to send a Primos mes-
          |      sage on all systems that are running the SWT process 'ring'.
          |      If the first argument is "all", 'ring' broadcasts  the  mes-
          |      sage  to  all  users  on each machine in the ring, otherwise
          |      <user> is the user name of the  recipient  of  the  message.
          |      The  remaining  arguments  constitute  the  text  of  the 80
          |      character message to be broadcast.  If omitted,  'broadcast'
          |      reads  one  line  from standard input (STDIN) and broadcasts
          |      it.  If no arguments are given, 'broadcast' reads  one  line
          |      from STDIN and broadcasts it to all users.


          | _E_x_a_m_p_l_e_s

          |      broadcast all System going down in 5 minutes.  Please log off.

          |      broadcast jeff Your wife called.  The house burned down.


          | _M_e_s_s_a_g_e_s

          |      Cannot transmit BROADCAST request
          |           Something  interfered  with  the  transmission  of  the
          |           BROADCAST command to the 'ring' process.   This  should
          |           never happen.

          |      Message complete
          |           The  BROADCAST  command has been successfully attempted
          |           on all systems in the ring.

          |      Message has been transmitted
          |           The BROADCAST  command  has  been  transmitted  to  the
          |           'ring' process.

          |      Networks are not configured
          |           The system is not configured to support PRIMENET.

          |      Request to <system> failed
          |           The attempt to broadcast the message on system <system>
          |           failed.

          |      Request to <system> succeeded
          |           The attempt to broadcast the message on system <system>
          |           succeeded.

          |      Ring connection has been terminated
          |           The connection to the 'ring' process has been cleared.




            broadcast (3)                 - 1 -                 broadcast (3)




            broadcast (3) --- send a Primos message to a user on all machines  07/20/83


          |      Unable to connect to ring node
          |           The current system is not running a 'ring' process.

          |      You are not validated to BROADCAST
          |           Your  user  number  is not allowed to use the BROADCAST
          |           command.


          | _B_u_g_s

          |      Will not work if the current system is not running 'ring'.

          |      Message is sent by the 'ring' process because  that  is  the
          |      process  which  actually  executes the Primos 'message' com-
          |      mand.


          | _S_e_e _A_l_s_o

          |      execute (3), setime (3), terminate (3)






































            broadcast (3)                 - 2 -                 broadcast (3)


