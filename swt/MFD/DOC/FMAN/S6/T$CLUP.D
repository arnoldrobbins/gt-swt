

            t$clup (6) --- profiling routine called on program exit  07/04/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine t$clup

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 A  call  to 't$clup' is inserted before each "call swt" in a
                 Subsystem program that is to be profiled.   When  used  with
                 the  "-p"  option,  Ratfor  inserts  this call automatically
                 before a "stop" statement, and  converts  the  "stop"  to  a
                 "call swt".

                 The purpose of 't$clup' is to write to the file "_profile" a
                 summary of the amount of real, cpu, and paging time spent in
                 each  subroutine  of  the profiled program.  This summary is
                 then read by the program  'profile'  and  formatted  into  a
                 report.

                 Since  no  profiling  information  is  written by any of the
                 other profiling routines,  't$clup'  must  be  called  if  a
                 profile is to be made.

                 'T$clup'  should  be  called  explicitly only by those users
                 wishing to profile Fortran programs by  hand;  Ratfor  users
                 should always profile with the "-p" option of the preproces-
                 sor.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'T$clup'  repeatedly  calls  't$exit'  until  all subprogram
                 calls have been cleaned up from  the  internal  call  stack.
                 The  file  "_profile"  is  opened via a call to 'create' and
                 filled by repeated calls  to  'writef'.   A  final  call  to
                 'close'  closes  the  file, leaving it ready for analysis by
                 'profile'.


            _C_a_l_l_s

          |      cant, close, create, t$exit, writef, Primos at$hom


            _B_u_g_s

                 This code should be invoked by 'swt', if necessary and  pos-
                 sible.


            _S_e_e _A_l_s_o

                 t$entr (6), t$exit (6), t$time (6), t$trac (6), rp (1)



            t$clup (6)                    - 1 -                    t$clup (6)


