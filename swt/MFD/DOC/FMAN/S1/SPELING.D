

            speling (1) --- detect spelling errors                   07/24/84


          | _U_s_a_g_e

                 speling { <filename> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Speling'  places on its first standard output a list of all
                 the words in the named files (or standard input, if no files
                 are named) that are not in the dictionary "=dictionary=".  A
                 "word" is a contiguous string of letters.   'Speling'  is  a
                 shell  program;  the user is referred to its text to see how
                 it works.  To see how the word file is constructed, see  the
                 files in the directory "=aux=/spelling".


            _E_x_a_m_p_l_e_s

                 speling report >sp.errs
                 speling part1 part2 part3 >bogus_words


            _F_i_l_e_s

                 =dictionary= for dictionary of correct spellings


          | _B_u_g_s

          |      This command is superseded by the faster and more functional
          |      'spell' command.


            _S_e_e _A_l_s_o

          |      common (1), sort (1), spell (1), tlit (1), uniq (1)






















            speling (1)                   - 1 -                   speling (1)


