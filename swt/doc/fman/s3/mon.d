

            mon (3) --- system status monitor                        01/15/83


            _U_s_a_g_e

                 mon [<sample interval>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Mon'  is a program which continuously observes and displays
                 the various Primos databases and certain statistics on  per-
                 formance,  which  it computes.  It accepts one optional com-
                 mand line argument, along with several single character com-
                 mands, once 'mon' is running.  The command line argument  is
                 the number of clock seconds to wait between each sampling of
                 the  Primos databases.  If omitted, the interval defaults to
                 30 seconds.   The  single  character  commands,  during  the
                 program's  run,  determines  which  of several formats 'mon'
                 will use to display the information.  The commands are:

                 l                   Use LONG format (default)
                 s                   Use SHORT format
                 m                   Use SHORT MEMORY format
                 c                   CLEAR the screen and redraw the data
                 q                   \
                 cntrl-p              >Quit
                 BREAK               /
                 x                   Execute a PRIMOS command
                 ?                   Display the available commands

                 The "l",  "s",  and  "m"  commands  adjust  the  format  and
                 information displayed.  The "l" and "s" commands display the
                 statistics  with  per  process  CPU  usage in long and short
                 formats  respectively.   The  "m"   command   displays   the
                 statistics with per process memory usage (pages presently in
                 memory).

                 The  "c"  command will clear and redraw the screen.  This is
                 useful after Primos messages or Primos  commands  have  been
                 executed via the "x" command (see below).

                 'Mon'  will  run  continuously until interrupted by either a
                 "q", a BREAK, or a control-p  being  typed.   It  will  then
                 position  the  cursor  to  the  bottom  of  the  screen  and
                 terminate.

                 The "x" command allows  the  execution  of  PRIMOS  commands
                 while  'mon'  is  running.  It is similar to the Subsystem's
                 "x" command.  This feature allows system  administrators  to
                 see  how  changing scheduling parameters affects system per-
                 formance.

                 The "?"  command will display the  available  single  letter
                 commands  and  then wait until any character is typed before
                 continuing.





            mon (3)                       - 1 -                       mon (3)




            mon (3) --- system status monitor                        01/15/83


                 SYSTEM WIDE TIME STATISTICS:

                 For each of these, total time is displayed in hours, minutes
                 seconds and hundredths of seconds, along with the change  in
                 time  since  last  interval  was  displayed.   The change is
                 displayed in seconds and hundredths of seconds.  The  format
                 of these statistics does not change with a change in display
                 format.

                 Up Time             Total clock time since last boot.

                 User Cpu Time       Total  cpu  time  used  by  normal  user
                                     processes since last boot.

                 I/O Time            Total I/O time charged since last boot.


                 OTHER SYSTEM WIDE STATISTICS:

                 For Disk Accesses and Page faults, the  total  number  since
                 boot  is  displayed,  as  well  as  the number and rate (per
                 second) during the last sample interval.  The format of this
                 information does not change with a format change.

                 Disk Accesses       Total disk accesses since the system was
                                     booted.

                 Page Faults         Total number of page  faults  since  the
                                     system was booted.

                 Buffer Hit Rate     The  number  of  disk  records that were
                                     found  in  the   in-memory   associative
                                     buffers  as  a  percentage  of the total
                                     number of disk records  requests  during
                                     the last sample interval.


                 PER-PROCESS STATISTICS:

                 For each process, the user name, user number, total cpu time
                 used, change in cpu time since last interval, and percentage
                 of  the cpu time used since the last interval are displayed.
                 In  addition  to  each  logged  in  user  process,  data  is
                 displayed  for  other  internal  system  processes  that are
                 active:  the Clock process, two Idle processes  (the  system
                 backstop  processes;  1  for  the  main cpu, and one for the
                 attached processor, if it exists), two  Mpc  processes  (for
                 line  printers,  mag  tapes, and other unit record devices),
          |      the  Amlc  process  (asynchronous  line  driver),  the  Smlc
          |      process (synchronous line driver), and the Ring process (the
                 network driver).


            _E_x_a_m_p_l_e_s

                 mon


            mon (3)                       - 2 -                       mon (3)




            mon (3) --- system status monitor                        01/15/83


                 mon 15


            _M_e_s_s_a_g_e_s

                 "Usage:  mon ..."  for invalid argument syntax.
                 "Terminal type '<term_type>' not supported" when <term_type>
                      is not supported by VTH.


            _B_u_g_s

                 Since  'mon'  can't  lock the Primos databases that it reads
                 the data returned isn't  guaranteed  to  be  100%  accurate.
                 Bogus  values  may  appear  when a user logs in and out, but
                 these will disappear during  the  next  interval.   Accuracy
                 will improve with longer display times.

                 If more users than the screen can display are logged in, the
                 higher  user  numbers  may  be  cut off on the bottom of the
                 screen.  The short formats can display 50% more  users,  but
                 even that isn't quite enough for 128 processes.

                 Since  'mon' requires breaks being enabled in order to stop,
                 it ensures that breaks are enabled.  If a user  has  pending
                 breaks,  'mon'  will terminate as soon as it enables breaks,
                 rather than continuing.


            _S_e_e _A_l_s_o

          |      x (1)


























            mon (3)                       - 3 -                       mon (3)


