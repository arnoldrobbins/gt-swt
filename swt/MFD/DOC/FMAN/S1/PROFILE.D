

            profile (1) --- print execution profile                  03/25/82


            _U_s_a_g_e

                 profile [ -d <dictionary> ] [ <profile> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Profile'  formats  the  information  recorded by a profiled
                 Ratfor program (one compiled with "rp -p")  and  prepares  a
                 report.

                 Two  input  files are used.  The first contains a dictionary
                 of the subroutines in the traced program and is produced  by
                 'rp'  when  the  program is compiled (with the "-p" option).
                 The name of the dictionary file may be specified  explicitly
                 after  the  "-d"  argument; otherwise, "timer_dictionary" is
                 assumed.

                 The second file contains the actual profile  data  that  are
                 recorded  when the traced program is run.  Its name may also
                 be specified as an argument; "_profile"  is  assumed  other-
                 wise.

                 Profile analyzes the two data files and produces a report on
                 standard output, containing the following information:

                      -    Number of times each routine was called
                      -    Real time spent in each routine
                      -    Percentage real time spent in each routine
                      -    CPU time spent in each routine
                      -    Percentage CPU time spent in each routine
                      -    Milliseconds spent in each routine per call
                      -    Paging time spent in each routine
                      -    Percentage paging time spent in each routine

                 Note that profile can only be used to summarize execution of
                 Ratfor  programs  compiled  with the "-p" option, or Fortran
                 programs in  which  the  necessary  trace  calls  have  been
                 included by hand.


            _E_x_a_m_p_l_e_s

                 profile | sp
                 profile -d dict1 prof_info


            _F_i_l_e_s

                 "timer_dictionary" for default dictionary.
                 "_profile" for default profile data.


            _M_e_s_s_a_g_e_s

                 "Usage:  profile ..."  for invalid argument syntax.


            profile (1)                   - 1 -                   profile (1)




            profile (1) --- print execution profile                  03/25/82


            _B_u_g_s

                 If  the  profiled  program exits without calling the profile
                 exit routine (e.g.  by calling  'error'  rather  than  using
                 'stop', from Ratfor) no profile data file will be created.

                 The  system  clock only has a resolution of 1/330 second, so
                 'profile' may not be accurate in timing short routines.

                 Procedure call overhead is charged to  the  calling  routine
                 rather than to the called routine.


            _S_e_e _A_l_s_o

                 rp (1), st_profile (1), t$entr (6), t$exit (6), t$time (6)










































            profile (1)                   - 2 -                   profile (1)


