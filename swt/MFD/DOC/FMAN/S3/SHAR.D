

            shar (3) --- put text files into a 'shell archive'       06/21/84


          | _U_s_a_g_e

          |      shar <file_spec> { <file_spec> ... }


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Shar'  (SSShhhell AAArrrchiver) is an alternative method of arrang-
          |      ing for long term storage of files  that  need  to  be  kept
          |      together  for  some  purpose,  or  files  that  will  not be
          |      frequently accessed.

          |      'Shar' reads the files named on the command line, and writes
          |      the "shell archive" on its first standard  output  port.   A
          |      shell  archive is a file containing shell commands and text,
          |      that when executed as a command by the Software  Tools  Sub-
          |      system  shell,  will  reproduce the files used to create the
          |      archive.

          |      See the help on 'cat' for a full description of <file_spec>.

          |      'Shar' can even be used to archive other shell archives,  as
          |      long  the  component  archives  do not contain a file by the
          |      same name as the archive.

          |      To extract the files, simply execute the archive file  as  a
          |      command.  As each file is extracted, its name is written out
          |      to the terminal.


          | _E_x_a_m_p_l_e_s

          |      shar [files .r$] [files .d$] >prog.shar   # to create an archive
          |      prog.shar       # to extract the files in the archive


          | _M_e_s_s_a_g_e_s

          |      "<file>: can't open"    when it can't open a file.

          |      "usage: shar ..."  if called improperly.


          | _B_u_g_s

          |      May do bizarre things with non-text files.

          |      Can't recursively archive sub-directories.


          | _S_e_e _A_l_s_o

          |      ar (1), cto (1), cat (1)





            shar (3)                      - 1 -                      shar (3)


