

            lf (1) --- list files                                    08/27/84


          | _U_s_a_g_e

                 lf { -<option>{<option>} } { <pathname> }
                    <option> ::=  a | c | d | f | k | l | n
                                  | o | q | r | t | u | v
                                  | <sort>m | <sort>p | <sort>w | s<depth>
                    <sort>   ::=  [ \ | / ]
                    <depth>  ::=  [ <positive integer> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Lf'  prints  information about files.  Its primary function
                 is to list the names of all files  within  specified  direc-
                 tories;  however,  other information is also available under
                 control of the options.   Each  option  is  specified  by  a
                 single letter, as follows:

          |        a    list  files whose names begin with the character '.'.
                        These  files  are  occasionally  used  for  long-term
          |             storage of data, and many people prefer that they not
          |             appear  in directory listings, so they are not listed
          |             by default.

                   c    force all output to be left  justified  in  a  single
                        column  at the left margin.  This option is generally
                        used for producing output that  is  to  be  processed
                        further by other programs.

                   d    treat  the  directories named in the argument list as
                        ordinary files.   'Lf'  normally  prints  information
                        about  the contents of named directories; this option
                        causes it to print information about the  directories
                        themselves.

                   f    print  full  pathname  (or as much of it as is known)
                        for  each  file  name  printed.    This   option   is
                        frequently  used  when  the  output  of 'lf' is to be
                        processed by other programs, since it makes the  out-
                        put  filenames independent of the current position in
                        the file system.

                   k    print the value of  the  read/write  lock  associated
                        with   the  file.   This  lock  is  used  to  control
                        concurrent access to  the  file  by  multiple  users.
                        Possible values are:

                          sys  system default value is used.  At most instal-
                               lations  this  is  equivalent  to  "n-1"  (see
                               below).

                          n-1  allow multiple readers or one writer.

                          n+1  allow multiple readers and one writer.

                          n+n  allow multiple readers and multiple writers.


            lf (1)                        - 1 -                        lf (1)




            lf (1) --- list files                                    08/27/84


                   l    select options k, m, o, p, t, u, and  w.   See  below
                        for details on these options.

                   m    print  time  and  date  of last modification for each
                        file listed.

                   n    inhibit sorting of output.  See below for  a  discus-
                        sion of sorting.

                   o    print  the owner password for each file listed.  Note
                        that the only files that have  passwords  are  direc-
                        tories;  a  field  of  blanks  is  printed  for  non-
                        directory files.

                   p    print the protection mode of each file  listed.   The
                        protection mode is represented as a string consisting
                        of  two fields separated by a "/".  The characters to
                        the left of the "/" indicate the mode that applies to
                        users with owner access to the file, while  those  to
                        the  right  indicate  the  mode that applies to users
                        with non-owner access to the file.  The  three  types
                        of  access  are "truncate" (or "delete"), "write" and
                        "read", represented by the characters  "t",  "w"  and
                        "r"  respectively.   The  presence  of  any  of these
                        characters in the protection  mode  string  indicates
                        that  the  associated  type of access is allowed.  If
                        all three types of access are allowed, the  character
                        "a" appears instead of "twr".

                   q    print  the  non-owner  password for each file listed.
                        Note that the only  files  that  have  passwords  are
                        directories;  a  field  of blanks is printed for non-
                        directory files.

                   r    reverse sort.  The direction of sorting is  reversed.
                        Thus,  an ascending sort becomes descending, and vice
                        versa.  See below for a discussion of sorting.

                   s    print information about an entire subtree of the file
                        system.  When this option is  used,  'lf'  interprets
                        each <pathname> argument as the name of the root node
                        of  a  subtree  of the file system.  Each file in the
                        named directory is listed;  when  a  subdirectory  is
                        encountered,  'lf'  descends  into it and recursively
                        lists its contents.  This process is  repeated  until
                        all  files  and  directories in the subtree have been
                        listed.  The depth to  which  'lf'  will  descend  in
                        traversing  the subtree may be limited by appending a
                        positive integer to the "s"; 'lf' will  then  descend
                        no  more than that many levels below the named direc-
                        tory.  The other options may be used  to  select  the
                        information printed for each file.  The current level
                        of  descent is indicated by indentation; 'lf' indents
                        three spaces each time it descends into  a  subdirec-
                        tory.   Indentation  may  be suppressed by specifying
                        the "c" option.


            lf (1)                        - 2 -                        lf (1)




            lf (1) --- list files                                    08/27/84


                   t    print the file type of each file  listed.   The  file
                        type is a three character string with possible values
                        as follows:

                          sam  the   file   is  organized  according  to  the
                               Sequential Access Method.

                          dam  the file is organized according to the  Direct
                               Access Method.

                          sgs  the file is a segment directory organized as a
                               "sam" file.

                          sgd  the file is a segment directory organized as a
                               "dam" file.

                          ufd  the file is a (user file) directory.

                          spc  the  file  is  a  "special"  file, such as the
                               master file directory (mfd), the  disk  record
                               availability  table  (dskrat), the system boot
                               file (boot) or the bad-record file (badspt).

                          ???  the file type cannot be ascertained.

                   u    print the status of the "dumped" and "modified" flags
                        associated with each file listed.  The "dumped"  flag
                        may  be  set  by a program such as a file archiver to
                        indicate that a backup copy of the file exists.   The
                        "modified" flag is set by Prime's single user operat-
                        ing  system  (DOS)  whenever  the file is modified to
                        indicate that the modification  date  is  inaccurate.
                        (DOS  doesn't  maintain  modification dates.)  Primos
                        automatically resets both flags whenever the file  is
                        modified.   The "dumped" flag is represented by a "d"
                        and the "modified" flag by an "m".  If a flag is  on,
                        its  associated  character  is  printed; otherwise, a
                        blank is displayed.

                   v    for each directory named in the argument list,  print
                        a  header  containing the directory's pathname before
                        listing its contents.

                   w    print the file size (in 16-bit words) for  each  file
                        listed.   The  number  printed  is the number of data
                        words contained in the file; it does not include, for
                        example, the  cumulative  sizes  of  files  contained
                        within segment directories or UFDs.

                 If  no <pathname> arguments are given, 'lf' assumes you want
                 a listing of the contents of the current working directory.

                 The default listing format without the "s" option is  multi-
                 column  sorted  alphabetically  by  name across columns; if,
                 however, the "n" option is selected, no sorting takes place.
                 With the "s" option, sorting is never done and  the  default


            lf (1)                        - 3 -                        lf (1)




            lf (1) --- list files                                    08/27/84


                 format  is  one  file  per line with incremental indentation
                 based on nesting level.  In all cases, the "c" option forces
                 one file per line, starting in column 1.

                 When neither the "n" nor "s" option is  used,  'lf'  may  be
                 asked  to  sort the output on any of three fields other than
                 the file name:  date  of  last  modification  ("m"  option),
                 protection mode ("p" option), or file size ("w" option).  To
                 request  one  of these, a slash ("/") or backslash ("\") may
                 be prepended to the appropriate option letter; slash  causes
                 an  ascending  sort,  backslash, a descending one.  Thus, to
                 sort the output in order of most  recent  modification,  one
                 might use

                           lf -\m



            _E_x_a_m_p_l_e_s

                 lf -/wp
                 lf -m =nbin=
                 lf -l //allen //dan //perry
                 lf -s =src=
                 lf -csf /0 /1 /2 /3 /4 /5 | find pascal


            _M_e_s_s_a_g_e_s

                 "<pathname>:   not  found"  if  specified  file or directory
                      doesn't exist.


            _B_u_g_s

                 Sorting is performed on at most one field.  The  ability  to
                 sort by protection mode is not very useful.


            _S_e_e _A_l_s_o

          |      chat (1), lacl (1), tscan$ (6)
















            lf (1)                        - 4 -                        lf (1)


