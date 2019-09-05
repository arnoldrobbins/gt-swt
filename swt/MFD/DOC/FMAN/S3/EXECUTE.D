

            execute (3) --- execute a SWT command on another machine  07/20/83


          | _U_s_a_g_e

          |      execute [(<system> | all) [<command>]]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      The  'execute'  command interfaces to the SWT 'ring' process
          |      to allow users to execute a SWT command on any  system  that
          |      is  running  'ring'.  If the first argument is "all", 'ring'
          |      executes the command on all machines in the ring;  otherwise
          |      it  specifies  the  system  name  of the machine on which to
          |      execute the command.  Any remaining arguments  comprise  the
          |      text of the commands to be executed.  If these arguments are
          |      omitted,  'execute'  reads  one  line  from  standard  input
          |      (STDIN)  and  executes  it.   If  no  arguments  are  given,
          |      'execute'  reads  one line from STDIN and executes it on all
          |      systems.

          |      In order to execute a command on another system, the  'ring'
          |      process  on  the  target system starts up a phantom with the
          |      requesting user's name.  This phantom has the same home  and
          |      current directories as the 'ring' process, and therefore the
          |      command  line should contain a 'cd' command to attach to the
          |      correct directory.  'Ring' has no way to determine if a user
          |      is validated to log on to a system.   It  simply  creates  a
          |      phantom,  and  the 'swt' command will kill the process if it
          |      finds no "vars" directory.

          |      Note that the output from the phantom that 'ring' creates is
          |      not transmitted back to the user who requested the  service.
          |      In  order  to save that output, it must be written to a file
          |      and delivered to  the  user  in  some  other  fashion  (e.g.
          |      'mail').


          | _E_x_a_m_p_l_e_s

          |      execute gt.a sema drain -32

          |      execute all "cd; lf | mail roy"


          | _M_e_s_s_a_g_e_s

          |      Cannot transmit EXECUTE request
          |           Something  interfered  with  the  transmission  of  the
          |           EXECUTE command to the  'ring'  process.   This  should
          |           never happen.

          |      Command complete
          |           The  EXECUTE command has been successfully attempted on
          |           all systems in the ring.

          |      Command has been transmitted
          |           The EXECUTE command has been transmitted to the  'ring'


            execute (3)                   - 1 -                   execute (3)




            execute (3) --- execute a SWT command on another machine  07/20/83


          |           process.

          |      Networks are not configured
          |           The system is not configured to support PRIMENET.

          |      Request to <system> failed
          |           The  attempt  to execute the command on system <system>
          |           failed.

          |      Request to <system> succeeded
          |           The attempt to execute the command on  system  <system>
          |           succeeded.

          |      Requested system is not in the ring
          |           The  system  on  which  the  commands  were supposed to
          |           execute is not in the ring.

          |      Ring connection has been terminated
          |           The connection to the 'ring' process has been cleared.

          |      Unable to connect to ring node
          |           The current system is not running a 'ring' process.

          |      You are not validated to EXECUTE
          |           Your user number is not allowed to use the EXECUTE com-
          |           mand.


          | _B_u_g_s

          |      Will not work if the current system is not running 'ring'.

          |      Cannot determine whether or not user is validated to log  on
          |      to the requested system(s).

          |      Starts  up  phantoms  in the 'ring' directory rather than in
          |      the user's directory.


          | _S_e_e _A_l_s_o

          |      broadcast (3), setime (3), terminate (3)
















            execute (3)                   - 2 -                   execute (3)


