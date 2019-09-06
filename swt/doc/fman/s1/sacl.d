

            sacl (1) --- set ACL attributes on an object             09/05/84


          | _U_s_a_g_e

          |      sacl <pathname>
          |      sacl <pathname> {<access pairs>} [-l <pathname>]
          |      sacl <pathname> -a <access category>


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Sacl'  is  a  command  to  manipulate  Primos ACL's (Access
          |      Control Lists).  It may be used to change the access  to  an
          |      object,  create an access category, add an item to an access
          |      category, or delete an access control list.

          |      An access control list is  a  set  of  pairs  of  names  and
          |      associated  access rights.  Each access pair has the follow-
          |      ing syntax:

          |                              <name1> := <name2>
          |                                    - or -
          |                              <name> <op> <rights>

          |      Each <name> is either a user name (eg.,  "system"  or  "net-
          |      man"),  the  name  of  an  accounting  group (eg., ".lab" or
          |      ".system_staff"), or the special identifier "$rest" indicat-
          |      ing everyone not otherwise named.  The  first  form  of  ACL
          |      shown  above indicates that the rights for <name1> should be
          |      set to exactly the same  rights  as  for  <name2>.   In  the
          |      second  form  of  ACL  pair, <op> is either the symbol "+=",
          |      "-=", or "="; "+=" means to add the indicated  rights,  "-="
          |      means  to  remove the indicated rights, and "=" means to set
          |      the rights to the indicated permissions.

          |      The <rights> argument consists of either a keyword  or  sym-
          |      bol,  or  some  combination  of letters indicating an access
          |      right.  Each of the letters and their  corresponding  rights
          |      is as follows:

          |           aaa -- corresponds to "add" access, that is, the right to
          |           create  a  new file within a directory.  Note that once
          |           the file is created, the user  creating  the  file  can
          |           have  full  read/write  access until the first time the
          |           file is closed.  At that point, the  other  protections
          |           determine access.

          |           ddd  -- corresponds to "delete" access.  This access sim-
          |           ply allows the user to delete files within a directory.
          |           "d" access has no meaning when  applied  to  individual
          |           files.

          |           lll -- corresponds to "list" access, which is the ability
          |           to  list  the  contents  of a directory (as in the 'lf'
          |           command).

          |           ppp -- corresponds to  "protect"  access,  which  is  the
          |           ability to set ACL's for objects within the directory.


            sacl (1)                      - 1 -                      sacl (1)




            sacl (1) --- set ACL attributes on an object             09/05/84


          |           rrr  -- corresponds to "read" access, the ability to open
          |           a file for reading or execute a file.

          |           uuu -- corresponds to "use"  access.   Use  access  means
          |           that  a  user  can  'cd'  to  a  command or open a file
          |           inferior to the named directory.  As example,  to  open
          |           the  file  /disk1/system/lab/foobar, the user must have
          |           (at least) "u" access to the directories  "system"  and
          |           "lab",  as  well  as  "r" and/or "w" access to the file
          |           "foobar".

          |           www -- corresponds to "write" access.   This  means  that
          |           the  user  has  the  ability  to write to or truncate a
          |           file.

          |      Thus, to add "read" and "write" access to a  file  for  user
          |      "waldo",  the  ACL  pair "waldo+=wr" could be used, as could
          |      "waldo+=rw".

          |      Some special symbols and  keywords  are  recognized  by  the
          |      'sacl' command.  These are:

          |           $$$aaallllll -- corresponds to "adlpruw"

          |           *** -- same as "$all"; "adlpruw" rights

          |           $$$nnnooonnneee -- confers no rights whatsoever

          |           000 -- same as "$none"

          |           $$$ooowwwnnneeerrr -- all rights except protect:  "adlruw"

          |           $$$rrreeeaaaddd -- "lru"

          |           $$$uuussseee -- "alru"

          |           $$$dddeeefffaaauuulllttt -- same rights as currently belong to "$rest"

          |           $$$dddeeefff -- same as "$default"

          |           ???  -- same as "$default"

          |      Also  associated  with the concept of ACL is the _t_y_p_e of the
          |      ACL.  There are basically 5 types of ACL.  The first type is
          |      a specific ACL which  confers  protection  on  one  specific
          |      file.   The  second  type of ACL is the default specific ACL
          |      which is a specific ACL set on an ancestor of the object; if
          |      an object is not protected by a specific ACL or an acat,  it
          |      is protected by a default ACL -- the same ACL which protects
          |      its parent.

          |      The third type of ACL is the access category, or "acat".  An
          |      acat  is an ACL which may protect many objects with the same
          |      access rights.  An acat appears to be a file that cannot  be
          |      read  or  written,  and its name must end in the 5 character
          |      sequence ".acat".  An acat need not  currently  protect  any


            sacl (1)                      - 2 -                      sacl (1)




            sacl (1) --- set ACL attributes on an object             09/05/84


          |      files  or directories; its existence is independent of other
          |      objects, unlike a specific ACL.

          |      The fourth type of ACL is the default acat, which is similar
          |      in nature to the default specific ACL.

          |      The fifth type of ACL is a priority ACL.  This is an ACL set
          |      on an entire disk partition  by  the  system  administrator.
          |      Rights confered by a priority override rights confered by an
          |      ACL of any of the other four types.  Priority ACLs cannot be
          |      set  with  this  command.   To  set  a priority ACL, use the
          |      Primos 'spacl' command.

          |      "Sacl <pathname>" reverts the object to default  protection;
          |      if  <pathname>  is  an acat, it is deleted.  The "-a" option
          |      adds the object to the named acat.  The  "-l"  option  is  a
          |      "like" option; access rights for the object are the combina-
          |      tion  of  the  rights  on the object specified with the "-l"
          |      option along with the given access pairs.  In the second and
          |      third form, if <pathname> ends in  ".acat"  then  an  access
          |      category is created with the indicated rights.


          | _E_x_a_m_p_l_e_s

          |      sacl text harold=$read maude:=harold .staff+=r $rest=$none

          |      sacl comm.acat .staff+=* .hackers-=w -l =lbin=

          |      sacl text


          | _M_e_s_s_a_g_e_s

          |      "Usage:   sacl  <pathname>  [<acl list>] [-l <pathname> | -a
          |      <acat>]" for incorrect usage.

          |      "Cannot set ACL as specified."  if the object is unreachable
          |      or the user does not have "p" access.

          |      "Object specified after the "-a" is not an  acat."   if  the
          |      name of the object after the "-a" option is not a valid acat
          |      name.


          | _B_u_g_s

          |      Access   categories  must  end  in  ".acat".   This  is  not
          |      consistent with standard Subsystem naming  conventions,  but
          |      is consistent with Primos standard naming conventions.


          | _S_e_e _A_l_s_o

          |      lf (1), lacl (1), sfdata (2), parsa$ (6)



            sacl (1)                      - 3 -                      sacl (1)


