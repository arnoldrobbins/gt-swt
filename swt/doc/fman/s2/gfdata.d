

            gfdata (2) --- get information about file characteristics  08/28/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function gfdata (key, pathname, infbuf, attach, aux)
          |      integer key, attach
          |      untyped infbuf, aux
          |      character pathname (ARB)

          |      Library: vswtlb (standard Subsystem library)


          | _F_u_n_c_t_i_o_n

          |      This  function returns information about a file system entry
          |      according to the value of the parameter  'key.'   There  are
          |      thirteen  declarations  for  values of 'key' in the standard
          |      SWT definitions.  Their names and returned values are:

          |        FILE_UFDQUOTA -- this key  reads  information  about  disk
          |            record quotas.  The object named in 'pathname' must be
          |            a  directory.   'aux'  returns  a  value of YES (as an
          |            integer) if the object is a quota directory, otherwise
          |            'aux' is returned as NO and the function value is ERR.
          |            'infbuf' is an array of 6 long_ints.  'infbuf (1)'  is
          |            set  to  the  number  of  words per disk record on the
          |            partition (440 or 1024), 'infbuf (2)' is  set  to  the
          |            number  of records used in the directory, 'infbuf (3)'
          |            is set to the current quota, 'infbuf (4)'  is  set  to
          |            the  total number of records used in the directory and
          |            its contents, 'infbuf (5)' is set to  the  time-record
          |            product,  and  'infbuf  (6)' is set to the file system
          |            date-time modification stamp for the directory.

          |        FILE_TYPE -- this key returns an EOS-terminated string  in
          |            the parameter 'infbuf' which describes the type of the
          |            file  named  in 'pathname.'  Standard types are "sam",
          |            "dam", "sgs", "sgd", "ufd", and "acat".  Special files
          |            may return types  of:   "mfd",  "boot",  "dskrat",  or
          |            "badspt".   'infbuf'  must  be  at  least 7 characters
          |            long.  'aux' is unmodified.

          |        FILE_DMBITS -- this key returns information about the dum-
          |            ped bit and the Primos II modification bit.   'infbuf'
          |            must  be  at  least 2 words long.  infbuf(1) will have
          |            the value YES if the dumped bit is set, NO  otherwise.
          |            infbuf(2)  will have the value YES if the modification
          |            bit is set, NO otherwise.  'aux' is unmodified.

          |        FILE_RWLOCK -- this key causes the current read/write lock
          |            to be encoded in an EOS-terminated string  and  retur-
          |            ned.  The format of the string in 'infbuf' is the same
          |            as used in 'lf' and 'chat.'  'infbuf' must be at least
          |            4 characters long.  'aux' is unmodified.

          |        FILE_TIMMOD  -- this key returns the date and time of last
          |            modification.  'infbuf' must be at least 6 words long.
          |            The date and time are returned as integers.  infbuf(2)


            gfdata (2)                    - 1 -                    gfdata (2)




            gfdata (2) --- get information about file characteristics  08/28/84


          |            is set to the month (1 to 12), infbuf(3) is set to the
          |            day, and infbuf(1) is set  to  the  year  modulo  100.
          |            Infbuf(4)  is  set  to  the hour past midnight (0-23),
          |            infbuf(5) is set to the minute, and infbuf(6)  is  set
          |            to  the  seconds.  Note that the file system date/time
          |            stamp has a resolution of only 4  seconds.   'aux'  is
          |            unmodified.

          |        FILE_ACL  -- this key encodes the ACL pairs protecting the
          |            object into 'infbuf' with each  pair  separated  by  a
          |            blank.   'infbuf'  should  be  declared as a character
          |            array of size MAXACLLIST.  'aux' should  be  an  array
          |            MAXPATH  long.   'aux  (1)'  gets  set  to  an integer
          |            indicating the type  of  object  protecting  the  item
          |            named by pathname:  0 is a specific ACL, 1 is an acat,
          |            2  is a default specific ACL, 3 is a default acat, and
          |            4 means the object is an acat.  The name  of  the  ACL
          |            object  confering the protection is returned as an EOS
          |            string in 'aux (2)' and on.

          |        FILE_ACCESS --  this  key  calculates  the  access  for  a
          |            specific  user to the object named by 'pathname'.  The
          |            user name (or group name) is specified  in  'aux';  if
          |            'aux'  is simply an EOS, then access is calculated for
          |            the current user.  'infbuf' is encoded with the access
          |            rights, and should  be  declared  to  be  at  least  8
          |            characters long.

          |        FILE_PRIORITYACL  -- this key encodes the current priority
          |            ACL set on the disk partition  containing  the  object
          |            named  in  'pathname'.   The ACL is returned as an EOS
          |            terminated string  in  'infbuf';  'infbuf'  should  be
          |            declared  to  be  at least MAXACLLIST characters long.
          |            'aux' is unchanged.

          |        FILE_DELSWITCH -- this key causes 'infbuf' to  be  set  to
          |            YES  if  the  file  delete  protect  bit is set on, NO
          |            otherwise.  The file delete switch is valid  only  for
          |            ACL-protected items.  'aux' is unchanged.

          |        FILE_SIZE  -- this key returned the size of the item named
          |            in 'pathname'.  If the object is a file  the  'infbuf'
          |            is  the  long_int number of words of data in the file.
          |            If 'pathname' is a ufd or segdir, then 'infbuf' is set
          |            to the number of words contained in the  total  struc-
          |            ture.   If the item is a ufd, then 'aux' is a long_int
          |            set to the number of words per disk  records  (440  or
          |            1024);  if  it  is  a  file  or  segdir  then 'aux' is
          |            unchanged.

          |        FILE_FULL_INFO -- this key causes 'infbuf' to be  returned
          |            as  an array of 24 words, structured as in the call to
          |            Primos "ent$rd".  'aux' is unchanged.

          |        FILE_PROTECTION  --  this  key  causes  the  current  file
          |            protection  attributes  to  be  encoded  into  an EOS-


            gfdata (2)                    - 2 -                    gfdata (2)




            gfdata (2) --- get information about file characteristics  08/28/84


          |            terminated string in the parameter 'infbuf.'  The form
          |            of the string is the same as the form presented to the
          |            'chat' command or returned by the 'lf' command.  'inf-
          |            buf' must be at least 6 characters long.

          |        FILE_PASSWORDS -- this key causes  the  current  passwords
          |            for  the  directory named in 'pathname' to be returned
          |            as EOS terminated  strings.   The  owner  password  is
          |            returned  in  'infbuf'  and the nonowneehr password is
          |            returned in 'aux'.  Both 'infbuf' and 'aux' must be at
          |            least 7 words long.

          |      The 'pathname' argument is any standard EOS-terminated path-
          |      name, and may contain templates.  The function value  is  OK
          |      if  the  information  was  fetched,  ERR otherwise.  ERR may
          |      indicate that the file does not exist, that the caller  does
          |      not  have rights in the directory containing the file, a bad
          |      key, or any of a number of other file system errors.

          |      The "attach" key is the same as in the "getto" function  ---
          |      it indicates if the directory attach point had to be changed
          |      to get to the file entry being examined.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      The function uses "getto" to get to the directory containing
          |      the  file,  then  it  calls  the  Primos routine "ent$rd" to
          |      obtain file system information.   Finally,  it  decodes  the
          |      information  into 'infbuf' based on the value of 'key.'  The
          |      routines  "q$read",  "acl$01",   "acl$50",   "szfil$",   and
          |      "szseg$" may also be called depending on the key supplied.


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      infbuf, attach, aux


          | _C_a_l_l_s

          |      ctoc,  ptoc,  vtoc,  getto,  follow,  index,  equal,  mapdn,
          |      ctov$f, szfil$, szseg$, move$, mktr$, acl$01, acl$50, Primos
          |      nameq$, Primos gpas$$, Primos ent$rd, Primos q$read,  Primos
          |      at$hom, Primos srch$$, Primos calac$


          | _B_u_g_s

          |      If  'infbuf'  or 'aux' are not long enough, odd behavior may
          |      result.


          | _S_e_e _A_l_s_o

          |      chat (1), lacl (1), lf (1), sacl (1), sfdata (2)


            gfdata (2)                    - 3 -                    gfdata (2)


