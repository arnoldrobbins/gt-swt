

            terminate (3) --- terminate currently executing 'ring' process  07/20/83


          | _U_s_a_g_e

          |      terminate [<system>]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      The  'terminate'  command  is an interface to the SWT 'ring'
          |      process  which  allows  validated  users  to  terminate  the
          |      currently executing ring process on a system.  The specified
          |      'ring' process clears all of its connections and terminates.
          |      However,  since  a  'ring' process must always be running on
          |      each system in the ring to ensure the security of the  ring,
          |      the  shell file executing 'ring' will immediately re-execute
          |      it.  'Terminate' allows the  'ring'  comoutput  file  to  be
          |      reinitialized,  and  can be used to execute a new version of
          |      the  'ring'  process.   If  <system>  is  specified,  'ring'
          |      terminates  on  the machine with that system name, otherwise
          |      all 'ring' processes terminate.


          | _E_x_a_m_p_l_e_s

          |      terminate gt.a

          |      terminate


          | _M_e_s_s_a_g_e_s

          |      Cannot transmit TERMINATE request
          |           Something  interfered  with  the  transmission  of  the
          |           TERMINATE  command  to the 'ring' process.  This should
          |           never happen.

          |      Networks are not configured
          |           The system is not configured to support PRIMENET.

          |      Request to <system> failed
          |           The attempt to broadcast the message on system <system>
          |           failed.

          |      Request to <system> succeeded
          |           The attempt to broadcast the message on system <system>
          |           succeeded.

          |      Requested system is not in the ring
          |           The system which was to be terminated  is  not  in  the
          |           ring.

          |      Ring connection has been terminated
          |           The connection to the 'ring' process has been cleared.

          |      Termination complete
          |           The  TERMINATE  command has been successfully attempted
          |           on all requested systems.


            terminate (3)                 - 1 -                 terminate (3)




            terminate (3) --- terminate currently executing 'ring' process  07/20/83


          |      TERMINATE request initiated
          |           The TERMINATE  command  has  been  transmitted  to  the
          |           'ring' process.

          |      Unable to connect to ring node
          |           The current system is not running a 'ring' process.

          |      You are not validated to TERMINATE
          |           Your  user  number  is not allowed to use the TERMINATE
          |           command.


          | _B_u_g_s

          |      Will not work if the current system is not running 'ring'.


          | _S_e_e _A_l_s_o

          |      broadcast (3), execute (3), setime (3)






































            terminate (3)                 - 2 -                 terminate (3)


