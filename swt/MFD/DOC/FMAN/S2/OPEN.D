

            open (2) --- open a file                                 02/28/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 file_des function open (path, mode[, typ[, limit]])
                 character path (ARB)
                 integer mode, typ, limit

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Open'  is  the  primary means of opening files for reading,
                 writing, etc.  The first argument is  the  pathname  of  the
                 file to be opened; it must be an EOS terminated string (e.g.
                 open('/dir/file1's....).   The  second argument is the mode,
                 READ, WRITE or READWRITE.  The third  argument  is  optional
                 and  should  normally  be  omitted.   It  specifies the type
                 associated with the file.  The fourth argument  is  optional
                 and  should normally be omitted.  It specifies the number of
                 retries that should be made when a disk file is found to  be
                 in  use.  'Open' returns a file descriptor which may be used
                 for further i/o operations if the attempt to open  was  suc-
                 cessful,  or  ERR if the attempt failed.  The user is always
                 left in the home directory after an attempt to open.

                 By default, 'open' returns a file descriptor to a sequential
                 access method (SAM) file when referring to a disk file.   If
                 creating  a  direct access method file (DAM) is desired, the
                 'mode' argument may be ORed with the KNDAM file  key  (i.e.,
                 'mode'  can be "READWRITE+KNDAM" to create a DAM file opened
                 for reading or writing).  The constant KNDAM is contained in
                 the "PRIMOS_KEYS" include file.

                 'Open' may be used to produce file  descriptors  that  allow
                 access  to  many  different devices.  Depending on the path-
                 name, the file opened may be  a  standard  input  or  output
                 port, the user's terminal, a line printer spool file, a disk
                 file,  or  the  null  device.  Such special pathnames always
                 begin with  the  characters  "/dev/"  followed  by  context-
                 dependent strings that may specify names, options, etc.  For
                 example,  the pathname used to open files in the spool queue
                 may include any of the following options:

                      f              use Fortran forms control
                      r              use raw forms control
                      s              use standard forms control
                      h              inhibit header page
                      j              inhibit final page eject
                      n              number all output lines
                      a/location/    select destination printer
                      d/time/        defer printing until specified time
                      b/banner/      use given string on header page
                      c/copies/      print given number of copies
                      p/form/        select form type (wide, narrow, special, etc.)

                 Slashes or blanks may be used to separate  parameters.   For


            open (2)                      - 1 -                      open (2)




            open (2) --- open a file                                 02/28/83


                 example,  "/dev/lps/f/agt.b/c10" refers to a spool file with
                 Fortran forms control, ten copies of which will  be  printed
                 on the printer with name "gt.b".


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Open'  first searches for an available file descriptor and,
                 if found, performs initialization for the file.  The form of
                 the pathname given as the first argument controls subsequent
                 actions, as follows:
                      
                      /dev/stdout         For standard port names, the
                      /dev/stdin          allocated file descriptor is freed
                      /dev/errout         and the port descriptor is returned.
                      /dev/errin
                      /dev/stdout[123]
                      /dev/stdin[123]
                      
                      /dev/null           The null device is opened.
                      /dev/tty            The user's terminal is opened.
                      
                      /dev/lps?*          'Lopen$' is called to open a disk
                                          file in the spool queue
                      
                      otherwise,          If the pathname does not begin with
                                          "/dev/", 'dopen$' is called to open
                                          a disk file.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 typ


            _C_a_l_l_s

                 dopen$, lopen$, getfd$, expand, mapdn, strbsr, Primos break$


            _S_e_e _A_l_s_o

                 dopen$ (6), lopen$ (6), close (2), create (2), remove (2)















            open (2)                      - 2 -                      open (2)


