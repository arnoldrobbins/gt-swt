

            diff (1) --- isolate differences between two files       02/23/82


            _U_s_a_g_e

                 diff [-{b | c | d | r | s | v}] [<old_file> [<new_file>]]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Diff' compares the contents of two files and reports on the
                 differences  between  them.   The  default  behavior  is  to
                 describe the insert, delete, and change operations that must
                 be performed on <old_file>  to  convert  its  contents  into
                 those of <new_file>.

                 Both  file  name  arguments  are  optional; if the second is
                 omitted, the first standard input is used for <new_file>; if
                 neither argument appears,  the  first  and  second  standard
                 input are used for <old_file> and <new_file> respectively.

                 The options currently available are:

                      -b   Perform  a  word-for-word  binary comparison.
                           'Diff' will compare  corresponding  words  of
                           the  two  input files; if any differences are
                           found, or if one file  is  shorter  than  the
                           other,  'diff' prints the message "different"
                           and exits.  If the files are the same, 'diff'
                           produces no output.   When  the  "-v"  option
                           (see  below)  is  specified, 'diff' prints an
                           octal representation of the words that differ
                           along with their offset from the beginning of
                           the file, and notifies the user if  one  file
                           is shorter than the other.

                      -c   Perform  a  simple  line-by-line  comparison.
                           'Diff' will compare successive lines  of  the
                           input   files;  if  any  corresponding  lines
                           differ, or if one file is  shorter  than  the
                           other,  'diff' prints the message "different"
                           and exits.  If the files are the same, 'diff'
                           produces no output.   When  the  "-v"  option
                           (see  below)  is specified, 'diff' prints the
                           lines that differ along with their line  num-
                           ber  in the input file, and notifies the user
                           if one file is shorter than the other.

                      -d   List the "differences" between the two files,
                           by highlighting  the  insertions,  deletions,
                           and changes that will convert <old_file> into
                           <new_file>.   This is the default option.  If
                           the "verbose"  option  "-v"  (see  below)  is
                           specified,   unchanged   text  will  also  be
                           listed.

                      -r   Insert text formatter requests  to  mark  the
                           <new_file>  with  revision  bars and deletion
                           asterisks.   This  option   is   particularly


            diff (1)                      - 1 -                      diff (1)




            diff (1) --- isolate differences between two files       02/23/82


                           useful  for  maintenance  of large documents,
                           like Subsystem Reference Manuals.

                      -s   Output a "script" of commands  for  the  text
                           editor 'ed' that will convert <old_file> into
                           <new_file>.   This  is  handy  for  preparing
                           updates to  large  programs  or  data  files,
                           since   generally   the   volume  of  changes
                           required will be much smaller  than  the  new
                           text in its entirety.

                      -v   Make  output  "verbose".  This option applies
                           to the "-b", "-c" and "-d" options  discussed
                           above.   If  not  selected,  'diff'  produces
                           "concise"   output;   if   selected,   'diff'
                           produces more verbiage.



            _E_x_a_m_p_l_e_s

                 diff myfile1 myfile2
                 diff rf.r nrf.r | pg
                 diff -b /ca/bin/rp /cb/bin/rp
                 diff -c afile maybe_the_same_file
                 diff -v rf.r nrf.r | sp
                 diff -r old_manual.fmt new_manual.fmt | fmt
                 diff -s old new >>update_old_to_new


            _M_e_s_s_a_g_e_s

                 "<file>:   can't open" if either <new_file> or <old_file> is
                      not readable.
                 "Usage:  diff ..."  for illegal options.


            _B_u_g_s

                 The algorithm used has one quirk:  a  line  or  a  block  of
                 lines  which  is not unique within a file will be labeled as
                 an insertion (deletion) if its immediately  adjacent  neigh-
                 bors   both  above  and  below  are  labeled  as  insertions
                 (deletions).
                 
                 Fails on very large files (> 10000  lines)  when  using  the
                 "-d" option.


            _S_e_e _A_l_s_o

                 common (1),
                 Heckel,  P.,  "A Technique for Isolating Differences Between
                 Files", _C_o_m_m_u_n_i_c_a_t_i_o_n_s _o_f _t_h_e  _A_C_M,  vol  21,  no  4  (April
                 1978), 264-268.



            diff (1)                      - 2 -                      diff (1)


