

            chat (1) --- change file attributes                      08/27/84


          | _U_s_a_g_e

                 chat { { <option> } { <pathname> } }
                    <option>  ::=  -k <lock> | -m <date> <time> |
                                   -p <protect> | -s [<depth>] | -u
                    <lock>    ::=  sys | n-1 | n+1 | n+n
                    <date>    ::=  mm/dd/yy
                    <time>    ::=  hh:mm:ss
                    <protect> ::=  {t | w | r | a}[/{t | w | r | a}]
                    <depth>   ::=  <positive integer>


            _D_e_s_c_r_i_p_t_i_o_n

                 'Chat'  allows  a  user  to change the attributes associated
                 with a file or a group of files.  Arguments  to  'chat'  are
                 generally of the form:

                      <attributes> <files> { <attributes> <files> }

                 where  <attributes>  consists  of  a  series  of one or more
                 options, and <files>  is  a  list  of  files  to  which  the
                 specified  attributes should be applied.  Options consist of
                 an option flag ("-" followed by a single character)  usually
                 followed  by  a string specifying the value of the attribute
                 to be set.  In most cases, this value string may either be a
                 separate argument from the option flag, or appended  to  the
                 option  flag  itself.   The  exceptions to this rule are the
                 "-u" option which takes no value string, and the "-m" option
                 which requires two value strings, each of which  must  be  a
                 separate argument.

                 The following options are available:


                   -k   the  lock  that  governs concurrent access to a given
                        file by multiple users is set  for  each  named  file
                        according to the value string which may be any of the
                        following:

                          sys  the  default  system  value  is  used; at most
                               installations this is equivalent to "n-1".

                          n-1  multiple readers or one writer.

                          n+1  multiple readers and one writer.

                          n+n  multiple readers and writers.

                   -m   the date and time of last  modification  is  set  for
                        each  of  the  named files according to the two value
                        strings that follow.  The first  string  specifies  a
                        date,  and  the  second  a time in military (24 hour)
                        format.

                   -p   the protection mode associated with the  named  files


            chat (1)                      - 1 -                      chat (1)




            chat (1) --- change file attributes                      08/27/84


                        is  set  according  to the value string which is com-
                        posed of two fields separated by a "/".  The  charac-
                        ters  to  the  left  of  the "/" specify the types of
                        access to be allowed to users  with  "owner"  status,
                        and those to the right specify the types of access to
                        be  given to users with "non-owner" status.  The pos-
                        sible types of access are "truncate"  (or  "delete"),
                        "write"  and  "read",  represented  by the characters
                        "t", "w" and "r" respectively.  If all three types of
                        access are to be allowed, the character  "a"  may  be
                        used  instead  of "twr".  If nonowners are to receive
                        no access whatsoever, the slash may be omitted.

                   -s   the named files are assumed to be directories and the
                        specified attributes are applied to all files in  the
                        subtree  rooted  in  those  directories.   If a value
                        string is specified, it must be  a  positive  integer
                        that indicates the maximum number of levels below the
                        named directories to which 'chat' is to descend.  For
                        example,  if  "-s1"  is  specified,  only  the  files
                        immediately contained in  the  named  directory  will
                        have their attributes set.

                   -u   turn  on the "dumped" flag associated with each named
                        file.  Primos turns off the "dumped" flag  associated
                        with  a  given  file  each time the file is modified.
                        When the file system is periodically dumped to  tape,
                        only  those  files whose "dumped" flags are off (i.e.
                        that have been changed since  the  last  backup)  are
                        actually  copied  to the tape.  The "dumped" flags of
                        those files are then turned on to indicate  that  the
                        files have been backed up.

                 If   no   options  (other  than  "-s")  are  specified,  the
                 attributes "-p a/r" are assumed.  If the "-s" option is used
                 and no <pathname> arguments are given, a pathname equivalent
                 to that of the current directory is assumed.

                 To find the attribute values currently held by a  file,  use
                 the 'lf' command.


            _E_x_a_m_p_l_e_s

                 chat -s
                 chat -u junkfile
                 chat -p wr/r f1 f2  -p a/wr f3
                 chat -s1 //src


            _M_e_s_s_a_g_e_s

                 "Usage:  chat ..."  for unrecognizable options.
                 "<pathname>:   bad  pathname" if a specified pathname refers
                      to a non-existent file.
                 "<pathname>:  not a directory" if the "-s" option is used on


            chat (1)                      - 2 -                      chat (1)




            chat (1) --- change file attributes                      08/27/84


                      a non-directory file.

                 The following messages occur when a specified attribute can-
                 not be set:

                 "<pathname>:  can't set protection"
                 "<pathname>:  can't set modification date/time"
                 "<pathname>:  can't set dumped bit"
                 "<pathname>:  can't set read/write lock"

                 The following messages occur when specific  argument  syntax
                 errors are detected:

                 "<arg>:  bad date"
                 "<arg>:  bad time"
                 "<arg>:  bad protection mode"
                 "<arg>:  bad lock specification"


            _S_e_e _A_l_s_o

          |      lf (1), sacl (1), tscan$ (6), sprot$ (6)




































            chat (1)                      - 3 -                      chat (1)


