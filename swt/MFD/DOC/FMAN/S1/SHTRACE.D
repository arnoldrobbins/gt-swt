

            shtrace (1) --- trace activity in command interpreter    02/22/82


            _U_s_a_g_e

                 shtrace  { on | debug | all | value | <octal_integer>
                          | cl | command_line
                          | cn | compound_node
                          | ex | execution
                          | fn | function
                          | it | iteration
                          | lo | location
                          | ls | linked_strings
                          | nd | node
          |               | ou | onunit
                          | pd | port_descriptor
                          | sr | sv_restore
                          | ss | single_step
                          | sv | sv_save }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Shtrace' is a debugging aid intended for those who maintain
                 the   Subsystem,   particularly   its  command  interpreter.
                 Because of its value in debugging  shell  programs,  it  has
                 been  released for general use, with the warning that it may
                 change without notice.

                 In essence, 'shtrace' prints the status of a command line or
                 its environment as the command is processed  by  the  shell.
                 Since   this   involves  many  operations,  there  are  many
                 potential "checkpoints" within the command interpreter.  The
                 'shtrace' options are intended to pick out  the  most  vital
                 points along a command's path from entry to execution.

                 Each  option  is  specified  as  a  single  character-string
                 argument,  which,  except  for   special   cases,   may   be
                 abbreviated  with  a  two-character mnemonic.  These options
                 are as follows:

                      command_line (cl)
                           The command line is printed as it is read, without
                           processing.   (The  output  from  this  and  other
                           options  is preceded by a number in brackets, e.g.
                           [2.1]; the integer part is the lexic level of  the
                           command  (the  number  of command inputs currently
                           active), while the fractional  part  is  the  node
                           number of the node within its network.)

                      compound_node (cn)
                           The  command  line is printed after compound nodes
                           have been replaced by temporary command files.

                      function (fn)
                           The command line is  printed  after  all  function
                           calls have been evaluated.

                      iteration (it)


            shtrace (1)                   - 1 -                   shtrace (1)




            shtrace (1) --- trace activity in command interpreter    02/22/82


                           The  command  line  is printed after all iteration
                           groups have been expanded.

                      execution (ex)
                           The network about to be executed is  printed.   No
                           compound  nodes,  functions,  or  iterations  will
                           appear in this version of the command.

                      node (nd)
                           The node about to be executed  is  printed,  along
                           with its arguments.

                      single_step (ss)
                           Just  before  a  network  is executed, the command
                           interpreter will stop, prompt for input  with  the
                           string  "continue?", and wait for a reply from the
                           user.  Inputs beginning  with  "n"  or  "N"  cause
                           execution  to  be  terminated;  other inputs cause
                           processing of commands  to  be  continued.   (This
                           option  is  most  useful  when used in conjunction
                           with the "command_line" option.)

                      port_descriptor (pd)
                           The port descriptor table used  by  the  shell  to
                           assign  files  to  the  standard  input and output
                           ports is dumped in symbolic format.  Along with  a
                           mnemonic  for  each  standard  port is printed the
                           file unit associated with it  and  the  source  or
                           destination of the data (file or pipe).

                      sv_save (sv)
                           This  option  causes the shell variables and their
                           values to be printed whenever they  are  saved  on
                           disk  (e.g.,  when  a  'stop' or 'save' command is
                           executed).

                      sv_restore (sr)
                           This option causes the shell variables  and  their
                           values to be printed whenever they are loaded from
                           disk  (e.g.,  when the Subsystem is started by the
                           'swt' command).

                      linked_strings (ls)
                           Whenever garbage collection  takes  place  in  the
                           linked  string  storage  area,  a  summary  of the
                           memory structure is printed.

                      location (lo)
                           Following the execution of  each  node,  the  full
                           pathname of the command just executed is printed.

          |           onunit (ou)
          |                Whenever  the  shell's  default onunit is invoked,
          |                the condition that was raised is printed.

                 In addition to these options, there  are  three  "shorthand"


            shtrace (1)                   - 2 -                   shtrace (1)




            shtrace (1) --- trace activity in command interpreter    02/22/82


                 options for specifying common combinations.  The "on" option
                 turns on the "node" and "execution" traces; "debug" turns on
                 "node",  "execution",  and "single_step"; "all" turns on all
                 traces available.

                 All traces may be turned off by executing 'shtrace' with  no
                 arguments.

                 'Shtrace'  prints  on  standard  output one an octal integer
                 reflecting the last state of  the  trace  control  variable,
                 suitable for saving in a shell variable or otherwise record-
                 ing  for  later use.  The special option "value" may be used
                 to simply print the current value of  the  control  variable
                 without  changing  it.   If  an octal integer is given as an
                 argument to 'shtrace', that bit pattern is assigned  to  the
                 trace control variable.  Thus, a user's trace options may be
                 changed and then reset to their original state.


            _E_x_a_m_p_l_e_s

                 shtrace on
                 shtrace
                 shtrace cn ss pd
                 set old_shtrace = [shtrace nd]
                 shtrace [old_shtrace]


            _S_e_e _A_l_s_o

                 dump  (1),  _U_s_e_r_'_s  _G_u_i_d_e  _f_o_r  _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m
                 _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r


























            shtrace (1)                   - 3 -                   shtrace (1)


