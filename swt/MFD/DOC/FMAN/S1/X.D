

            x (1) --- execute Primos commands                        02/22/82


            _U_s_a_g_e

                 x [-d <directory-name>] [<Primos command>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'X'  allows users to execute Primos commands without leaving
                 the  Subsystem.   The  command  and  its  arguments  may  be
                 specified  as  arguments  to  'x',  or,  if no command is so
                 specified, 'x' reads commands from its standard  input.   If
                 arguments  are  present,  'x'  forms  a  Primos  command  by
                 concatenating all arguments (other than the "-d  <directory-
                 name>" pair) into a single Primos command line and passes it
                 to  the Primos command interpreter with a call to the Primos
                 routine CP$.  If the Primos command returns with a  positive
                 return  code,  'x'  exits with a call to 'error'; otherwise,
                 'x' exits normally.  No change is made to the Primos command
                 input source.

                 If 'x' reads commands from  standard  input,  it  reads  the
                 first  line, connects the Primos command source to the stan-
                 dard input file (either disk or  terminal)  and  passes  the
                 line  to  the  Primos command interpreter through CP$.  When
                 the command returns, 'x' resets  the  Primos  command  input
                 source.   Then,  if  the Primos command returned with a non-
                 positive return code, 'x' continues to  read  commands  from
                 standard  input  until end-of-file; otherwise 'x' terminates
                 with a call to 'error'.

                 All Primos file units that are left open by a Primos command
                 will be automatically closed by the Subsystem when  the  'x'
                 command returns.  Please note that this means the sequence

                       x "l mylist; ftn myprog"

                 will correctly deposit the listing file in "mylist", but

                       x l mylist
                       x ftn myprog

                 will deposit the listing in "l_myprog", since 'x' will close
                 the listing file when it returns.

                 If  the  "-d"  option  is  specified, 'x' will attach to the
                 named directory without changing the home  directory.   This
                 gives the user the ability to execute Primos commands on any
                 point in the file system from any point in the file system.


            _E_x_a_m_p_l_e_s

                 x -d //system share se2031 2031 700
                 x pma prog.p 1/707
                 x "r system>sw4000 1/1"



            x (1)                         - 1 -                         x (1)




            x (1) --- execute Primos commands                        02/22/82


            _M_e_s_s_a_g_e_s

                 "usage..."  for missing directory name after "-d".
                 "<directory-name>:  bad pathname" for bad directory.


            _S_e_e _A_l_s_o

                 fc (1), ld (1), primos (1), stop (1)

















































            x (1)                         - 2 -                         x (1)


