

            t$trac (6) --- trace routine for Ratfor programs         03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine t$trac (mode, name)
                 integer mode
                 integer name (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'T$trac'  is  called  from  traced  Ratfor  programs  (those
                 processed with the "-t"  option).   Calls  to  't$trac'  are
                 planted  in  the  Fortran  output  of  Ratfor  as  the first
                 executable  statement  of  each  routine  and  before   each
                 "return" and "stop".

                 'Mode' is 1 for subprogram entry, 2 for subprogram exit, and
                 3  for initialization of the indentation level.  'Name' is a
                 period-terminated packed string containing the name  of  the
                 routine  being traced.  It need be supplied only when 'mode'
                 has a value of 1 (subprogram entry).

                 'T$trac' produces an indented listing with vertical lines to
                 help connect  subprogram  entry  and  exit.   The  trace  is
                 produced on ERROUT.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A  level  counter  is  maintained to determine the amount of
                 indentation; simple output statements produce the trace.


            _C_a_l_l_s

                 putch, print


            _S_e_e _A_l_s_o

                 t$entr (6), t$exit (6), t$clup (6), t$time (6), rp (1)
















            t$trac (6)                    - 1 -                    t$trac (6)


