

            csubc (1) --- interface to Prime DBMS Cobol subschema compiler  08/27/84


          | _U_s_a_g_e

                 csubc <input file>
                          [-l [<listing file>]]
                          [-z <CSUBS option>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Csubc'  serves as the Subsystem interface to the Prime DBMS
                 Cobol subschema compiler (CSUBS).  It  examines  its  option
                 specifications  and  checks  them  for consistency, provides
                 Subsystem-compatible default file names for the listing  and
                 output  files  as  needed,  and then produces a Primos CSUBS
                 command and causes it to be executed.

                 The "-l" option is used to select the name of  the  file  to
                 receive  the  listing  generated by the compiler.  If a file
                 name  follows  the  option,  then  that  file  receives  the
                 listing.   If  the  "-l"  option is specified without a file
                 name following it or is not specified, a default filename is
                 constructed from the input filename by changing  its  suffix
                 to   ".l".    For   example,   if   the  input  filename  is
                 "gonzo.csub", the listing file will  be  "gonzo.l";  if  the
                 input filename is "bar", the listing file will be "bar.l".

                 The  input filename must be a disk file name (conventionally
                 ending in ".csub").

                 In summary, then, the default command line for  compiling  a
                 file named "file.csub" is

                      csubc  file.csub  -l file.l

                 which corresponds to the CSUBS command

                      csubs -i *>file.csub -l *>file.l



            _E_x_a_m_p_l_e_s

                 csubc file.csub
                 csubc payroll.csub -l l_payroll
                 csubc funnyprog.csub -z"-newopt"


            _M_e_s_s_a_g_e_s

                 "Usage:  csubc ..."  for invalid option syntax.
                 "missing  input  file  name"  if  no input filename could be
                      found.
                 "<name>:  unreasonable input file name" if  an  attempt  was
                      made  to  read from the null device or the line printer
                      spooler.
                 "Sorry, the listing file must be a disk file" if the listing


            csubc (1)                     - 1 -                     csubc (1)




            csubc (1) --- interface to Prime DBMS Cobol subschema compiler  08/27/84


                      file was directed to a device file.


            _B_u_g_s

                 'Csubc' pays no attention to standard ports.
                 
                 There is no way to avoid getting a listing file.


            _S_e_e _A_l_s_o

          |      ddlc (1), cobc (1), cdmlc (1), ld (1), bind (3)













































            csubc (1)                     - 2 -                     csubc (1)


