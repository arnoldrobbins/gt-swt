

            como (1) --- divert command output stream                01/16/83


            _U_s_a_g_e

                 como { -{c | n | p | t} } [ <pathname> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 The  'como'  command  is  used to control the destination of
                 command output; that is, output from a  program  that  would
                 otherwise  appear  on  the  terminal.   (This  is  in no way
                 related to the redirection of standard  inputs  and  outputs
                 provided  by  the  Subsystem.)   It is useful in conjunction
                 with phantoms or long command files  that  are  usually  run
                 without human supervision.

                 Command  output  may  be  routed to the terminal (the normal
                 case), a file, both the terminal and a file, or  to  neither
                 destination (in which case the output is lost).  The options
                 are as follows:

                      -c   (Continue.)    If   a   <pathname>   argument   is
                           specified, subsequent command output  is  appended
                           to   the   named  file;  otherwise,  output  to  a
                           previously opened file is continued (see the  "-p"
                           option).  Terminal output is not affected.

                      -n   (No  output to terminal.)  Terminal output is tur-
                           ned off.  File output is not affected.

                      -p   (Pause.)  File output is turned off.  The file  is
                           not  closed,  so  that  file  output  may  be sub-
                           sequently  resumed  with  a  "como  -c"   command.
                           Terminal output is not affected.

                      -t   (Output  to  terminal.)  Terminal output is turned
                           on.  The use of this option in no way affects  the
                           status of file output.

                 In  all  cases, the specification of a <pathname> results in
                 the opening of the named file and the  turning  on  of  file
                 output,  even  when the "-p" option is specified.  When used
                 without any arguments, 'como' closes any file that may  have
                 been  receiving  command  output, turns off file output, and
                 turns on terminal output.



            _E_x_a_m_p_l_e_s

                 como listing
                 como
                 como -cn save






            como (1)                      - 1 -                      como (1)




            como (1) --- divert command output stream                01/16/83


            _M_e_s_s_a_g_e_s

                 "Usage:  como ..."  for invalid argument syntax.
                 "bad pathname" the <pathname> could not be found.


            _B_u_g_s

                 If a <pathname> is specified and the file did not previously
                 exist, a direct  access  file  is  created,  rather  than  a
                 sequential file.


            _S_e_e _A_l_s_o

                 Primos como$$, Primos COMO command










































            como (1)                      - 2 -                      como (1)


