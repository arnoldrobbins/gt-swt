

            ar (1) --- archive file maintainer                       01/16/83


            _U_s_a_g_e

                 ar -(a[d] | d | p | t | u[d] | x)[v] <archive> {<file_spec>}
                    <file_spec> ::= <pathname> | -n[<pathname>|<stdin_number>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Ar'  is  a  program  designed to manipulate files that have
                 been grouped together into a  single  "archive"  file.   Its
                 principal  utility  is in keeping permanent backup copies of
                 important files.  Significant savings in  disk  space  usage
                 may  also  be  realized  by  maintaining  files in archives,
                 resulting from the reduction of internal disk fragmentation.

                 Arguments to 'ar' consist of one of six directives,  discus-
                 sed  below,  followed  by  the  name  of  the  archive file,
                 optionally  followed  by  one  or  more  <file_spec>s.   The
                 <file_spec>s,  if  present,  designate  names  of  files  or
                 archive  members  and  are  interpreted  according  to   the
                 specified  directive.   (For a full discussion of the syntax
                 of <file_spec>, see the entry for 'cat' in section 1.)

                 The possible directives are:

                 -a   Append.  The named files are added to the  end  of  the
                      archive; if the archive did not previously exist, it is
                      created.   If  any of the files is already contained in
                      the archive, a diagnostic message is  printed  and  the
                      archive  is  not altered.  If the "d" flag is specified
                      and no errors are  encountered  in  appending  the  new
                      files, the files are deleted from the file system.

                 -d   Delete.    The  named  members  are  deleted  from  the
                      archive.

                 -p   Print.  The named members are copied to standard output
                      1,  one  after  another.   Files  are  not  necessarily
                      printed  in  the  order specified in the argument list;
                      rather, they are printed in the  order  in  which  they
                      appear in the archive.  If no names are given, all mem-
                      bers of the archive are printed.

                 -t   Table.   A  table  of  contents  of the archive file is
                      printed on  standard  output  1.   If  file  names  are
                      specified,   information  for  only  those  members  is
                      printed.

                 -u   Update.  The named members of the archive  are  updated
                      from  the  file  system; if no names are specified, all
                      members of the archive are updated.  Any files named in
                      the argument list that have no corresponding members in
                      the archive are added to the end of the archive; a  new
                      archive may be created in this manner.  If the "d" flag
                      is  specified  and  no  errors are encountered, all the
                      files named in the argument list are deleted  from  the


            ar (1)                        - 1 -                        ar (1)




            ar (1) --- archive file maintainer                       01/16/83


                      file system.

                 -x   Extract.   This directive is similar to the "-p" direc-
                      tive, except that the  named  members  are  written  to
                      individual  files.  Again, if no names are specified in
                      the argument list, all archive members  are  extracted.
                      The archive is not modified.

                 Any  of these directives may be accompanied by the "v" flag,
                 which causes 'ar' to print on standard output 1 the name  of
                 each archive member that it operates on.  In the case of the
                 "-t"  directive,  the "v" flag causes more information about
                 each member to be printed.  In the case of the  "-p"  direc-
                 tive,  the  name  of  the  member is written out immediately
                 before the contents of the member.


            _E_x_a_m_p_l_e_s

                 ar -tv arch.a
                 ar -x old_progs.a gamma.r gamma.b
                 ar -d backup.a rf.r
                 ar -ud archive.a ar.r ar.d
                 ar -pv archive.a ar.r >archive.r
                 lf -fc =src=/std.r | ar -u src.a -n


            _M_e_s_s_a_g_e_s

                 "Usage:  ar ..."  for incorrect argument syntax.
                 "archive not  altered"  when  fatal  errors  occur  and  the
                      original archive is left intact.
                 "<file>:   can't  add"  when a file to be put in the archive
                      can't be opened for reading.
                 "can't replace archive with <temp>" with the "-u"  directive
                      when  the  old archive can't be replaced with the newly
                      created one.  The new  archive  is  left  in  the  file
                      <temp>.
                 "<member>:  already in archive" with the "-a" directive when
                      a named file is already in the archive.
                 "delete by name only" with the "-d" directive when no member
                      names are specified.
                 "<file>:   can't create" with the "-x" directive when a file
                      can't be opened for writing to  receive  the  extracted
                      archive  member,  or  with the "-a" and "-u" directives
                      when a new archive file can't be created.
                 "can't handle more than <max> file  names"  when  more  than
                      <max> names are specified in the argument list.
                 "<file>:   duplicate  file  name" when the same name appears
                      more than once in the argument list.
                 "archive not in proper format" when 'ar' is used on  someth-
                      ing other than an archive.
                 "<member>:   not  in  archive" with the "-d", "-p", "-t" and
                      "-x" directives when a member  named  in  the  argument
                      list is not in the archive.
                 "<file>:   can't  remove"  with the "-a" and "-u" directives


            ar (1)                        - 2 -                        ar (1)




            ar (1) --- archive file maintainer                       01/16/83


                      when a file can't be deleted from the file system.
                 "premature EOF" with the "-d", "-p", "-u"  and  "-x"  direc-
                      tives  when  end  of file is encountered on the archive
                      during the copying of a member.


            _B_u_g_s

                 There is no way to change the name of an archive member.

                 It takes a little longer than usual to extract archive  mem-
                 bers  with the "-p" option when standard output is connected
                 directly to the terminal.


            _S_e_e _A_l_s_o

                 cat (1), _S_o_f_t_w_a_r_e _T_o_o_l_s








































            ar (1)                        - 3 -                        ar (1)


