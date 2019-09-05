

            des (3) --- NBS Data Encryption Standard Implementation  01/13/83


            _U_s_a_g_e

                 des  (-e | -d)  [-k <key>]  {filename}  >output_file


            _D_e_s_c_r_i_p_t_i_o_n

                 'Des'  is  an implementation of the National Bureau of Stan-
                 dards Data Encryption Standard.  It can be used for  protec-
                 tion of on-line copies of sensitive information.

                 The  first  argument must be "-e" (for "encryption") or "-d"
                 (for decryption).  The DES is not  self-inverting  like  the
                 exclusive-or  algorithm  used in 'crypt'; the encryption and
                 decryption processes are different and one or the other must
                 be selected.

                 The optional argument sequence "-k <key>"  can  be  used  to
                 specify  a  key  to  control  the  encryption  or decryption
                 process.  If a key is not specified  on  the  command  line,
                 'des'  will  print a prompt message, turn off the terminal's
                 character echo, and read the key.   Furthermore,  after  the
                 key  has  been  read,  'des'  will  prompt  the user for key
                 validation; the key must then be re-entered to  insure  that
                 no  typographical  errors  occurred  during the original key
                 entry.

                 Remaining arguments must be the names  of  files  containing
                 information  to be encrypted or decrypted.  Filenames may be
                 read from standard input as well as from the  command  line;
                 see  the  reference  manual  entry  for  'cat'  for  further
                 information.  If no filenames  are  specified,  'des'  takes
                 data from its first standard input.  DO NOT use this feature
                 to  read  data from the terminal; 'des' uses binary I/O with
                 the unfortunate  side  effect  that  end-of-file  cannot  be
                 generated from a terminal keyboard.

                 The output of 'des' is always produced on its first standard
                 output.   Because 'des' processes data in binary rather than
                 ASCII form, its output will not be displayed correctly on  a
                 terminal.   Always direct the output of 'des' to a disk file
                 or into a pipe for further processing.


            _E_x_a_m_p_l_e_s

                 des -e -k turkey document >document.des
                 des -d -k turkey document.des >original_document


            _M_e_s_s_a_g_e_s

                 "Usage:  des ..."  for improper argument syntax.
                 "keys do not match" if the validation  key  entry  does  not
                 match the original key entry.



            des (3)                       - 1 -                       des (3)




            des (3) --- NBS Data Encryption Standard Implementation  01/13/83


            _B_u_g_s

                 Binary  I/O  is  needed to handle the arbitrary bit-patterns
                 output by the DES algorithm without  considerable  expansion
                 of  the  output text.  Unfortunately, binary I/O from and to
                 the terminal does not behave rationally at all.

                 The present implementation is  very  slow,  averaging  about
                 1730 bits per CPU second throughput.


            _S_e_e _A_l_s_o

                 crypt (1)












































            des (3)                       - 2 -                       des (3)


