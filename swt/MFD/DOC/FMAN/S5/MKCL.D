

            mkcl (5) --- generate a command list file for guess      01/03/83


            _U_s_a_g_e

                 mkcl [-s]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Mkcl'  is  not intended to be user-invoked; rather, it is a
                 utility used by the 'mkclist' command to  build  a  list  of
                 commands  in  a  compressed binary format for the use of the
                 'guess' command.  'Mkcl' reads a list of command names  from
                 standard  input, one name per line, and builds a binary out-
                 put file.  This binary  output  file  contains  the  command
                 names  ordered  by  name  length first and then alphabetical
                 order; i.e., all the one-character commands  come  first  in
                 alphabetical  order,  then  the  two-character  commands  in
                 alphabetical order, etc.  File marks are used to allow  fast
                 locates of a command within the file.

                 If  the  optional  argument  "-s"  is specified, then 'mkcl'
                 generates a new system command file; otherwise, it generates
                 a new user command file.  Because binary output is used, the
                 output of 'mkcl' should never be sent to the  terminal,  but
                 to a file or to a pipe for further processing.


            _E_x_a_m_p_l_e_s

                 lf -c =bin= =lbin= =ebin= | sort | uniq | mkcl -s
                 lf -c =bin= =lbin= =ebin= =ubin= | sort | uniq | mkcl


            _F_i_l_e_s

                 creates =extra=/clist if a system command list is desired.
                 creates =ubin=/clist if a per-user command list is desired.


            _M_e_s_s_a_g_e_s

                 "Usage:  mkcl ..."  if invalid arguments are specified.
                 "Can't  create clist file" if trying to create a system com-
                      mand file from a nonowner account to the =extra= direc-
                      tory, or if trying to create  a  private  user  command
                      list without having the directory =ubin= defined.
                 "Overflow!!!!!!!!   arggggg..."   if there are more commands
                      than can be handled in the program's data area.
                 "writef returned an error" if the program  could  not  write
                      the file header of file marks.
                 "writef  died in loop" if the program did not finish writing
                      the command names to the command file.
                 "writef died on last writef" if the program could not update
                      the file header with new information after writing  out
                      the commands.
                 "seekf  returned  error" if the program could not rewind the
                      command file.


            mkcl (5)                      - 1 -                      mkcl (5)




            mkcl (5) --- generate a command list file for guess      01/03/83


            _B_u_g_s

                 If there are more  than  600  commands  or  more  than  4096
                 characters  total  in  all the command names, table overflow
                 occurs.

                 It could be hazardous to your terminal's health to copy  the
                 resulting  command  list  file,  since  there  may  be  some
                 terminal control sequences embedded within the binary file.

                 Locally supported.


            _S_e_e _A_l_s_o

                 bs (5), bs1 (5), guess (5), mkclist (3)










































            mkcl (5)                      - 2 -                      mkcl (5)


