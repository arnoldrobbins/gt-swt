

            cdmlc (1) --- interface to Prime DBMS Cobol DML preprocessor  08/27/84


          | _U_s_a_g_e

                 cdmlc <input file>
                          [-b [<output file>]]
                          [-l [<listing file>]]
                          [-z <CDML option>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Cdmlc'  serves as the Subsystem interface to the Prime DBMS
                 Cobol DML  preprocessor  (CDML).   It  examines  its  option
                 specifications  and  checks  them  for consistency, provides
                 Subsystem-compatible default file names for the listing  and
                 output files as needed, and then produces a Primos CDML com-
                 mand and causes it to be executed.

                 The  "-b"  option  is used to select the name of the file to
                 receive the output Cobol code from the preprocessor.   If  a
                 file  name  follows  the option, then that file receives the
                 output.  If the option is not specified,  or  no  file  name
                 follows it, a default filename is constructed from the input
                 filename by changing its suffix to ".dcob".  For example, if
                 the  input  filename  is "prog.cob", the output file will be
                 "prog.dcob"; if the input filename is "foo", the output file
                 will be "foo.dcob".

                 The "-l" option is used to select the name of  the  file  to
                 receive  the  listing  generated  by the preprocessor.  If a
                 file name follows the option, then that  file  receives  the
                 listing.   If  the  "-l"  option is specified without a file
                 name following it or is not specified, a default filename is
                 constructed from the input filename by changing  its  suffix
                 to  ".dl".   For  example,  if  the  input filename is "gon-
                 zo.cob", the listing file will be "gonzo.dl"; if  the  input
                 filename is "bar", the listing file will be "bar.dl".

                 The  input filename must be a disk file name (conventionally
                 ending in ".cob" or ".cobol").

                 In summary, then, the default command line for  compiling  a
                 file named "file.cob" is

                      cdmlc   file.cob  -b file.dcob  -l file.dl

                 which corresponds to the CDML command

                      cdml -i *>file.f -b *>file.dcob -l *>file.dl



            _E_x_a_m_p_l_e_s

                 cdmlc file.cob
                 cdmlc payroll.cob -b b_payroll -l l_payroll
                 cdmlc funnyprog.cob -z"-newopt"


            cdmlc (1)                     - 1 -                     cdmlc (1)




            cdmlc (1) --- interface to Prime DBMS Cobol DML preprocessor  08/27/84


            _M_e_s_s_a_g_e_s

                 "Usage:  cdmlc ..."  for invalid option syntax.
                 "missing  input  file  name"  if  no input filename could be
                      found.
                 "<name>:  unreasonable input file name" if  an  attempt  was
                      made  to  read from the null device or the line printer
                      spooler.
                 "<name>:  unreasonable output file name" if an  attempt  was
                      made to output on the terminal or line printer spooler.
                 "Sorry, the listing file must be a disk file" if the listing
                      file was directed to a device file.
                 "Sorry,  the  output file must be a disk file" if the output
                      file was directed to a device file.


            _B_u_g_s

                 'Cdmlc' pays no attention to standard ports.
                 
                 There is no way to avoid getting both a listing  and  output
                 file.


            _S_e_e _A_l_s_o

          |      cobc (1), csubc (1), ddlc (1), cdmlcl (1), ld (1), bind (3)































            cdmlc (1)                     - 2 -                     cdmlc (1)


