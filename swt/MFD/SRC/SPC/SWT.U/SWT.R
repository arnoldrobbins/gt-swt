# swt --- initialize the Software Tools Subsystem

   subroutine main

   include "defaults_def.i"
   include "=incl=/user_types.r.i"
   include LIBRARY_DEFS
   include SWT_COMMON

   character ciname (MAXLINE)
   integer i, code, cmd (2), info (8), fname (16), junk (3), first
   integer getto, findf$, filtst, call$$, duplx$
   filedes fd
   filedes open, create

   procedure close_files forward
   procedure get_password forward
   procedure load_variables forward
   procedure get_term_type forward

   call fixlib    # initialize PFTNLIB link frames
   call icomn$    # initialize Subsystem common areas
   call first$ (first)  # see if this is first invocation

   call rdtk$$ (1, info, cmd, 2, code)    # get first argument
   if (info (1) == 1 && and (info (3), 8r20000) ~= 0
         && and (info (3), :100000) ~= 0)
      Comunit = -info (4)  # set command input unit number
   else {   # not a dash argument
      call comi$$ ("PAUSE", 5, 0, code)
      close_files
      }

   call utype$ (i)         # see what kind of user we are
   if (i >= LOW_TERMINAL_USER & i <= HIGH_TERMINAL_USER)
      Is_phantom = NO
   elif (i >= LOW_PHANTOM_USER & i <= HIGH_PHANTOM_USER)
      Is_phantom = YES
   else                    # error; assume default
      Is_phantom = YES

   get_password      # prompt for Subsystem password, if necessary
   get_term_type     # prompt for terminal type, if necessary
   call ldtmp$       # Initialize per-user templates
   call scopy (DEFAULT_CI_NAME, 1, ciname, 1)

   if (getto ("=varsfile="s, fname, junk, junk) == ERR) {
      call remark ("You must have a profile directory in the VARS ufd"s)
      call remark ("to run the Subsystem.  Please have your system"s)
      call remark ("administrator create one for you."s)
      return
      }

   if (findf$ (fname) == YES)    # user already has a .vars file
      load_variables
   else {                        # this is a new user; create one
      fd = create (".vars"s, WRITE)
      if (fd == ERR) {
         call remark ("Can't open .VARS in your profile directory."s)
         call remark ("Please check your password and try again."s)
         return
         }
      call print (fd, "*s*n*s*n"s, "_search_rule"s, DEFAULT_SEARCH_RULE)
      call close (fd)
      fd = open ("=extra=/numsg"s, READ)  # This is a new user
      if (fd ~= ERR) {
         call fcopy (fd, TTY)
         call close (fd)
         }
      }

   call follow (EOS, 0)

   if (filtst ("=mail=/=user="s, 0, 0, 1, 0, 0, 0, 0) == YES)
      call remark ("You have mail"s)

   if (filtst ("=news=/delivery/=user="s, 0, 0, 1, 0, 0, 0, 0) == YES)
      call remark ("There is news"s)

   if (getto (ciname, fname, junk, junk) == ERR
         || findf$ (fname) == NO) {
      call print (TTY, "*s: not found*n"s, ciname)
      return
      }

   if (call$$ (fname, 32) == ERR)   # invoke user's shell
      call print (TTY, "*s: can't invoke*n"s, ciname)
   else
      call putch (NEWLINE, TTY)

   return


   # get_password --- query user for his Subsystem password

      procedure get_password {

      local inbuf, str, i, save_lword
      character inbuf (MAXLINE), str (MAXLINE)
      integer i, save_lword
      integer expand, equal, duplx$, getlin, chkstr, gfdata

#      if (expand ("=GaTech="s, str, MAXLINE) ~= ERR
#            && equal (str, "yes"s) == YES)
#         Passwd (1) = EOS
      if (gfdata(FILE_ACL, "=varsdir="s, inbuf, i, str) ~= ERR)
         Passwd (1) = EOS

      elif (first == YES || chkstr (Passwd, 7) == NO) {
         save_lword = duplx$ (-1)   # save current setting
         call duplx$ (or (save_lword, :140000)) # no echo
         call print (TTY, "Password:"s)
         i = getlin (inbuf, TTY)
         call putch (NEWLINE, TTY)
         call duplx$ (save_lword)
         if (i ~= EOF)
            inbuf (i) = EOS            # zap the NEWLINE
         call mapstr (inbuf, UPPER)
         call ctoc (inbuf, Passwd, 7)
         }

      }


   # get_term_type --- find out what type of terminal we're running from

      procedure get_term_type {

      local ttype
      character ttype (MAXTERMTYPE)
      integer ttyp$r, ttyp$v, ttyp$f, ttyp$q

      if (Is_phantom == YES)  # this is a phantom process
         call ttyp$v ("batch"s)
      elif (first == NO
            && ttyp$r (ttype) == YES
            && ttyp$v (ttype) == YES)
         ;
      elif (ttyp$f (ttype) == YES)
         ;
      else
         call ttyp$q (ttype, YES)

      }


   # load_variables --- load profile variables

      procedure load_variables {

      local fd, i, j, k, str, pos, text
      character str (MAXLINE)
      integer i, j
      integer getlin, strlsr
      filedes fd
      filedes open

      string_table pos, text
         /  "_ci_name" _
         /  "_eof" _
         /  "_erase" _
         /  "_escape" _
         /  "_kill" _
         /  "_newline" _
         /  "_retype" _
         /  "_kill_resp" _
         /  "_prt_dest" _
         /  "_prt_form"

      fd = open (".vars"s, READ)
      if (fd == ERR) {
         call remark ("Can't open .VARS in your profile directory."s)
         call remark ("Please check your password and try again."s)
         return   # from swt
         }

      repeat {
         j = getlin (str, fd)
         if (j == EOF)
            break
         if (j > 0)                       # kill NEWLINE
            str (j) = EOS
         i = strlsr (pos, text, 0, str)   # are we interested?
         j = getlin (str, fd)             # get variable value
         if (j > 0)                       # kill the NEWLINE
            str (j) = EOS
         call init_var (i, str, ciname)
         }

      call close (fd)

      }


   # close_files --- close all file units

      procedure close_files {

      local unit, junk, code
      integer unit, code, junk

      unit = 0
      repeat {
         unit += 1
         if (unit == Comunit)
            next
         call srch$$ (4, 0, 0, unit, junk, code)
         } until (code == 29)    # E$BUNT (bad unit number)

      }


   end



# init_var --- initialize a field in the profile from a variable

   subroutine init_var (i, str, ciname)
   integer i
   character str (ARB), ciname (ARB)

   include SWT_COMMON

   integer k
   character mntoc

   k = 1
   select (i - 1)
      when (1)    # _ci_name
         call ctoc (str, ciname, MAXLINE)
      when (2)    # _eof
         Eofchar = mntoc (str, k, ETX)
      when (3)    # _erase
         Echar = mntoc (str, k, BS)
      when (4)    # _escape
         Escchar = mntoc (str, k, ESC)
      when (5)    # _kill
         Kchar = mntoc (str, k, DEL)
      when (6)    # _newline
         Nlchar = mntoc (str, k, LF)
      when (7)    # _retype
         Rtchar = mntoc (str, k, DC2)
      when (8)    # _kill_resp
         call ctoc (str, Kill_resp, MAXKILLRESP)
      when (9)    # _prt_dest
         call ctoc (str, Prt_dest, MAXPRTDEST)
      when (10)   # _prt_form
         call ctoc (str, Prt_form, MAXPRTFORM)

   return
   end
