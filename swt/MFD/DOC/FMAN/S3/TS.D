

            ts (3) --- time sheet for hourly employees               01/15/83


            _U_s_a_g_e

                 ts  [ in | out ]  [ <hh>:<mm>  [ <mm>/<dd> ] ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Ts'  was  written  to ease the monthly chore of preparing a
                 time sheet.  During the month, the worker uses 'ts'  like  a
                 time clock, entering "ts in" as he begins a work session and
                 "ts  out"  as he concludes it.  His entry and exit times are
                 recorded to the nearest quarter-hour.  (Should variations in
                 time be necessary, he may specify a time and, optionally,  a
                 date  on  the  command  line.)   His  comings and goings are
                 recorded in a file named ".ts" in his variables directory.

                 At the end of the month, the worker simply enters  the  com-
                 mand  "ts", which causes a reasonably readable time sheet to
                 be printed on  standard  output.   This  timesheet  contains
                 daily, weekly, and monthly totals.

                 After his time has been reported to his superior, the worker
                 should delete his old ".ts" file and begin anew.


            _E_x_a_m_p_l_e_s

                 ts in
                 ts out 12:45
                 ts


            _F_i_l_e_s

                 =varsdir=/.ts for record of work


            _M_e_s_s_a_g_e_s

                 "Usage:  ts ..."  for invalid argument syntax.
                 "can't   open   time   sheet   file"  when  unable  to  open
                 "=varsdir=/.ts".


            _B_u_g_s

                 This program is incredibly locked in to the pay period  used
                 in  the  Georgia  Tech  School  of  Information and Computer
                 Science; e.g., pay periods must begin on  the  18th  of  the
                 month  and  end  on the 17th of the next, and all entries in
                 the timesheet file must have  dates  between  those  limits.
                 'Ts'  is also guaranteed to fail on "pathological" timesheet
                 files:  those that have entries missing or out of order.

                 Locally supported.



            ts (3)                        - 1 -                        ts (3)




            ts (3) --- time sheet for hourly employees               01/15/83


            _S_e_e _A_l_s_o

                 log (1)























































            ts (3)                        - 2 -                        ts (3)


