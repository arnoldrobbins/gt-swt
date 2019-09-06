

            fsize (1) --- size any file system structure             01/16/83


            _U_s_a_g_e

                 fsize  { -<option>{<option>} } { <pathname> | -n }
                        <option> ::=  f | r | v | w


            _D_e_s_c_r_i_p_t_i_o_n

                 'Fsize' prints the amount of disk space consumed by the file
                 system  objects  specified  as  arguments.  Any type of file
                 system object may be specified (ordinary file, ufd, or  seg-
                 ment  directory); in the case of a ufd or segment directory,
                 the entire file system subtree thereunder is  considered  in
                 the  size.   'Fsize' will determine the amount of space used
                 not only for data but also for internal  purposes  (such  as
                 direct access indices).

                 If  "-n"  appears in place of a pathname, pathnames are read
                 from the standard  input.   For  more  information  on  this
                 syntax, see the entry for 'cat' (1).

                 The following options are available:

          |        -f   Force any object that can't be read to be readable by
          |             manipulating   its  protection  bits  and  concurrent
                        access lock.  After the object has  been  sized,  the
                        original attributes are restored.  The user must have
                        owner  status  in  the  object's parent directory for
                        this option to work.  ___WWW___AAA___RRR___NNN___III___NNN___GGG:::   _T_h_i_s  _o_p_t_i_o_n  _s_h_o_u_l_d
                        _n_o_t   _b_e   _u_s_e_d   _o_n  _o_b_j_e_c_t_s  _w_h_o_s_e  _p_r_o_t_e_c_t_i_o_n  _a_n_d
                        _c_o_n_c_u_r_r_e_n_c_y _a_t_t_r_i_b_u_t_e_s _a_r_e _a_s_s_u_m_e_d  _b_y  _s_o_m_e  _r_u_n_n_i_n_g
                        _p_r_o_g_r_a_m _t_o _h_a_v_e _a _p_a_r_t_i_c_u_l_a_r _s_e_t_t_i_n_g.  In particular,
                        certain   of  the  files  used  by  Prime's  database
                        management system must  not  have  their  concurrency
                        locks changed while the DBMS is active.

          |        -r   Print the size as a number of disk records (default).

          |        -v   Print  the  name of the object along with the size of
          |             the object.  This is especially useful when pathnames
                        are being read from the standard input.

          |        -w   Print the size as a number of 16 bit words.

                 If the "-n" idiom is not used and no pathnames are given  on
                 the  command  line, the program will size the current direc-
                 tory by default.


            _E_x_a_m_p_l_e_s

                 fsize
                 lf -c | fsize -f -n | stats -tashln
                 fsize -wv  //extra //lib //src




            fsize (1)                     - 1 -                     fsize (1)




            fsize (1) --- size any file system structure             01/16/83


            _M_e_s_s_a_g_e_s

                 "Usage:  fsize ..."  for incorrect argument syntax.
                 "-r and -w are mutually exclusive" for requesting  both  "r"
                      and "w".
                 "<pathname>:   can't  get record size" if the record size of
                      the disk  partition  containing  the  specified  object
                      can't be determined.
                 "<pathname>:   can't determine size" if the specified object
                      can't be opened for reading.
                 "<pathname>:   can't  size  directory   contents"   if   the
                      specified ufd can't be attached to.


            _B_u_g_s

                 Gives  inaccurate  results  for very large DAM files and DAM
                 segment directories (those with multi-level indices).

                 Will not work if the MFD of the disk  containing  an  object
                 cannot  be attached to with a password of "XXXXXX".  The MFD
                 must be read to determine the record size for the disk.


            _S_e_e _A_l_s_o

                 lf (1), hd (1)































            fsize (1)                     - 2 -                     fsize (1)


