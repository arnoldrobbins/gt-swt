

            ld (1) --- interface with the Primos loader              08/27/84


          | _U_s_a_g_e

          |      ld [-(a|b|d|f|h|n|p|u|w)] { <binary file> |
          |                           -c <segment number>  |
          |                           -e <segment number>  |
          |                           -g <segment name>    |
          |                           -l <library file>    |
          |                           -m [ <map options> ] |
          |                           -i                   |
          |                           -t                   |
          |                           -s <loader command> }
          |                         [ -o <output file> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Ld'  is  used to call the Primos loader (SEG) from the Sub-
                 system.

                 The following global options indirectly affect  the  produc-
                 tion of loader commands:

                      -a   Modify  the load sequence to include run-time
                           support for Pascal programs.  This option may
                           be used with '-b' and '-p' for mixed-language
                           programs.

                      -b   Modify the load sequence to include  run-time
                           support  for  C programs.  (The load of the C
                           main program is triggered by  the  appearance
                           of  the  first binary file or library.)  This
                           option may be used with  '-a'  and  '-p'  for
          |                mixed-language programs.  Besides loading the
          |                C  run-time  library  "ciolib",  this  option
          |                automatically loads  the  SWT  math  library,
          |                "vswtmath",  and  the  shared  shell library,
          |                "vshlib".

                      -d   Produce a  SEG-compatible  segment  directory
                           rather  than  P300 memory image.  This option
                           must be used with the  source-level  debugger
                           (DBG) or when more than 64K of memory must be
                           initialized when a program is loaded (usually
                           Fortran     programs    with    block    data
                           subroutines).

                      -f   Generate a full load map after  commands  are
                           complete.   The  name of the map file will be
                           the same as the name of the output file  with
                           the  ".o"  suffix  (if any) replaced by ".m".
                           This option performs the same action  as  the
                           options  "-t  -m"  at the end of the argument
                           list.

                      -h   Suppress the inclusion of the  "mix"  command
                           in  the  load sequence, so that procedure and


            ld (1)                        - 1 -                        ld (1)




            ld (1) --- interface with the Primos loader              08/27/84


                           linkage will be loaded in different segments.

                      -n   Do not include the high-memory common  blocks
                           or load the default libraries unless the '-i'
                           and   '-t'  options  are  encountered.   This
                           allows the loading of non-Subsystem  programs
                           or  the  insertion  of additional loader com-
                           mands at the beginning and end of the load.

                      -p   Modify the load sequence to include  run-time
                           support  for  PL/I  subset  G programs.  This
                           option may be used with  '-a'  and  '-b'  for
                           mixed-language programs.

                      -u   Generate  a  load  map  of  undefined symbols
          |                after the default libraries have been loaded.

          |           -w   Modify the load sequence to include  run-time
          |                support for Prime C programs.

                 The  following  local  options  are  examined  in  the order
                 presented and directly produce commands to the loader:

                      <binary file> specifies a binary code file  to  be
                           loaded.

                      -c   <segment   number>  cause  subsequent  common
                           blocks to be loaded in the specified segment.
                           By default, common  blocks  are  loaded  into
                           segment  4001  (Fortran,  Ratfor)  or segment
                           4000 (PL/I G).

                      -e   <segment number> specifies the  default  seg-
                           ment number for a load using the "-v" option.
                           The  segment  numbers  used  for  the <binary
                           file>, -l <library file>, and  -t  directives
                           are  affected.   This option normally has use
                           only when a shared, multi-segment program  is
                           being loaded.

          |           -g   <segment  name>  causes  up  to 28 characters
          |                specified as <segment name> to  be  used  for
                           the  names  of  the  segments produced from a
                           load using  the  "-v"  option.   The  default
                           <segment name> is "..".  This option normally
                           has  use  only  when  a multi-segment, shared
                           program is being loaded.

                      -l   <library file> specifies a library file to be
                           loaded.

                      -s   <Primos  loader  command>  allows   arbitrary
                           loader commands to be inserted in the command
                           stream

                      -m   <map  options>  presents a map command to the


            ld (1)                        - 2 -                        ld (1)




            ld (1) --- interface with the Primos loader              08/27/84


                           loader.  If <map  options>  is  omitted,  the
                           first  "<binary  file>.m"  is  assumed.   (If
                           <binary file> ends  with  ".b",  the  "b"  is
                           replaced with an "m".)

                      -i   causes  the inclusion of the initial sequence
                           of Subsystem  program  loader  commands  (the
                           definition    of   Subsystem   common   block
                           locations and default segment for user common
                           blocks) to be  included,  regardless  of  the
                           "-n" global option.

                      -t   causes the inclusion of the terminal sequence
                           of   Subsystem  program  load  commands  (the
                           default library loads) to be included, regar-
                           dless of the "-n" global option.  If the "-n"
                           option is not specified, the sequence of com-
                           mands will be included at this point, so that
                           loader commands may  be  inserted  after  the
                           libraries  have been loaded.  This option may
                           be used with the "-m" option  to  generate  a
                           full load map.

                      -o   <output  file>  specifies the output file for
                           the results of the  load.   If  omitted,  the
                           first  "<binary  file>.o"  is  assumed.   (If
                           <binary file> ends  with  ".b",  the  "b"  is
                           replaced with an "o".)

                 Commands  are  presented to the loader in the order in which
                 they are encountered in the command line, except  for  "-o",
                 which appears only at the end of the command stream.


            _E_x_a_m_p_l_e_s

                 ld -du rf.b -t -m
                 ld sol.b -l vthlib -o sol
                 ld sh.b -s "sy kp$swt 165035" -o sh


            _B_u_g_s

                 'Ld' pays no attention to standard ports.

                 If  the  "-d"  option  is  not present, 'ld' must be able to
                 create files in the current directory.

                 All files specified must be disk files.


            _S_e_e _A_l_s_o

          |      fc (1), pc (1), plgc (1), f77c (1), pmac  (1),  x  (1),  rfl
          |      (1), xcc (1), xccl (1), bind (3)



            ld (1)                        - 3 -                        ld (1)


