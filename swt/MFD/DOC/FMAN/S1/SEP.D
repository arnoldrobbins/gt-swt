

            sep (1) --- separate compilation facility for Ratfor programs  08/27/84


          | _U_s_a_g_e

                 sep <prog> ( <module> { <module> }
                            | -all | -cat | -stacc | -xref | -names | -link
                            | -mklink     | -print [ <spool options> ]
                            )


            _D_e_s_c_r_i_p_t_i_o_n

                 'Sep'  is  a shell program that assists in maintaining large
                 Ratfor programs  with  modules  stored  in  separate  files.
                 'Sep' insists on a number of file naming conventions so that
                 it can locate all the files for a given program.  First, all
                 files  must be stored in the same directory, and that direc-
                 tory must be the current directory when  'sep'  is  invoked.
                 The program name <prog> is part of each source file name and
                 is  the name of the executable file produced.  A module name
                 <module> is an arbitrarily selected  name  for  a  group  of
                 routines  contained in the same file.  A module is the smal-
                 lest unit that can be compiled separately.  There may be  an
                 arbitrary number of modules.

                 'Sep'  requires a number of files to be able to successfully
                 compile a program.  All definitions global  to  the  program
                 must be placed in the file "<prog>_def.i"; they are included
                 each  time  a  module is preprocessed.  Even if there are no
                 definitions for a particular  program,  this  file  must  be
                 present.   A  linkage statement naming all subroutine, func-
                 tion, and common block names must be  present  in  the  file
                 "<prog>_link.i".   (If you choose, 'sep' will build the file
                 containing the linkage statement for you; see the  "-mklink"
                 option.)   Finally, the main program (and other routines, if
                 desired) must be present in a file named "<prog>.r".

                 There are a number of other files that can  be  present  and
                 will  be  used  by  'sep'  in  compiling  a  program.  Files
                 containing   groups   of   subprograms   should   be   named
                 "<prog>_<module>.r".    Files   of   this  type  define  the
                 separately  compiled  "modules".   A  Stacc  parser  may  be
                 present  in  the file "<prog>.stacc"; it is converted to the
                 Ratfor module "<prog>_stacc.r" on command.  The  definitions
                 generated  from  the  Stacc  code  are  placed  in  the file
                 "<prog>_def.stacc.i"; there must be an include statement for
                 this file in "<prog>_def.i".  If the program has an  include
                 file  for  common blocks, it must be named "<prog>_com.i" or
                 "<prog>_com.r.i", but 'sep' does not  automatically  include
                 it during compilation.

                 Other  files  that  may be present are "<prog>.ldproc" which
                 should contain an 'ld' command for linking the binary files;
                 if this file is not present,  'sep'  links  all  the  binary
                 files  in  the directory with names beginning with "<prog>".
                 The file "<prog>.rpopts" may also be  present;  it  contains
                 command  line  options such as "-t" to be added to all calls
                 to 'rp'.  The file  "<prog>.fcopts"  contains  command  line


            sep (1)                       - 1 -                       sep (1)




            sep (1) --- separate compilation facility for Ratfor programs  08/27/84


                 options   to   be   presented   to   'fc'.    If   the  file
                 "<prog>.ldopts" is present  and  'sep'  generates  the  'ld'
                 statement itself, the contents of this file are added to the
                 end  of  the  'ld' command line.  Usually this file contains
                 the string "-t -m" so that a load map is produced.

                 'Sep' performs a number of different  operations,  depending
                 on the arguments given to it.
                      
                 sep <prog> <module> { <module> }
                      Each  named  module are preprocessed and compiled.  The
                      main program can be named with an  argument  containing
                      the  null  string (i.e.  "").  All the program's binary
                      modules are then linked together.
                      
                 sep <prog> -all
                      If a Stacc parser is present, it is converted  to  Rat-
                      for.  All the program's Ratfor modules are preprocessed
                      and compiled, and then all the program's binary modules
                      are linked together.
                      
                 sep <prog> -stacc
                      The Stacc parser is converted to Ratfor.
                      
                 sep <prog> -link
                      All  the  program's binary modules are linked together.
                      If a file named "<prog>.ldproc" exists, it is  used  to
                      perform  the  linking.   Otherwise, all binary files in
                      the directory with names beginning  with  "<prog>"  are
                      linked together.  The text in the file "<prog>.ldopts",
                      if  present, is placed at the end of the generated 'ld'
                      command.
                      
                 sep <prog> -mklink
                      Call 'link' to build a Ratfor linkage statement for the
                      program in the file "<prog>_link.i"
                      
                 sep <prog> -cat
                      All the source code files area printed on standard out-
                      put.  No file is printed more than once.
                      
                 sep <prog> -print [ <spool options> ]
                      All the source code files for the program  are  printed
                      on  the  line  printer using 'pr'.  No file is included
                      more than once.  <Spool options> are used to  determine
                      the  disposition  of  the  output; they are any options
                      acceptable to 'pr'.
                      
                 sep <prog> -names
                      The names of all source code files are printed on stan-
                      dard output.  No file name is printed more than once.
                      
                 sep <prog> -xref
                      All Ratfor source modules is run through  'xref'.   The
                      listing from 'xref' appears on standard output.
                      


            sep (1)                       - 2 -                       sep (1)




            sep (1) --- separate compilation facility for Ratfor programs  08/27/84


            _E_x_a_m_p_l_e_s

                 sep rp -stacc
                 sep rp bool init other stacc
                 sep xref -all
                 sep fmt "" fill
                 sep nfmt -print


            _F_i_l_e_s

                 "<prog>.r" for file containing main program.
                 "<prog>_def.i" for file containing global definitions.
                 "<prog>_link.i" for file containing the "linkage" statement.
                 "<prog>_<module>.r"  for  file  containing the Ratfor source
                      code for the module named <module>.
                 "<prog>.ldopts" for file containing program's  link  options
                      (optional).
                 "<prog>.rpopts" for file containing program's Ratfor options
                      (optional).
                 "<prog>.fcopts"   for   file  containing  program's  Fortran
                      options (optional).


            _M_e_s_s_a_g_e_s

                 "Usage:   sep  <prog>  <options>"  for  missing  program  or
                      options.


            _B_u_g_s

                 Currently  undergoing  development.  The user interface will
                 probably be changed in the future.
                 
                 Cannot handle more than about 50 modules in a program.
                 
                 When presented with errors, it displays the lack of  robust-
                 ness of a typical shell file.


            _S_e_e _A_l_s_o

          |      fc  (1), stacc (1), ld (1), link (1), pr (1), xref (1), bind
          |      (3)













            sep (1)                       - 3 -                       sep (1)


