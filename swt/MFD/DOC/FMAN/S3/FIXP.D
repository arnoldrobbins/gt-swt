

            fixp (3) --- file translation and parity set program     01/13/83


            _U_s_a_g_e

                 fixp [-z] [-mu | -ml] [-cl | -cd] [-u] [<infile> [<outfile>]]


            _D_e_s_c_r_i_p_t_i_o_n

                 The Prime operating system adopts a convention whereby every
                 ASCII  character has the most significant of eight bits (the
                 so-called "parity" bit) always set "on".  This can  lead  to
                 some  difficulties  when  dumping a tape from another system
                 since not all systems use the eighth bit in this manner.

                 'Fixp'  is  a  translation  program  designed  to  transform
                 foreign  files  to SWT and Primos compatible text files.  It
                 has some other interesting  capabilities,  discussed  below.
                 It is written in PMA to utilize the cpu's character instruc-
                 tions  and  thus  operates very quickly.  By default, 'fixp'
                 always sets the parity bits of every character to "on".

                 The "-z" option causes all  null  characters,  except  those
                 used  for  padding  at  the  end of a string, to be deleted.
                 This option does not cause ASCII nulls (octal  '200)  to  be
                 deleted  if they are present in the input, it simply deletes
                 total null (octal 0) characters from the text stream.   This
                 option  can  be  used  when stripping padding from 'se' tem-
                 porary files during recovery operations, for instance.

                 The "-mu" and "-ml" options map the output into  upper  (mu)
                 or  lower (ml) case.  This operation is at least an order of
                 magnitude faster than 'tlit'  and  thus  may  be  useful  by
                 itself.

                 The  "-cl"  and  "-cd"  options  are  for  files  which have
                 carriage return characters in them.  The "-cd" option simply
                 drops any carriage returns.   The  "-cl"  option  turns  all
                 carriage returns into linefeed/eol characters.

                 The  "-u" option strips all control characters from the out-
                 put except for linefeed/eol characters.  Thus, 'fixp' may be
                 used as a filter for removing  all  but  visible  characters
                 from a text stream.

                 By default, 'fixp' creates a standard compressed-ASCII file.
                 If  the "-u" option is given then the output is NOT compres-
                 sed but contains the actual blanks that  would  normally  be
                 compressed out.  It should be noted that such files can take
                 up many times more disk space than the equivalent compressed
                 files, and thus this option should be used carefully.

                 If  no  output  file is given 'fixp' sends output to STDOUT.
                 If no input file is  given  then  'fixp'  takes  input  from
                 STDIN.

                 If  no  options  are  given,  defaults  are no case mapping,
                 include all carriage returns unchanged, include all  control


            fixp (3)                      - 1 -                      fixp (3)




            fixp (3) --- file translation and parity set program     01/13/83


                 characters  unchanged,  and leave all padding zeros in place
                 (except that parity bits get turned on so they become  ASCII
                 nulls).


            _E_x_a_m_p_l_e_s

                 from_tape> fixp -mu -cl >text
                 fixp //spaf/foo //dan/bar_none


            _M_e_s_s_a_g_e_s

                 "Usage:  fixp ..."  for invalid argument syntax.
                 "<name>:  Cannot open" for files that cannot be opened.
                 "Error  in  fixp"  when  an  error  condition other than EOF
                      occurs with the input.


            _B_u_g_s

                 The non-compression of blanks with the "-u" option might  be
                 considered a bug.

                 The  program code is self-modifying and should not be put in
                 protected or shared memory regions without modification.

                 Due to the behavior of 'readf', when 'fixp' takes input from
                 the terminal there is no way to trigger  the  EOF  condition
                 and  thus the program will never end!  Large scale buffering
                 is used so you  may  not  immediately  observe  any  output,
                 either.

                 'Fixp'  cannot reverse its actions, it can't turn the parity
                 bits back off.

                 Locally supported.


            _S_e_e _A_l_s_o

                 mt (1), tlit (1)
















            fixp (3)                      - 2 -                      fixp (3)


