

            f77c (1) --- interface to Primos Fortran 77 compiler     08/27/84


          | _U_s_a_g_e

                 f77c {-<option>[<level>]} <input file>
                          [-b [<binary file>]]
                          [-l [<listing file>]]
                          [-z <F77 option>]
                    <option> ::= c | d | e | f | g | h | i | k | m |
                                 o | q | r | s | t | u | v | w | x


            _D_e_s_c_r_i_p_t_i_o_n

                 'F77c'  serves  as  the  Subsystem  interface  to the Primos
                 Fortran  77  compiler  (F77).   It   examines   its   option
                 specifications  and  checks  them  for consistency, provides
                 Subsystem-compatible default file names for the listing  and
                 binary  files as needed, and then produces a Primos F77 com-
                 mand and causes it to be executed.

                 OOOppptttiiiooonnnsss

                 The general structure of an 'f77c' option is a  single  let-
                 ter,  possibly  followed  by a "level number" indicating the
                 extent to which an option should be employed.  The following
                 list outlines the options and the meanings of their  various
                 levels.   The  first  line  of each description contains the
                 option letter followed by  its  default  level  enclosed  in
                 parentheses,  the  range  of  available  levels  enclosed in
                 square brackets, and a brief  description  of  the  option's
                 purpose.   In all cases, when an option is specified without
                 a level number, the maximum allowable value is assumed.


                 -c(0) [0..1] - Case.

                      Level 0 forces case to be insignificant in identifiers.
                      Upper case identifiers are considered the same as lower
                      case identifiers.

                      Level 1  cause  case  to  significant  in  identifiers.
                      Upper  case  identifiers  are considered different from
                      lower case identifiers.

                 -d(0) [0..2] - Debugging control.

                      Level 0 prevents all debugging information  from  being
                      included  in the generated code.  A program so compiled
                      may not be used with the source level debugger.

                      Level 1 allows  limited  debugging  information  to  be
                      included  in the generated code, but does not interfere
                      with optimization.

                      Level 2 causes complete  debugging  information  to  be
                      included   in   the   generated   code   and   inhibits
                      optimization.  This option cannot  be  used  with  full


            f77c (1)                      - 1 -                      f77c (1)




            f77c (1) --- interface to Primos Fortran 77 compiler     08/27/84


                      optimization (-o3).

                 -e(1) [0..1] - Error listing on terminal.

                      Level  0 inhibits the printing of compilation errors on
                      the user's terminal.

                      Level 1 causes compilation errors to be printed on  the
                      terminal.

                 -f(0) [0..1] - Offset map.

                      Level  0  inhibits  the  generation of a storage offset
                      map.

                      Level 1 cause the  generation  of  a  map  listing  the
                      storage offset of each program variable.

                 -g(0) [0..1] - Logical precision.

                      Level  0  causes  the  compiler  to allocate 16 bits (1
                      word) for each logical variable or constant.

                      Level 1 causes the compiler  to  allocate  32  bits  (2
                      words) for each logical variable or constant.

                 -h(0) [0..1] - Huge (multi-segment) arrays.

                      Level  0 insures that dummy arrays and array parameters
                      will not be treated as multi-segment arrays.

                      Level 1 causes references to  dummy  arrays  and  array
                      parameters  to generate code that will work even if the
                      arrays are larger  than  one  segment  (64K  words)  in
                      length.   This  option  is  allowed  only when the "-m"
                      option is at level 2.

                 -i(0) [0..1] - Integer precision.

                      Level 0 causes the compiler to assign 16 bits (1  word)
                      to each integer variable or constant.

                      Level 1 causes the compiler to assign 32 bits (2 words)
                      to each integer variable or constant.

                 -k(0) [0..1] - Compilation statistics.

                      Level  0 inhibits the display of compilation statistics
                      on the terminal.

                      Level 1 causes the display of compilation statistics on
                      the terminal.






            f77c (1)                      - 2 -                      f77c (1)




            f77c (1) --- interface to Primos Fortran 77 compiler     08/27/84


                 -m(2) [2..3] - Addressing mode.

                      Level 2 implies 64V addressing mode.  At  present  this
                      is  the  only addressing mode fully supported under the
                      Subsystem.

                      Level 3 implies 32I  addressing  mode.   Code  in  this
                      addressing mode will not execute on a Prime 400.

                 -o(2) [0..3] - Optimization control.

                      Level 0 turns off all optimizations.

                      Level 1 turns on pattern replacement optimizations.

                      Level  2  turns  on  pattern  replacement  and strength
                      reduction optimizations.

                      Level   3   turns   on   all   optimizations   (pattern
                      replacement,   strength   reduction,   and  removal  of
                      invariants in DO-loops).  This option  cannot  be  used
                      with full debugging (-d2).

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

                 -s(1) [0..1] - Storage allocation control.

                      Level 0  requires  that  all  subprogram  variables  be
                      allocated    statically    (the    usual    case    for
                      implementations of Fortran, although  not  required  by
                      the standard).

                      Level  1  requires  that  all  subprogram variables not
                      named  in  SAVE  declarations  or  DATA  statements  be
                      allocated  dynamically  on  the  run-time  stack.  This
                      permits recursion and more efficient use of memory, and
                      is the normal mode of usage under the Subsystem.







            f77c (1)                      - 3 -                      f77c (1)




            f77c (1) --- interface to Primos Fortran 77 compiler     08/27/84


                 -t(0) [0..1] - DO-loop trip control.

                      Level 0 causes all DO loops to be of the zero  or  more
                      iteration (Fortran 77 standard) type.

                      Level  1  causes  all DO loops to be of the one or more
                      iteration (Fortran 66 standard) type.

                 -u(1) [0..1] - Undeclared variable checking.

                      Level 0 prevents the compiler from flagging  undeclared
                      variables as errors.

                      Level  1  causes  the  compiler  to  report  undeclared
                      variables as errors.  This enforces (one hopes)  better
                      programming  practices  and reduces the number of hard-
                      to-find semantic errors in programs.

                 -v(1) [0..2] - Listing verbosity.

                      Level 0 prevents the listing of source code, but allows
                      the listing  of  error  messages  and  statements  that
                      caused them.

                      Level 1 generates a full source code listing.

                      Level  2  generates  a  full source code listing plus a
                      representation of the machine code generated  for  each
                      statement.

                 -w(0) [0..1] - Generate floating round instructions.

                      Level 0 does not generate floating round (FRN) instruc-
                      tions.

                      Level  1 cause a floating round (FRN) instruction to be
                      generated before every floating store (FST) instruction
                      in the code produced by the F77 compiler.  This  option
                      improves  the  accuracy  of  single  precision floating
                      point calculations at some slight run-time  performance
                      expense.

                 -x(1) [0..2] - Cross-reference listing control.

                      Level 0 inhibits the generation of a cross-reference.

                      Level  1  causes  the  compiler  to  generate  a cross-
                      reference listing containing all  variables  referenced
                      in  executable  statements  and omitting those that are
                      declared but never referenced.

                      Level 2 causes the compiler to generate a  full  cross-
                      reference of all variables.

                 In addition to the options above, the "-z" option allows the
                 explicit passing of a string verbatim into the command line.


            f77c (1)                      - 4 -                      f77c (1)




            f77c (1) --- interface to Primos Fortran 77 compiler     08/27/84


                 FFFiiillleee CCCooonnntttrrrooolll

                 The  "-b"  option  is used to select the name of the file to
                 receive the binary object code output of the compiler.  If a
                 file name follows the option, then that  file  receives  the
                 object  code.  (Note that if "/dev/null" is specified as the
                 file name, no object code will be produced.)  If the  option
                 is  not  specified,  or  no  file name follows it, a default
                 filename is constructed from the input filename by  changing
                 its  suffix  to ".b".  For example, if the input filename is
                 "prog.f77", the binary file will be "prog.b"; if  the  input
                 filename is "foo", the binary file will be "foo.b".

                 The  "-l"  option  is used to select the name of the file to
                 receive the listing generated by the compiler.   If  a  file
                 name  follows  the  option,  then  that  file  receives  the
                 listing.  The file name "/dev/null" may be used  to  inhibit
                 the  listing; "/dev/tty" to cause it to appear on the user's
                 terminal; "/dev/lps" to cause it to be spooled to  the  line
                 printer.   If  the  "-l"  option is specified without a file
                 name following it, a default filename  is  constructed  from
                 the  input  filename  by  changing  its suffix to ".l".  For
                 example, if the input filename is "gonzo.f77",  the  listing
                 file  will be "gonzo.l"; if the input filename is "bar", the
                 listing file will be "bar.l".  If the  "-l"  option  is  not
                 used, no listing is produced.

                 The  input  filename  may  be  either a disk file name (con-
                 ventionally ending in ".f77", ".f" or ".df") or  the  device
                 "/dev/tty", in which case input to the compiler is read from
                 the user's terminal.

                 In  summary,  then, the default command line for compiling a
                 file named "file.f77" is

                      f77c -c0d0e1f0g0h0i0k0m2o2q1r0s1t0u1v1w1x1 _
                           file.f77  -b file.b  -l /dev/null

                 which corresponds to the F77 command

                      f77 -i *>file.f77 -b *>file.b -l no -ints -logs



            _E_x_a_m_p_l_e_s

                 f77c file.f77
                 f77c -ig dmach.f77
                 f77c -x dmach.f77 -b b_dmach -l l_dmach
                 f77c -m3 i_mode_prog.f77 -z"-newopt"


            _M_e_s_s_a_g_e_s

                 "Usage:  f77c ..."  for invalid option syntax.
                 "level  numbers   for   -<option>   are   <lower bound>   to


            f77c (1)                      - 5 -                      f77c (1)




            f77c (1) --- interface to Primos Fortran 77 compiler     08/27/84


                      <upper bound>"  if  an  out-of-range  level  number  is
                      specified.
                 "missing input file name" if  no  input  filename  could  be
                      found.
                 "<name>:   unreasonable  input  file name" if an attempt was
                      made to read from the null device or the  line  printer
                      spooler.
                 "<name>:   unreasonable  binary file name" if an attempt was
                      made to produce object code on  the  terminal  or  line
                      printer spooler.
                 "inconsistency  in  internal  tables"  if the tables used to
                      process the options are incorrectly constructed.   This
                      message  indicates  a serious error in the operation of
                      'f77c'  that  should  be  reported   to   your   system
                      administrator.

                 Numerous other self-explanatory messages may be generated to
                 diagnose conflicts between selected options.


            _B_u_g_s

                 'F77c' pays no attention to standard ports.


            _S_e_e _A_l_s_o

          |      f77cl (1), ld (1), init$f (2), bind (3)






























            f77c (1)                      - 6 -                      f77c (1)


