

            bind (3) --- interface with the Primos EPF loader        08/08/83


          | _U_s_a_g_e

          |      bind [-(a|b|f|n|p|u)] { <binary file>     |
          |                           -d [ <entry name> ]  |
          |                           -l <library file>    |
          |                           -m [ <map file> ]    |
          |                           -i                   |
          |                           -t                   |
          |                           -s <loader command> }
          |                           [ -o <output file> ]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Bind'  calls the Primos EPF loader (BIND) from the Software
          |      Tools subsystem.

          |      The following global options indirectly affect  the  produc-
          |      tion of loader commands:

          |           -a   Modify  the load sequence to include run-time
          |                support for Pascal programs.  This option may
          |                be used with '-b' and '-p' for mixed-language
          |                programs.

          |           -b   Modify the load sequence to include  run-time
          |                support  for  C programs.  (The load of the C
          |                main program is triggered by  the  appearance
          |                of  the  first binary file or library.)  This
          |                option may be used with  '-a'  and  '-p'  for
          |                mixed-language programs.  Besides loading the
          |                C  run-time  library,  "ciolib",  this option
          |                automatically loads  the  SWT  math  library,
          |                "vswtmath",  and  the  shared  shell library,
          |                "vshlib".

          |           -d   Cause all unresolved external  references  at
          |                the  end  of  the  load  to  be resolved with
          |                Primos direct entry links.

          |           -f   Generate a full load map after  commands  are
          |                complete.   The  name of the map file will be
          |                the same as the name of the output file  with
          |                the  ".o"  suffix  (if any) replaced by ".m".
          |                This option performs the same action  as  the
          |                options  "-t  -m"  at the end of the argument
          |                list.

          |           -n   Do not declare the SWT common blocks or  load
          |                the  default  libraries  unless  the '-i' and
          |                '-t' options are  encountered.   This  allows
          |                the  loading of non-Subsystem programs or the
          |                insertion of additional  loader  commands  at
          |                the beginning and end of the load.

          |           -p   Modify  the load sequence to include run-time


            bind (3)                      - 1 -                      bind (3)




            bind (3) --- interface with the Primos EPF loader        08/08/83


          |                support for PL/I  subset  G  programs.   This
          |                option  may  be  used  with '-a' and '-b' for
          |                mixed-language programs.

          |           -u   Generate a  load  map  of  undefined  symbols
          |                after the default libraries have been loaded.

          |           -w   Modify  the load sequence to include run-time
          |                support for Prime C programs.

          |      The following  local  options  are  examined  in  the  order
          |      presented and directly produce commands to the loader:

          |           <binary  file>  specifies a binary code file to be
          |                loaded.

          |           -l   <library file> specifies a library file to be
          |                loaded.

          |           -s   <Bind loader command> allows arbitrary loader
          |                commands to be inserted in the command stream

          |           -m   <map file> presents  a  map  command  to  the
          |                loader.   If <map file> is omitted, the first
          |                "<binary file>.m" is  assumed.   (If  <binary
          |                file>  ends  with  ".b",  the "b" is replaced
          |                with an "m".)

          |           -i   causes the inclusion of the initial  sequence
          |                of  Subsystem  program  loader  commands (the
          |                definition   of   Subsystem   common    block
          |                locations)  to be included, regardless of the
          |                "-n" global option.

          |           -t   causes the inclusion of the terminal sequence
          |                of  Subsystem  program  load  commands   (the
          |                default library loads) to be included, regar-
          |                dless of the "-n" global option.  If the "-n"
          |                option is not specified, the sequence of com-
          |                mands will be included at this point, so that
          |                loader  commands  may  be  inserted after the
          |                libraries have been loaded.  This option  may
          |                be  used  with  the "-m" option to generate a
          |                full load map.

          |           -o   <output file> specifies the output  file  for
          |                the  results  of  the  load.  If omitted, the
          |                first  "<binary  file>.o"  is  assumed.   (If
          |                <binary  file>  ends  with  ".b",  the "b" is
          |                replaced with an "o".)

          |      Commands are presented to the loader in the order  in  which
          |      they  are  encountered in the command line, except for "-o",
          |      which appears only at the end of the command stream.




            bind (3)                      - 2 -                      bind (3)




            bind (3) --- interface with the Primos EPF loader        08/08/83


          | _E_x_a_m_p_l_e_s

          |      bind -u rf.b -t -m
          |      bind sol.b -o sol -d
          |      bind test.b -d at$ -o test
          |      bind sh.b -s "ma -symbols" -o sh -f


          | _B_u_g_s

          |      'Bind' pays no attention to standard ports.

          |      'Bind' must be able to create files in  the  current  direc-
          |      tory.

          |      All files specified must be disk files.

          |      EPF's  are  not  currently  supported and Primos BIND is not
          |      currently documented.  Use of this  command  is  discouraged
          |      until Prime supports EPF's.


          | _S_e_e _A_l_s_o

          |      fc  (1),  pc  (1),  plgc (1), f77c (1), pmac (1), x (1), rfl
          |      (1), ld (1)
































            bind (3)                      - 3 -                      bind (3)


