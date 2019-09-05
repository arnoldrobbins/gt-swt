

            dbg (1) --- invoke the Primos source level debugger (DBG)  08/31/84


          | _U_s_a_g_e

                 dbg { <DBG option> } <program> { <arguments> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Dbg' allows the user to access the facilities of the Primos
                 source  level  debugger  (DBG) while still in the Subsystem.
                 <Program> is a Subsystem program that  has  been  linked  by
                 'ld' with the "-d" option (i.e., it is a segment directory).
                 'Dbg'  sets  up  the  standard  input  and  output ports and
                 <arguments> for access by the program and then executes  DBG
                 with a call to Primos routine CP$.


            _E_x_a_m_p_l_e_s

                 dbg -vfyi -vfyp prog.r> new_rp >prog.f
                 dbg test.o -s -t 3


            _M_e_s_s_a_g_e_s

                 "command  too  long"  for  too  many DBG options to fit on a
                      Primos command line.


            _B_u_g_s

                 If DBG bombs (as it has been known  to  do),  the  Subsystem
                 must be reinitialized with the sequence "dels all;dels 6002"
                 and then "swt".

                 Ratfor programs must be debugged using the Fortran names and
          |      line numbers (yuk!).

          |      When  DBG  terminates  (with  the  "q"  command) it exits to
          |      PRIMOS.  Typing "ren" will return back to the subsystem.


            _S_e_e _A_l_s_o

                 fc (1), f77c (1), pc (1), plgc (1), ld (1)














            dbg (1)                       - 1 -                       dbg (1)


