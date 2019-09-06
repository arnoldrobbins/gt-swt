

            lacl (1) --- List ACL information about a file system object  09/05/84


          | _U_s_a_g_e

          |      lacl {<option>} {<file_spec>}
          |            <option> ::=  -(a | b | c | l | p | t | v)


          | _D_e_s_c_r_i_p_t_i_o_n

          |      The  'lacl'  command  will list information about the Access
          |      Control Lists protecting any  file  system  object.   If  no
          |      pathname  is specified, 'lacl' will print ACL information on
          |      the current directory.  For a more comprehensive description
          |      of ACL's, see the help for the 'sacl' command.  For  a  full
          |      description of <file_spec>, see the help on 'cat'.

          |      Options recognized by 'lacl':

          |         -a  List  the  access  pairs  describing  the ACL for the
          |             object.  This is the default action if no options are
          |             specified, and the "-a" must be specified if you wish
          |             to display the pairs when also  specifying  the  "-t"
          |             and "-b" options.

          |         -b  Give  the pathname of the object protecting the named
          |             item.  The pathname is the same  as  the  object  for
          |             specific  ACLs,  or the name of the acat involved for
          |             access category protection.  The pathname may also be
          |             of an ancestor  directory  in  the  case  of  default
          |             specific  ACLs.  If the "-p" option is also given the
          |             "-b" is ignored.

          |         -c  Print the access pairs one per column instead of  all
          |             on the same line.

          |         -l  Long format listing.  Acts as if the options "-a -b -
          |             c -v -t" were all given.

          |         -p  List  the priority ACL in effect for the logical disk
          |             partition on which the object resides.

          |         -t  Give the type of the ACL protecting the object.   The
          |             type   is   either  "specific",  "default  specific",
          |             "acat", "default  acat",  "object  is  an  acat",  or
          |             "priority".

          |         -v  Verbose form -- echo the pathname of the object being
          |             checked and include separator characters if the "-b",
          |             "-l", or "-t" options have also been selected.


          | _E_x_a_m_p_l_e_s

          |      lacl -p -v /0/mfd /1/mfd

          |      lf -fc =vars= | lacl -abv -n



            lacl (1)                      - 1 -                      lacl (1)




            lacl (1) --- List ACL information about a file system object  09/05/84


          |      lacl


          | _M_e_s_s_a_g_e_s

          |      "Usage:    lacl   [-l]   [-b   [-a]]  [-p]  [-t]  [-c]  [-v]
          |      {<pathname>}" for improper command usage.
          |      "Cannot list acl for <pathname>"  for  various  file  system
          |      errors or insufficient access rights.


          | _S_e_e _A_l_s_o

          |      lf (1), sacl (1), gfdata (3)












































            lacl (1)                      - 2 -                      lacl (1)


