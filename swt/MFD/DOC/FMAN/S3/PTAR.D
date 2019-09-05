

            ptar (3) --- decode Unix tar format tapes                05/17/84


          | _U_s_a_g_e

          |      ptar [-xvt] [-f <file>]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Ptar'  reads  input  in the form produced by the Unix 'tar'
          |      (tttape aaarrrchiver) program, and  rebuilds  the  directory  sub-
          |      tree(s)  encoded on the tape, if possible.  'Ptar' _m_u_s_t have
          |      write permission in the current directory in order to create
          |      the files and directories it is dumping from the tape.

          |      'Ptar' knows about the Unix  "."   (current  directory)  and
          |      ".."  (parent directory) directory structures.  In the first
          |      case,  the leading "./" is simply stripped off the file name
          |      which is currently being recreated.  Multiple occurrences of
          |      "./", _a_t _t_h_e _b_e_g_i_n_n_i_n_g _o_f _a _f_i_l_e _n_a_m_e, are allowed, and will
          |      be stripped off.  In the second case, the leading  "../"  is
          |      replaced with a "\".  Each occurrence of "../" at the begin-
          |      ning  of  a file name is replaced with a "\".  Absolute path
          |      names (names that  start  with  a  "/"),  have  another  "/"
          |      prepended,  in  the  hope  that there will be an appropriate
          |      directory out in the  file  system  somewhere.   File  names
          |      beginning  with a digit have an "_" prepended to them, since
          |      the Primos file system will not allow file  names  to  start
          |      with  a  digit.   In general, it is best if one's 'tar' tape
          |      contains only relative path names.  'Ptar' checks first  for
          |      leading  "./"s, and then for "../", so if you have file name
          |      that starts with ".././", 'ptar' will be fooled.  Also,  one
          |      should  not  have occurrences of either "./" or "../" in the
          |      middle of one's file names.

          |      'Ptar' assumes that you are dumping _t_e_x_t  files.   Therefore
          |      it always sets the parity bit, to conform to Prime's conven-
          |      tion  of  using  mark  parity.   Unix  binaries  would be of
          |      limited use on a prime anyway.

          |      When 'Ptar' finishes, it leaves a file in the current direc-
          |      tory, called "_detab.tar.files".  This  is  a  command  file
          |      which will remove tabs from the files just dumped.  Tabs are
          |      replaced  by  eight  blanks,  which  is  the  Unix  default.
          |      "_detab.tar.files" turns on shell tracing, so that  you  can
          |      make it sure it is transforming the files properly.

          |      The following options are available:

          |           -t   Table  of contents.  This option reads through the
          |                'tar' tape, printing out the file names and  their
          |                sizes in bytes, but does not dump the files.

          |           -v   Verbose.   This  option  will print file names and
          |                sizes as they are being dumped.  It is wise to use
          |                this option.

          |           -x   Extract.  This is the default behavior.  In  fact,


            ptar (3)                      - 1 -                      ptar (3)




            ptar (3) --- decode Unix tar format tapes                05/17/84


          |                putting  this  option  on  the  command  line  has
          |                absolutely no effect at all.  Use the "-t"  option
          |                if you just wish to see what is on the tape.

          |           -f   Use  the given file as input.  When this option is
          |                given, the next argument is  used  for  input.   A
          |                file  name  of  "-"  is taken to mean the standard
          |                input.  If no files are given, 'ptar'  will  issue
          |                an error diagnostic and die.


          | _E_x_a_m_p_l_e_s

          |      x as mt0; mt -r -cb -b512 | ptar -xv; x un mt0
          |      tarfile> ptar -t
          |      ptar -xvf tafile


          | _F_i_l_e_s

          |      _detab.tar.files  to  replace  tabs with blanks in the newly
          |      extracted files.


          | _M_e_s_s_a_g_e_s

          |      Various self-explanatory messages if it can't create  direc-
          |      tories or files.


          | _B_u_g_s

          |      Will overwrite "_detab.tar.files" each time.

          |      Cannot  take  more than one file on the command line for the
          |      "-f" option.

          |      Cannot dump Prime directory trees into a 'tar' format tape.


          | _S_e_e _A_l_s_o

          |      mt(1), tar(1) in the _U_N_I_X _P_r_o_g_r_a_m_m_e_r_'_s _M_a_n_u_a_l.















            ptar (3)                      - 2 -                      ptar (3)


