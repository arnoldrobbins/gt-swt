

            pc (1) --- interface to Primos Pascal compiler           08/27/84


          | _U_s_a_g_e

                 pc {-<option>[<level>]} <input file>
                          [-b [<binary file>]]
                          [-l [<listing file>]]
                          [-z <PASCAL option>]
                    <option> ::= c | d | e | f | h | k | m | n |
                                 o | q | r | s | u | v | w | x


            _D_e_s_c_r_i_p_t_i_o_n

                 'Pc'  serves as the Subsystem interface to the Primos Pascal
                 compiler (PASCAL).  It examines  its  option  specifications
                 and   checks   them  for  consistency,  provides  Subsystem-
                 compatible default file names for  the  listing  and  binary
                 files  as  needed, and then produces a Primos PASCAL command
                 and causes it to be executed.

                 OOOppptttiiiooonnnsss

                 The general structure of an 'pc' option is a single  letter,
                 possibly  followed by a "level number" indicating the extent
                 to which an option should be employed.  The  following  list
                 outlines  the  options  and  the  meanings  of their various
                 levels.  The first line of  each  description  contains  the
                 option  letter  followed  by  its  default level enclosed in
                 parentheses, the  range  of  available  levels  enclosed  in
                 square  brackets,  and  a  brief description of the option's
                 purpose.  In all cases, when an option is specified  without
                 a level number, the maximum allowable value is assumed.


                 -c(0) [0..1] - Case.

                      Level 0 forces case to be insignificant in identifiers.
                      Upper case identifiers are considered the same as lower
                      case identifiers.

                      Level  1  cause  case  to  significant  in identifiers.
                      Upper case identifiers are  considered  different  from
                      lower case identifiers.

                 -d(0) [0..2] - Debugging control.

                      Level  0  prevents all debugging information from being
                      included in the generated code.  A program so  compiled
                      may not be used with the source level debugger.

                      Level  1  allows  limited  debugging  information to be
                      included in the generated code, but does not  interfere
                      with optimization.

                      Level  2  causes  complete  debugging information to be
                      included   in   the   generated   code   and   inhibits
                      optimization.   (Cannot be used when the "-o" option is


            pc (1)                        - 1 -                        pc (1)




            pc (1) --- interface to Primos Pascal compiler           08/27/84


                      specified with a level greater than zero.)

                 -e(1) [0..1] - Error listing on terminal.

                      Level 0 inhibits the printing of compilation errors  on
                      the user's terminal.

                      Level  1 causes compilation errors to be printed on the
                      terminal.

                 -f(2) [0..3] - Symbol table map and offset map control.

                      Level 0 inhibits the  generation  of  either  a  symbol
                      table  map  or  a  storage offset map.  (Cannot be used
                      when the "-x" option is specified with a level  greater
                      than zero.)

                      Level  1  causes  the  generation  of a map listing the
                      storage offset of  each  program  variable,  but  still
                      inhibits the generation of a a symbol table map.  (Can-
                      not  be  used  when the "-x" option is specified with a
                      level greater than zero.)

                      Level 2 causes the generation of a map listing the sym-
                      bol names appearing in the program,  but  inhibits  the
                      generation of a storage offset map.

                      Level  3 causes the generation of both the symbol table
                      and storage offset maps.

                 -h(0) [0..1] - Huge (multi-segment) arrays.

                      Level 0 insures that dummy arrays and array  parameters
                      will not be treated as multi-segment arrays.

                      Level  1  causes  references  to dummy arrays and array
                      parameters to generate code that will work even if  the
                      arrays  are  larger  than  one  segment  (64K words) in
                      length.

                 -k(0) [0..1] - Compilation statistics.

                      Level 0 inhibits the display of compilation  statistics
                      on the terminal.

                      Level 1 causes the display of compilation statistics on
                      the terminal.

                 -m(2) [2..3] - Addressing mode.

                      Level  2  implies 64V addressing mode.  At present this
                      is the only addressing mode fully supported  under  the
                      Subsystem.

                      Level  3  implies  32I  addressing  mode.  Code in this
                      addressing mode will not execute on a Prime 400.


            pc (1)                        - 2 -                        pc (1)




            pc (1) --- interface to Primos Pascal compiler           08/27/84


                 -n(1) [0..1] - Nesting level indicator.

                      Level 0 inhibits the printing of the nesting  level  of
                      each statement on the listing.

                      Level  1  causes  the  printing of the nesting level of
                      each statement.

                 -o(1) [0..1] - Optimization control.

                      Level 0 turns off all optimizations.

                      Level 1 turns on optimizations.  This option cannot  be
                      used with full debugging (-d2).

                 -q(1) [0..1] - Suppress warning messages.

                      Level  0  inhibits the display of compiler warning mes-
                      sages.

                      Level 1 allows the display  of  compiler  warning  mes-
                      sages.

                 -r(0) [0..1] - Range checking.

                      Level  0  inhibits  run-time checking of subscripts and
                      substrings.

                      Level 1 causes the compiler to insert code for the run-
                      time checking of subscripts and substrings.

                 -s(0) [0..1] - Check for use of non-standard features.

                      Level 0 allows all features of Prime Pascal.

                      Level 1 generates a syntax error for  the  use  of  any
                      feature not in the proposed ANSI standard.

                 -u(0) [0..1] - Generate external procedure definition.

                      Level   0  does  not  generate  an  external  procedure
                      definition.

                      Level 1 generates an external procedure definition.

                 -v(1) [0..2] - Listing verbosity.

                      Level 0 prevents the listing of source code, but allows
                      the listing  of  error  messages  and  statements  that
                      caused them.

                      Level 1 generates a full source code listing.

                      Level  2  generates  a  full source code listing plus a
                      representation of the machine code generated  for  each
                      statement.


            pc (1)                        - 3 -                        pc (1)




            pc (1) --- interface to Primos Pascal compiler           08/27/84


                 -w(0) [0..1] - Generate floating round instructions.

                      Level 0 does not generate floating round (FRN) instruc-
                      tions.

                      Level  1 cause a floating round (FRN) instruction to be
                      generated before every floating store (FST) instruction
                      in the code produced  by  the  PASCAL  compiler.   This
                      option improves the accuracy of single precision float-
                      ing  point  calculations  at  some slight run-time per-
                      formance expense.

                 -x(1) [0..1] - Cross-reference listing control.

                      Level 0 inhibits the generation of a cross-reference.

                      Level 1  causes  the  compiler  to  generate  a  cross-
                      reference  listing.   (Cannot  be  used  when  the "-f"
                      option is specified with a level less than two.)

                 In addition to the options above, the "-z" option allows the
                 explicit passing of a string verbatim into the command line.

                 FFFiiillleee CCCooonnntttrrrooolll

                 The "-b" option is used to select the name of  the  file  to
                 receive the binary object code output of the compiler.  If a
                 file  name  follows  the option, then that file receives the
                 object code.  (Note that if "/dev/null" is specified as  the
                 file  name, no object code will be produced.)  If the option
                 is not specified, or no file  name  follows  it,  a  default
                 filename  is constructed from the input filename by changing
                 its suffix to ".b".  For example, if the input  filename  is
                 "prog.p",  the  binary  file  will be "prog.b"; if the input
                 filename is "foo", the binary file will be "foo.b".

                 The "-l" option is used to select the name of  the  file  to
                 receive  the  listing  generated by the compiler.  If a file
                 name  follows  the  option,  then  that  file  receives  the
                 listing.   The  file name "/dev/null" may be used to inhibit
                 the listing; "/dev/tty" to cause it to appear on the  user's
                 terminal;  "/dev/lps"  to cause it to be spooled to the line
                 printer.  If the "-l" option is  specified  without  a  file
                 name  following  it,  a default filename is constructed from
                 the input filename by changing  its  suffix  to  ".l".   For
                 example,  if  the  input  filename is "gonzo.p", the listing
                 file will be "gonzo.l"; if the input filename is "bar",  the
                 listing  file  will  be  "bar.l".  If the "-l" option is not
                 used, no listing is produced.

                 The input filename may be either  a  disk  file  name  (con-
                 ventionally  ending  in  ".p"  or  ".pascal")  or the device
                 "/dev/tty", in which case input to the compiler is read from
                 the user's terminal.

                 In summary, then, the default command line for  compiling  a


            pc (1)                        - 4 -                        pc (1)




            pc (1) --- interface to Primos Pascal compiler           08/27/84


                 file named "file.p" is

                      pc -c0d0e1f2h0k0m2n1o1q1r0s0u0v1w0x1 _
                           file.p  -b file.b  -l /dev/null

                 which corresponds to the PASCAL command

                      pascal -i *>file.p -b *>file.b -l no



            _E_x_a_m_p_l_e_s

                 pc file.p
                 pc -kf dmach.p
                 pc -x dmach.p -b b_dmach -l l_dmach
                 pc -m3 i_mode_prog.p -z"-newopt"


            _M_e_s_s_a_g_e_s

                 "Usage:  pc ..."  for invalid option syntax.
                 "level   numbers   for   -<option>   are   <lower bound>  to
                      <upper bound>"  if  an  out-of-range  level  number  is
                      specified.
                 "missing  input  file  name"  if  no input filename could be
                      found.
                 "<name>:  unreasonable input file name" if  an  attempt  was
                      made  to  read from the null device or the line printer
                      spooler.
                 "<name>:  unreasonable binary file name" if an  attempt  was
                      made  to  produce  object  code on the terminal or line
                      printer spooler.
                 "inconsistency in internal tables" if  the  tables  used  to
                      process  the options are incorrectly constructed.  This
                      message indicates a serious error in the  operation  of
                      'pc'   that   should   be   reported   to  your  system
                      administrator.

                 Numerous other self-explanatory messages may be generated to
                 diagnose conflicts between selected options.


            _B_u_g_s

                 'Pc' pays no attention to standard ports.


            _S_e_e _A_l_s_o

          |      ld (1), pcl (1), file$p (2), geta$p (2),  init$p  (2),  bind
          |      (3)






            pc (1)                        - 5 -                        pc (1)


