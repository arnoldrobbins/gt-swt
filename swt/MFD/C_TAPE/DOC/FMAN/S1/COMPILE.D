

            compile (1) --- compile and load mixed language programs  10/10/84


          | _U_s_a_g_e

          |      compile {<input_files>} [-c] [-m <language>] [-C<'cc' options>]
          |              [-R<'rp' options>] [-F<'fc' options>] [-S<'pmac' options>]
          |              [-P<'pc' options>] [{-l <library>}] [-o <output_file>]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Compile'  is  a  general  purpose interlude for calling the
          |      various compilers available.   The  choice  of  compiler  is
          |      determined by the suffix of the file name.

          |      'Compile'  compiles  and loads the pathnames specified.  The
          |      following options are available:

          |           -c   Compile only.  The various source  files  will  be
          |                compiled, but the loader will not be called.

          |           -m   <language>
          |                Specify a "main" language.  If the "main" language
          |                requires   a   special  library  and/or  start-off
          |                routine, then 'compile' will arrange to  load  it.
          |                The <language> should be one of the suffix letters
          |                listed  below.   By  default, no special libraries
          |                (besides the regular "vswtlb") will be loaded.

          |           -l   <library>
          |                Load <library>.

          |           -o   <output file>
          |                Place executable file in <output file>.

          |      'Compile' recognizes the following file  naming  conventions
          |      and  will  utilize  the appropriate preprocessor and/or com-
          |      piler:

          |           .c -- C source file
          |           .s -- Pma source file
          |           .r -- Ratfor source file
          |           .f -- Fortran 66 source file
          |           .p -- Pascal source file

          |      Therefore, if your  current  directory  contains  the  files
          |      "f1.s",  "f2.c",  "f3.r", "f4.f", and "f5.p" and you execute
          |      the command "compile f1.s f2.c f3.r  f4.f  f5.p",  'compile'
          |      will  call the appropriate language processors for each file
          |      and load the resulting binary versions together.  Note  that
          |      even  though there are both C and Pascal files listed, their
          |      special libraries would _n_o_t be loaded.

          |      Every path name that you specify _m_u_s_t include its associated
          |      suffix.  Otherwise, 'compile' will decide that it is  not  a
          |      file, but an argument to pass on to the loader.

          |      The following options will be used by the indicated compiler


            compile (1)                   - 1 -                   compile (1)




            compile (1) --- compile and load mixed language programs  10/10/84


          |      when  it  processes those pathnames having the corresponding
          |      name extensions.  Options to be passed on to  the  compilers
          |      should be enclosed in quotes, so that they will stay grouped
          |      together.  For instance:

          |                compile  -m c junk.c -C'-a -Dindex=strchr' stuff.r
          |                -R'-a -g' -o junk

          |      Otherwise, the shell will split them up,  and  most  of  the
          |      options  will go to the loader, and do something unexpected,
          |      instead of to the intended compiler.

          |           -C   <'cc' options>
          |                Use the 'cc' options specified  when  compiling  C
          |                modules.

          |           -R   <'rp' options>
          |                Use  the 'rp' options specified when preprocessing
          |                any Ratfor modules.

          |           -F   <'fc' options>
          |                Use the  'fc'  options  specified  when  compiling
          |                Fortran modules.  These options will affect Ratfor
          |                programs as well.

          |           -S   <'pmac' options>
          |                Use  the  'pmac' options specified when assembling
          |                PMA modules.  These  options  will  _n_o_t  affect  C
          |                programs,  since the C compiler no longer uses PMA
          |                to compile its programs.

          |           -P   <'pc' options>
          |                Use the  'pc'  options  specified  when  compiling
          |                Pascal modules.

          |      The options should not occur more than once; if they do, the
          |      last  one will be used.  Unrecognized options will be passed
          |      on to the loader.


          | _M_e_s_s_a_g_e_s

          |      "Usage:  compile ..."  for an invalid  option  to  the  '-m'
          |      flag,  if  no  arguments  are  given, or no files are listed
          |      (only options).


          | _E_x_a_m_p_l_e_s

          |      compile -m c sort.c stuff.p
          |      compile prog1.r prog2.p low_level.s -l vswtmath -o prog


          | _B_u_g_s

          |      Does no sanity checking  on  the  arguments  passed  to  the


            compile (1)                   - 2 -                   compile (1)




            compile (1) --- compile and load mixed language programs  10/10/84


          |      individual  compilers,  nor  on  what  is  passed  on to the
          |      loader.

          |      Cannot be used to call 'bind'.

          |      TTThhhiiisss ppprrrooogggrrraaammm iiisss ooonnnlllyyy aaavvvaaaiiilllaaabbbllleee tttooo llliiiccceeennnssseeeeeesss ooofff  VVVeeerrrsssiiiooonnn  222...000
          |      ooofff ttthhheee GGGeeeooorrrgggiiiaaa TTTeeeccchhh CCC CCCooommmpppiiillleeerrr...


          | _S_e_e _A_l_s_o

          |      cc  (1),  rp (1), fc (1), pc (1), pmac (1), ld (1), ucc (1),
          |      bind (3), _U_s_e_r_'_s _G_u_i_d_e _f_o_r _t_h_e _G_e_o_r_g_i_a _T_e_c_h _C _C_o_m_p_i_l_e_r













































            compile (1)                   - 3 -                   compile (1)


