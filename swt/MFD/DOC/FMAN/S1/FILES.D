

            files (1) --- list file names matching a pattern         03/20/80


            _U_s_a_g_e

                 files [ <pattern> { <'lf'_argument> } ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Files'  is  a  shell file that invokes the 'lf' command and
                 filters its output through 'find' to select the  names  that
                 match the specified pattern.  The pattern may be any expres-
                 sion  that  is  acceptable  (as  a  pattern)  to 'find'.  By
                 default, the files in the current working directory are  the
                 ones  whose names are examined; however, an alternate direc-
                 tory may be specified as a second argument.  If no arguments
                 are specified, files produces the same results as an "lf -c"
                 command.


            _E_x_a_m_p_l_e_s

                 del -v [files ".b$"]

                 pr [files ".r$"]

                 files .r$ =src=/lib/swt/src | change .r$ |$
                    files .d$ =doc=/man/s2 | change .d$ | common -1


            _M_e_s_s_a_g_e_s

                 Various messages may be produced by 'lf' and 'find'.


            _S_e_e _A_l_s_o

                 find (1), lf (1), amatch (2), makpat (2)






















            files (1)                     - 1 -                     files (1)


