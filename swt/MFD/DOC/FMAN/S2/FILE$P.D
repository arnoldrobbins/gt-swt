

            file$p (2) --- connect Pascal file variables to Subsystem files  11/19/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 type file_name = array [1..7] of char;
                 procedure file$p (file: text; name: file_name); extern;

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'File$p'  may  be called from a Pascal program to allow that
                 program to access the redirection and pipe features of  Sub-
                 system  I/O.   Each  call to 'file$p' can connect any Pascal
                 file variable to any Subsystem file.  The call  to  'file$p'
                 is equivalent to, and is used instead of, the Pascal "reset"
                 and "rewrite" statements.

                 To  use  'file$p',  it  should  be  declared  as  a  level 1
                 procedure:
                 
                    procedure file$p(var f: text; n: file_name); extern;
                 
                 It may then be called to connect input and output, for exam-
                 ple:
                 
                    file$p(input,'STDIN  ');
                    file$p(output,'STDOUT ');
                 
                 The name of the Subsystem file to be connected  must  be  in
                 upper  case  and  space  filled.   It may be any of the fol-
                 lowing:   STDIN,  STDIN1,  STDIN2,  STDIN3,  ERRIN,  STDOUT,
                 STDOUT1, STDOUT2, STDOUT3, or ERROUT.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'File$p'  searches  a  table  of  Subsystem  file  names  to
                 determine the standard unit number for the  requested  file.
                 If  the  name is not in the table, 'file$p' calls the Primos
                 routine ERRPR$ to signal a bad file name error.  If the name
                 is in the table, a call to 'mapsu' is made to map the  stan-
                 dard  unit  number  into  the  Subsystem  unit  number,  and
                 'flush$' is called to ensure that the file has been  written
                 to  disk.   Then  'mapfd'  is called to determine the Primos
                 file unit associated with the file, if  there  is  one.   If
                 there  is  no  associated  file  unit,  the  file  is on the
                 terminal and 'file$p' initializes the  Pascal  file  control
                 block  for  a  terminal file.  Otherwise, the Primos routine
                 ATTDEV is called to connect  the  requested  file,  and  the
          |      Pascal file control block is initialized.  After the type of
          |      file  is  determined (disk or terminal) the appropriate name
                 is copied into the Pascal  file  control  block;  'TTY'  for
                 terminal  files  and  for /dev/null, and the Primos treename
                 for disk files.




            file$p (2)                    - 1 -                    file$p (2)




            file$p (2) --- connect Pascal file variables to Subsystem files  11/19/82


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 file


            _C_a_l_l_s

                 ctop, equal, flush$, gfnam$,  mapfd,  mapsu,  mktr$,  move$,
                 ptoc, Primos attdev, Primos errpr$


            _B_u_g_s

                 Files redirected to /dev/null are not supported.

                 Pascal  terminal  input does not behave correctly, the back-
                 space key cannot be used to erase previously entered charac-
                 ters.


            _S_e_e _A_l_s_o

                 init$p (2)



































            file$p (2)                    - 2 -                    file$p (2)


