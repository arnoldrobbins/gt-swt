

            tee (1) --- tee fitting for pipelines                    02/22/82


            _U_s_a_g_e

                 tee { <pathname> | -[1 | 2 | 3] }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Tee' creates multiple copies of data flowing into its first
                 standard  input.   By default, it copies this stream of data
                 to its first standard output.  In addition, a copy  is  made
                 on each of the files named in its argument list.  If a named
                 file did not previously exist, it is created.

                 If  an  argument  consists  only of a dash ("-"), optionally
                 followed by a single digit in the range 1-3, a copy is  sent
                 to  the standard output port corresponding to the digit.  If
                 the digit is missing, standard output one is assumed.

                 'Tee' is suitable for  checkpointing  data  flowing  past  a
                 given  point in a pipeline, or for fanning out a data stream
                 to feed multiple, parallel pipelines.


            _E_x_a_m_p_l_e_s

                 lf -c | tee file_names | print -p -n >/dev/lps
                 memo> tee [cat distribution_list]

                 file_names>  tee -2  |P1  |P2 _
                    :P1  change % //dir1/  |  cat -n  |$ _
                    :P2  change % //dir2/  |  cat -n  |$ _
                         lam


            _M_e_s_s_a_g_e_s

                 "<pathname>:  can't create" if a file cannot be created.


            _B_u_g_s

                 This function could be performed by the i/o primitives.


            _S_e_e _A_l_s_o

                 cat (1)











            tee (1)                       - 1 -                       tee (1)


