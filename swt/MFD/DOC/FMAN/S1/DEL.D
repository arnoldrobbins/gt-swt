

            del (1) --- delete files                                 08/30/84


          | _U_s_a_g_e

                 del { -<opt>{<opt>} } { -n | <path> }
                    <opt>    ::=   d | f | s[<depth>] | v
                    <depth>  ::=   [ <positive integer> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Del'  is a general purpose file deleter.  When invoked with
                 a list of one or more pathnames as arguments, it attempts to
                 remove each file  named.   The  list  of  pathnames  may  be
                 preceded  by zero or more control arguments, each consisting
                 of a hyphen, followed by one or more of the  following  let-
                 ters:

          |           -d   when  specified in combination with the "s" option
          |                (see below), this option causes 'del' to delete  a
                           UFD  named as an argument after having deleted its
                           contents.   (Normally,  'del'  deletes  the  UFD's
                           contents and leaves the UFD itself intact.)

          |           -f   when   specified,   causes  'del'  to  attempt  to
          |                manipulate the protection attributes of each  file
                           that it is about to delete to insure that the file
                           is,  in fact, deletable.  Note, however, that this
          |                can only be done when the file resides in a direc-
          |                tory that is public, owned by the user  of  'del',
          |                or  protected  with  an  acl  so that the user has
          |                protect  privileges  (ie  -  can  change  the  acl
          |                protection  on  the object).  For objects in pass-
          |                word directories, the protection bits are modified
          |                to give the user all privileges as an owner.   For
          |                ACL  protected  objects,  the protecting object is
          |                modified to give the user  "delete",  "list",  and
          |                "use" privileges.

          |           -s   when  specified, causes 'del' to traverse the sub-
          |                tree of the file system descending from a  UFD  or
                           segment directory named as an argument, attempting
                           to  delete each file it finds along the way.  If a
                           decimal number immediately follows the  "s",  then
                           'del'  will  descend  to  no  more  than that many
                           levels below the named directory in its traversal.
                           This option requires at least one of the arguments
                           <path> or "-n"  be  specified  (since  directories
                           must  be  deleted  by  name).   Normally, when the
                           named directory is a UFD, the directory itself  is
                           not  deleted -- only its contents are.  But if the
                           "d" option (see above) is specified, the  UFD  too
                           will  be  deleted.  Users are exhorted to USE THIS
                           OPTION WITH UTMOST CAUTION.

          |           -v   when specified, 'del' will print the  pathname  of
          |                each file before attempting to delete it, and will
                           wait  for a one-line response from the user.  Only


            del (1)                       - 1 -                       del (1)




            del (1) --- delete files                                 08/30/84


                           if the line begins with a "Y" or a  "y"  will  the
                           file  be deleted; otherwise, the file will be left
                           intact.

                 If the  string  "-n"  appears  in  the  place  of  a  <path>
                 argument,  'del' will read arguments from its first standard
                 input port until end-of-file is encountered.  It is  assumed
                 that  each  line  to  be  read  contains a single path name,
                 starting in column 1.


            _E_x_a_m_p_l_e_s

                 del lkj
                 del -dfs segdir subufd
                 del -vs1
          |      del -s [cd -p]
                 files %junk | del -n


            _M_e_s_s_a_g_e_s

                 "Usage:  del ..."  for bad arguments
                 "<path>:  in use" for files open by other users
                 "<path>:  protected" for undeletable files
                 "<path>:  not found" for non-existent files
          |      "<path>:  delete protected" for files with delete protection
          |           turned on
                 "<path>:  can't delete" for unexpected file system error
                 "<path>:  can't attach" for pathnames that can't be followed
                 "<path>:  directory not empty" for trying to delete  a  non-
                      empty directory
                 "<path>:   directories  nested  too deeply" when directories
                      are nested more deeply that 'del' can handle
                 "<path>:  error reading directory" for unexpected  error  in
                      reading a segment directory
                 "<path>:  bad pathname" for non-existent files
                 "delete  current  directory  by name only" when no arguments
                      are given


          | _B_u_g_s

          |      When deleting an  ACL  directory  with  the  "-d"  and  "-f"
          |      option,  if  the  top level directory cannot be deleted, the
          |      ACL protection attributes may be left changed.

          |      A file cannot be deleted with the force option if  there  is
          |      more  than  one level of protection between the object to be
          |      deleted and the object protecting it.   For  example,  if  a
          |      file  is  protected  by a directory which is protected by an
          |      access category then specifying the "-f" option when attemp-
          |      ting to delete the file will not work.





            del (1)                       - 2 -                       del (1)




            del (1) --- delete files                                 08/30/84


            _S_e_e _A_l_s_o

          |      cp (1), lf (1), mkdir (1), sacl (1), remove (2), create (2),
          |      gfdata (2), sfdata (2), sprot$ (6)






















































            del (1)                       - 3 -                       del (1)


