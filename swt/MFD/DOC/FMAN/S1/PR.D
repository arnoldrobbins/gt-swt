

            pr (1) --- print files on the line printer               03/20/80


            _U_s_a_g_e

                 pr {<file_spec> | -h <heading>} [/ <sp_opts>]

                 <file_spec> ::= <filename> | -[<stdin_number>] |
                                 -n(<stdin_number> | <filename>)


            _D_e_s_c_r_i_p_t_i_o_n

                 'Pr'  is  used  to print paginated listings of text files on
                 the line printer.

                 Files to be printed are specified by <file_spec>s; see 'cat'
                 for further information on the semantics of this construct.

                 Spooler control options may appear on the command line,  but
                 must  be separated from file names by an argument consisting
                 only of a slash.  See 'sp' and the  library  routine  'open'
                 for further information on <sp_opts>.


            _E_x_a_m_p_l_e_s

                 lf -c | find .r | sort | pr -n
                 pr file1 file2 file3
                 cat part1 part2 | pr -
                 pr form / p/narrow/


            _F_i_l_e_s

                 //spoolq/prt???  for spool file
                 //spoolq/q.ctrl for queue control file


            _M_e_s_s_a_g_e_s

                 See 'print'


            _S_e_e _A_l_s_o

                 print (1), sp (1), cat (1)














            pr (1)                        - 1 -                        pr (1)


