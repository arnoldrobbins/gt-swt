

            sp (1) --- line printer spooler                          03/25/82


            _U_s_a_g_e

                 sp {<file_spec>} [/ {<option>}]

                 <file_spec> ::= <filename> | -[<stdin_number>] |
                                 -n(<stdin_number> | <filename>)
                 <option> ::=   -a <location>
                             |  -b <banner>
                             |  -c <copies>
                             |  -d <defer_time>
                             |  -f
                             |  -h
                             |  -j
                             |  -n
                             |  -p <paper_type>
                             |  -r
                             |  -s


            _D_e_s_c_r_i_p_t_i_o_n

                 'Sp' allows users of the Subsystem to send output to the on-
                 site line printer.

                 Data  to be printed is selected by a number of <file_spec>s.
                 See 'cat' for detailed information on the semantics of  this
                 construct.

                 A  number  of spooler control operations may be specified on
                 the command line after the files to be printed, provided the
                 files  and  options  are  separated  by  a  single  argument
                 consisting only of a slash.  The options presently available
                 are:

          |           -a   Print the file on system <location>
          |           -b   Change the output heading to <banner>
          |           -c   Produce <copies> duplicates
          |           -d   Do not print until <defer_time>
          |           -f   Use FORTRAN forms control
          |           -h   Suppress header page
          |           -j   Suppress final page eject
          |           -n   Generate line numbers in left hand margin
          |           -p   Do not print until operator mounts <paper>
          |           -r   Use raw forms control
          |           -s   User standard PRIMOS forms control


            _E_x_a_m_p_l_e_s

                 sp file.l
                 fmt report | os | sp / -f
                 sp stuff / -d 23:59 -f -c 30






            sp (1)                        - 1 -                        sp (1)




            sp (1) --- line printer spooler                          03/25/82


            _F_i_l_e_s

                 //spoolq/prt???  for spooler queue file
                 //spoolq/q.ctrl for spool queue


            _S_e_e _A_l_s_o

                 pr (1), open (2), lopen$ (6)

















































            sp (1)                        - 2 -                        sp (1)


