

            fc (1) --- interface to Primos Fortran compiler          08/27/84


          | _U_s_a_g_e

                 fc {-<option>[<level>]} <input file>
                          [-b [<binary file>]]
                          [-l [<listing file>]]
                          [-z <FTN option>]
                    <option> ::= d | e | f | h | i | k | m | o | p | q |
                                 r | s | t | u | v | w | x


            _D_e_s_c_r_i_p_t_i_o_n

                 'Fc' serves as the Subsystem interface to the Primos Fortran
                 66  compiler  (FTN).   It examines its option specifications
                 and  checks  them  for  consistency,   provides   Subsystem-
                 compatible  default  file  names  for the listing and binary
                 files as needed, and then produces a Primos FTN command  and
                 causes it to be executed.

                 OOOppptttiiiooonnnsss

                 The  general structure of an 'fc' option is a single letter,
                 possibly followed by a "level number" indicating the  extent
                 to  which  an option should be employed.  The following list
                 outlines the options  and  the  meanings  of  their  various
                 levels.   The  first  line  of each description contains the
                 option letter followed by  its  default  level  enclosed  in
                 parentheses,  the  range  of  available  levels  enclosed in
                 square brackets, and a brief  description  of  the  option's
                 purpose.   In all cases, when an option is specified without
                 a level number, the maximum allowable value is assumed.


                 -d(0) [0..2] - Debugging control.

                      Level 0 prevents all debugging information  from  being
                      included  in the generated code.  A program so compiled
                      may not be used with the source level debugger.

                      Level 1 allows  limited  debugging  information  to  be
                      included  in the generated code, but does not interfere
                      with optimization.

                      Level 2 causes complete  debugging  information  to  be
                      included   in   the   generated   code   and   inhibits
                      optimization.  (Cannot be used when the "-o" option  is
                      specified with a level greater than zero.)

                 -e(1) [0..1] - Error listing on terminal.

                      Level  0 inhibits the printing of compilation errors on
                      the user's terminal.

                      Level 1 causes compilation errors to be printed on  the
                      terminal.



            fc (1)                        - 1 -                        fc (1)




            fc (1) --- interface to Primos Fortran compiler          08/27/84


                 -f(1) [0..1] - Floating point instruction restriction.

                      Level 0 causes the compiler to avoid generating certain
                      types  of  floating  point  instructions  that  are not
                      available on all Prime machines.  This level is allowed
                      only when the "-m" option is at levels 0 or 1.

                      Level 1 allows the compiler to use the entire  floating
                      point instruction set.

                 -h(0) [0..1] - Huge (multi-segment) arrays.

                      Level  0 insures that dummy arrays and array parameters
                      will not be treated as multi-segment arrays.

                      Level 1 causes references to  dummy  arrays  and  array
                      parameters  to generate code that will work even if the
                      arrays are larger  than  one  segment  (64K  words)  in
                      length.   This  option  is  allowed  only when the "-m"
                      option is at level 2.

                 -i(0) [0..1] - Integer precision.

                      Level 0 causes objects declared to be of type "integer"
                      to be assigned to 16 bit storage locations.

                      Level 1 causes objects declared to be of type "integer"
                      and all integer constants to  be  assigned  to  32  bit
                      storage  locations.   This  is  occasionally  useful in
                      transporting Fortran  code  written  on  or  for  other
                      systems.   Beware  of interactions with Primos and Sub-
                      system support routines which normally  require  16-bit
                      parameters.

                 -k(0) [0..1] - Compilation statistics.

                      Level  0 inhibits the display of compilation statistics
                      on the terminal.

                      Level 1 causes the display of compilation statistics on
                      the terminal.

                 -m(2) [0..2] - Addressing mode.

                      Level 0 implies 32R addressing mode.  Large arrays  ("-
                      h1"), dynamic storage allocation ("-s1"), and debugging
                      ("-d1" or "-d2") may not be used in this mode.

                      Level  1 implies 64R addressing mode.  Large arrays ("-
                      h1"), dynamic storage allocation ("-s1"), and debugging
                      ("-d1" or "-d2") may not be used in this mode.

                      Level 2 implies 64V addressing mode.  At  present  this
                      is  the  only addressing mode fully supported under the
                      Subsystem.



            fc (1)                        - 2 -                        fc (1)




            fc (1) --- interface to Primos Fortran compiler          08/27/84


                 -o(1) [0..2] - Optimization control.

                      Level 0 turns off all optimizations.

                      Level 1 turns on "safe" optimizations (strength  reduc-
                      tion  and  removal  of  invariants  in DO-loops).  This
                      option cannot be used with full debugging ("-d2").

                      Level 2 turns on "unsafe" optimizations (same as  level
                      1,  but  applied even to loops that may make use of the
                      Fortran extended-range feature).  This option cannot be
                      used  with  full  debugging  ("-d2").   Note:    Ratfor
                      generates  GOTO  instructions to implement its internal
                      procedures.  If a Ratfor internal procedure  is  called
                      from  within  a DO loop, this option _c_a_n_n_o_t be used for
                      the program.

                 -p(0) [0..1] - Entry control block allocation.

                      Level  0  disallows  mixing  of  procedures  and  entry
                      control blocks.

                      Level  1  allows mixing of procedures and entry control
                      blocks.  Selection of this option is  valid  only  when
                      the "-m" option is at level 2.

                 -q(0) [0..1] - Quirk control.

                      Level  0  disallows  the  use of certain statements and
                      declarations designed for use by systems programmers.

                      Level  1  allows  the  use  of  these  statements   and
                      declarations.  A side effect of selecting this level is
                      that  the  compiler flags undeclared variables, regard-
                      less of the level of the "-u" option.

                 -r(0) [0..1] - Instruction reach control.

                      Level 0 causes the compiler to generate short  instruc-
                      tions for all variable references.

                      Level  1  causes  the  compiler  to generate long-reach
                      instructions for all variable references.  This  option
                      is valid only when the "-m" option is at level 0 or 1.

                 -s(1) [0..1] - Storage allocation control.

                      Level  0  requires  that  all  subprogram  variables be
                      allocated    statically    (the    usual    case    for
                      implementations  of  Fortran,  although not required by
                      the standard).

                      Level 1 requires  that  all  subprogram  variables  not
                      named  in  SAVE  declarations  or  DATA  statements  be
                      allocated dynamically  on  the  run-time  stack.   This
                      permits recursion and more efficient use of memory, and


            fc (1)                        - 3 -                        fc (1)




            fc (1) --- interface to Primos Fortran compiler          08/27/84


                      is  the  normal  mode  of  usage  under  the Subsystem.
                      Dynamic allocation cannot be used unless the addressing
                      mode is 64V (-m2).

                 -t(0) [0..1] - Run-time trace control.

                      Level 0 causes no run-time trace code to be emitted.

                      Level 1 causes the compiler to  emit  trace  code  that
                      prints  statement numbers when they are encountered and
                      records  assignments  to  variables.   Warning:    this
                      option can produce reams of output!

                 -u(1) [0..1] - Undeclared variable checking.

                      Level  0 prevents the compiler from flagging undeclared
                      variables as errors.

                      Level  1  causes  the  compiler  to  report  undeclared
                      variables  as errors.  This enforces (one hopes) better
                      programming practices and reduces the number  of  hard-
                      to-find semantic errors in programs.

                 -v(1) [0..2] - Listing verbosity.

                      Level 0 prevents the listing of source code, but allows
                      the  listing  of  error  messages  and  statements that
                      caused them.

                      Level 1 generates a full source code listing.

                      Level 2 generates a full source  code  listing  plus  a
                      representation  of  the machine code generated for each
                      statement.

                 -w(0) [0..1] - Generate floating round instructions.

                      Level 0 does not generate floating round (FRN) instruc-
                      tions.

                      Level 1 cause a floating round (FRN) instruction to  be
                      generated before every floating store (FST) instruction
                      in  the code produced by the FTN compiler.  This option
                      improves the  accuracy  of  single  precision  floating
                      point  calculations at some slight run-time performance
                      expense.

                 -x(1) [0..2] - Cross-reference listing control.

                      Level 0 inhibits the generation of a cross-reference.

                      Level 1  causes  the  compiler  to  generate  a  cross-
                      reference  listing  containing all variables referenced
                      in executable statements and omitting  those  that  are
                      declared but never referenced.



            fc (1)                        - 4 -                        fc (1)




            fc (1) --- interface to Primos Fortran compiler          08/27/84


                      Level  2  causes the compiler to generate a full cross-
                      reference of all variables.

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
                 "prog.f",  the  binary  file  will be "prog.b"; if the input
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
                 example,  if  the  input  filename is "gonzo.f", the listing
                 file will be "gonzo.l"; if the input filename is "bar",  the
                 listing  file  will  be  "bar.l".  If the "-l" option is not
                 used, no listing is produced.

                 The input filename may be either  a  disk  file  name  (con-
                 ventionally  ending in ".f", ".ftn", or ".df") or the device
                 "/dev/tty", in which case input to the compiler is read from
                 the user's terminal.

                 In summary, then, the default command line for  compiling  a
                 file named "file.f" is

                      fc -d0e1f1h0i0k0m2o1p0q0r0s1t0u1v1w0x1 _
                           file.f  -b file.b  -l /dev/null

                 which corresponds to the FTN command

                      ftn -i *>file.f -b *>file.b -l no -64v -dcl -dynm -opt



            _E_x_a_m_p_l_e_s

                 fc file.f
                 fc -i -u0 dmach.f
                 fc -x dmach.f -b b_dmach -l l_dmach
                 fc -m1 r_mode_prog.f -z"-debase -nofp"


            fc (1)                        - 5 -                        fc (1)




            fc (1) --- interface to Primos Fortran compiler          08/27/84


            _M_e_s_s_a_g_e_s

                 "Usage:  fc ..."  for invalid option syntax.
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
                      'fc'   that   should   be   reported   to  your  system
                      administrator.

                 Numerous other self-explanatory messages may be generated to
                 diagnose conflicts between selected options.


            _B_u_g_s

                 'Fc' pays no attention to standard ports.


            _S_e_e _A_l_s_o

          |      fcl (1), ld (1), rfl (1), init$f (2), bind (3)


























            fc (1)                        - 6 -                        fc (1)


