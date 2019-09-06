

            bmerge (5) --- merge object code files into one file     01/03/83


            _U_s_a_g_e

                 bmerge {<object file>}


            _D_e_s_c_r_i_p_t_i_o_n

                 'Bmerge'  is a program which will take the object code files
                 given as arguments, if any, and create  a  new  object  code
                 file  that is written to standard output.  If you build your
                 programs as separately compiled modules,  with  each  module
                 containing  many subroutines/functions, you can use 'bmerge'
                 to combine those modules into one object code file for buil-
                 ding a library.

                 'Bmerge' accepts directives from standard input to  indicate
                 the  order  and  type  of  subprograms to be included in the
                 resulting object code file; by default, no subprograms  will
                 be included if there is no input.

                 The  following may be included in the input stream to direct
                 the creation of the object code file :

                      _i_n_p_u_t _i_t_e_m         _m_e_a_n_i_n_g
                      <name>             include the named subprogram at the
                                         current point in the object code
                      .rfl               reset the "forced load" flag at this
                                         point
                      .sfl               set the "forced load" flag at this
                                         point

                 A sample input stream would be :

                      ave
                      .sfl
                      add
                      sub
                      mul
                      .rfl
                      div

                 If the files specified in the  argument  list  contain  more
                 than  one  occurrence of an entry point name (i.e., possibly
                 different versions of the same subprogram), then the version
                 which gets included depends on the order in which the  files
                 were   specified   in   the  command  invocation.   Multiple
                 occurrences of an entry point name in the input to  'bmerge'
                 causes  inclusion of more than one version of the named sub-
                 program, with the inclusion order being the reverse  of  the
                 order of occurrence (last-in, first-out basis).


            _E_x_a_m_p_l_e_s

                 entry_names> bmerge ave.b ave_lib.b >new_ave.b
                 files .b$ | change .b$ | bmerge [files .b$] >all_object.b


            bmerge (5)                    - 1 -                    bmerge (5)




            bmerge (5) --- merge object code files into one file     01/03/83


            _M_e_s_s_a_g_e_s

                 "<name>: too  many  object  files"  when trying to merge too
                      many object code files at the same time.
                 "<name>: not found in object files" when trying to include a
                      nonexistant routine.
                 "bad object file..."  for an ill-formatted object code file.
                 "<name>: error copying object module" if the length  of  the
                      routine in the resulting object code file is not of the
                      same length as in the source file.
                 "block size (<size>) exceeds buffer space" if the next block
                      to  be  read  from the input object code file is larger
                      than the program's file buffer.
                 "<name>: extraneous END block" for object code  files  which
                      have too many END blocks.

                 various error messages from the dynamic storage routines


            _B_u_g_s

                 Binary  output is used to generate the resulting object code
                 file.  If standard output  is  the  terminal,  unpredictable
                 results  may  be obtained because of the irrational behavior
                 of binary I/O to the terminal.

                 Internal     procedures     (procedures/functions     within
                 procedures/functions)  in  PL/1,  Pascal, or PL/P modules if
                 specified by name, will not be merged correctly.

                 If a module has multiple entry points, only the first one is
                 recognized.


            _S_e_e _A_l_s_o

                 bnames (5), brefs (5), ld (1), lorder (1)





















            bmerge (5)                    - 2 -                    bmerge (5)


