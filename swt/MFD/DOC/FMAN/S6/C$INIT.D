

            c$init (6) --- initialize for a statement count run      04/06/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine c$init


            _F_u_n_c_t_i_o_n

                 'C$init'  is  called at the beginning of the main program in
                 Ratfor programs that  have  been  processed  with  the  "-c"
                 (statement  count)  option  of  'rp'.   It  initializes  the
                 statement count array for statement count processing.

                 'C$init' is inserted into the Fortran output as inline code,
                 rather than being referenced  from  the  standard  Subsystem
                 library.   As  such,  it  can  never be accessed by the user
                 unless the "-c" option is specified (even  then,  it  should
                 not  be  called by the user, since the statement counts will
                 be erroneously modified).


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A Fortran dddooo lllooooooppp is used to initialize all of the  elements
                 in the statement count array to zero.


            _S_e_e _A_l_s_o

                 c$end (6), c$incr (6), rp (1)





























            c$init (6)                    - 1 -                    c$init (6)


