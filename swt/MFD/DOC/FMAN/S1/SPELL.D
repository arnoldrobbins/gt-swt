

            spell (1) --- check for possible spelling errors         06/21/84


          | _U_s_a_g_e

          |      spell  [ -(f | v) ]  { <pathname> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Spell' can be used to check all the words in a document for
                 presence  in  a dictionary.  Thus, it provides an indication
                 of words that may be misspelled.

                 'Spell' has  two  modes  of  operation,  controlled  by  the
                 absence or presence of the "v" option.  If the "v" option is
                 not  specified, 'spell' simply produces a list of words that
                 it thinks are misspelled.  If "v" is specified, 'spell' will
                 also print the original input text, following each line with
                 a line  containing  possibly  misspelled  words.   (This  is
                 intended  to  make  the  erroneous  words easier to locate.)
                 Each text line is preceded by a blank, while each word  list
                 line  is  preceded  by  a  plus sign ('+'); if the output is
                 redirected to /dev/lps/f, this causes all  misspelled  words
                 to be boldfaced.

                 Normally,  'spell'  ignores  input  lines  that begin with a
                 period, since those  are  normally  text  formatter  control
                 directives.   However,  the "-f" option can be used to force
                 'spell' to process those lines.

          |      If the template =new_words= is defined, 'spell'  will  treat
          |      it  as  the pathname of a file into which it will append all
          |      words  that  it  could  not  find.   This  file  should   be
          |      periodically  sorted,  uniq'ed,  and  then  checked  by hand
          |      against a dictionary.  Any real words found in  this  manner
          |      should be added to =dictionary=.

                 'Spell'  supersedes the slower and less functional 'speling'
                 command.


            _E_x_a_m_p_l_e_s

                 spell report
                 spell -v report >/dev/lps/f
                 spell -f arbitrary_text | pg
                 spell part1 part2 part3 >new_words
                 files .fmt$ | spell -n


            _M_e_s_s_a_g_e_s

                 "Usage:  spell ..."  for improper arguments.
                 "in dsget:  out of storage space" if there are too many mis-
          |      spelled words to handle.





            spell (1)                     - 1 -                     spell (1)




            spell (1) --- check for possible spelling errors         06/21/84


          | _B_u_g_s

          |      Could stand to be made smarter about suffixes and  prefixes.
          |      At least it does now handle words with a trailing "'s".


            _S_e_e _A_l_s_o

                 speling (1)

















































            spell (1)                     - 2 -                     spell (1)


