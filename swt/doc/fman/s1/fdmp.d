

            fdmp (1) --- produce formatted dump of a disk file       08/27/84


          | _U_s_a_g_e

                 fdmp  { -<opt>{<opt>}   |
                         +<start>        |
                         -<end> }  [ <pathname> ]
                    <opt> ::= b | c | d | h | o


            _D_e_s_c_r_i_p_t_i_o_n

                 'Fdmp'  writes  on  standard output a dump of the named file
                 (standard input if the file name is omitted) in one or  more
                 of  five  formats  as specified by the <opt> arguments.  The
                 formats are:

          |           -b   The file is interpreted as  a  sequence  of  octal
          |                bytes.

          |           -c   The  file  is  interpreted  as a sequence of ASCII
          |                characters.     Non-printable    characters    are
                           represented  by a control sequence consisting of a
                           caret  ("^")   followed   by   the   corresponding
                           printable  character.  Thus, an ETX (ctrl-c) would
                           be represented by "^c".  The single  exception  is
                           DEL which is represented as "^ ".

          |           -d   The  file  is  interpreted as a sequence of signed
          |                decimal integers.

          |           -h   The  file  is  interpreted  as   a   sequence   of
          |                hexadecimal integers.

          |           -o   The  file  is  interpreted  as a sequence of octal
          |                integers.

                 In the absence of any other specification, "-o"  (octal)  is
                 assumed.

                 For  each mode requested, one line of output is produced for
                 each group of eight words in the file.  The file offset,  in
                 octal,  of  the  first word in the group is prepended to the
                 first line of output for each group.

                 The portion of the file that is  dumped  may  be  controlled
                 with  the  "+<start>"  and  "-<end>" arguments.  <start> and
                 <end> represent the decimal addresses of the first and  last
                 words  of  the  file  to  be dumped.  (The first word has an
                 address of zero.)  The two arguments may be used in any com-
                 bination.  If the start address is unspecified, word zero is
                 assumed.  Likewise, if no ending address is given, the  dump
                 proceeds until end of file is encountered.

                 If  no file name is specified as an argument, standard input
                 one is read, allowing 'fdmp' to be used in a pipeline.




            fdmp (1)                      - 1 -                      fdmp (1)




            fdmp (1) --- produce formatted dump of a disk file       08/27/84


            _E_x_a_m_p_l_e_s

                 fdmp -bc -127 textfile
                 weird_program | fdmp


            _M_e_s_s_a_g_e_s

                 "Usage:  fdmp ..."  for incorrect arguments.

















































            fdmp (1)                      - 2 -                      fdmp (1)


