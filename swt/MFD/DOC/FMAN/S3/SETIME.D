

            setime (3) --- set time of day/date on all systems running ring  07/20/83


          | _U_s_a_g_e

          |      setime [-d mmddyy] [-t hhmm]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      The  'setime'  command  is  an  interface  to the SWT 'ring'
          |      process which allows validated users to change the  time  of
          |      day  on  all  systems  that  are  running  'ring'.   If  the
          |      "-d mmddyy" argument is present, the current month, day, and
          |      year is set to the given value, otherwise the  date  remains
          |      unchanged.   If  the  "-t  hhmm"  argument  is  present, the
          |      current time of day is set to that value, otherwise the time
          |      of day remains unchanged.  At least  one  of  the  arguments
          |      must be present.

          |      If the current time of day is being reset, the 'setime' com-
          |      mand executes immediately.  Otherwise, 'setime' pauses until
          |      the beginning of the next minute to complete execution.


          | _E_x_a_m_p_l_e_s

          |      setime -d 030184

          |      setime -t 1400


          | _M_e_s_s_a_g_e_s

          |      Cannot transmit SETTIME request
          |           Something  interfered with the transmission of the SET-
          |           TIME command to the 'ring' process.  This should  never
          |           happen.

          |      Networks are not configured
          |           The system is not configured to support PRIMENET.

          |      Request to <system> failed
          |           The  attempt  to  set  the  time  of day/date on system
          |           <system> failed.

          |      Request to <system> succeeded
          |           The attempt to set  the  time  of  day/date  on  system
          |           <system> succeeded.

          |      Ring connection has been terminated
          |           The connection to the 'ring' process has been cleared.

          |      Setime complete
          |           The  SETTIME command has been successfully attempted on
          |           all systems in the ring.

          |      SETTIME request initiated
          |           The SETTIME command has been transmitted to the  'ring'


            setime (3)                    - 1 -                    setime (3)




            setime (3) --- set time of day/date on all systems running ring  07/20/83


          |           process.

          |      The first day of the month must be at least 1
          |           0 is not a valid day of the month.

          |      The month must be between 1 and 12 (inclusive)
          |           The only valid months are 1 through 12.

          |      The hour must be between 0 and 23 (inclusive)
          |           The only valid hours are between 0 and 23.

          |      The minute must be between 0 and 59 (inclusive)
          |           The only valid minutes are between 0 and 59.

          |      Usage:  setime [-d mmddyy] [-t hhmm]
          |           Some argument was incorrectly specified.

          |      Unable to connect to ring node
          |           The current system is not running a 'ring' process.

          |      You are not validated to SETTIME
          |           Your user number is not allowed to use the SETTIME com-
          |           mand.

          |      <month> has only <count> days
          |           The  number  of  days  specified is not correct for the
          |           given month.


          | _B_u_g_s

          |      Will not work if the current system is not running 'ring'.

          |      Is inherently inaccurate because of the  time  required  for
          |      the SETTIME request to go around the ring.


          | _S_e_e _A_l_s_o

          |      broadcast (3), execute (3), terminate (3)


















            setime (3)                    - 2 -                    setime (3)


