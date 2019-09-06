# moot --- moot manager

   include ARGUMENT_DEFS
   include "moot_def.r.i"

   external bhndlr         # for 'break' handling
   shortcall mkonu$ (18)   # for 'break' handling

   string usage_message "Usage:  moot [-a <name>]"

   ARG_DECL

   call mkonu$ ("QUIT$"v, loc (bhndlr))   # for 'break' handling
   call initlz

   PARSE_COMMAND_LINE ("a<rs>"s, usage_message)

   if (ARG_PRESENT (a))                         # check for activity
      call check_for_activity (ARG_TEXT (a))
   else {                                       # enter the moot
      call login
      call docmds
      call logout
      call clean
      }

   stop
   end



# author --- change a user's authorizations

   subroutine author

   include commonblocks

   integer p, i
   integer getent

   character uentry (MAXLINE, CUSER_ENTRY_SIZE), perm (MAXLINE),
      buf (MAXLINE), perm2 (MAXLINE)

   string_table aupos, auths _
      /  MAKE_CONF_PERM,     'n'c, "Add Conferences" _
      /  REMOVE_CONF_PERM,   'n'c, "Delete Conferences" _
      /  MAKE_MEMBER_PERM,   'n'c, "Add Members" _
      /  REMOVE_MEMBER_PERM, 'n'c, "Delete Members" _
      /  LIST_CONF_PERM,     'y'c, "List Conferences" _
      /  LIST_USERS_PERM,    'y'c, "List Users" _
      /  MAKE_TEXT_PERM,     'y'c, "Enter Text" _
      /  SUBMIT_TEXT_PERM,   'y'c, "Submit Conference Entries" _
      /  SUBMIT_NOTE_PERM,   'y'c, "Submit Personal Notes" _
      /  ALTER_PERMS_PERM,   'n'c, "Change Authorizations" _
      /  REVIEW_CONF_PERM,   'y'c, "Review Conference Entries" _
      /  REVIEW_NOTE_PERM,   'y'c, "Review Personal Notes" _
      /  JOIN_PERM,          'y'c, "Join Conferences" _
      /  LIST_MEMBERS_PERM,  'y'c, "List Conference Members" _
      /  LOGIN_PERM,         'y'c, "Ability to Log In" _
      /  DEL_USER_PERM,      'n'c, "Delete Users"

   if (Permit (ALTER_PERMS_PERM) == 'n'c) {
      call errmsg ("You are not permitted to change authorizations"p)
      return
      }

   call ask ("User:  "p, buf)
   if (buf (1) == EOS)
      return
   call inient (uentry, CUSER_ENTRY_SIZE)
   call putkey (uentry, buf)
   if (getent (uentry, CUSER_ENTRY_SIZE, Mulfil, YES) == EOF) {
      call errmsg ("That is not the name of a Moot user"p)
      return
      }

   call getdat (perm, PERMISSIONS_FLAG, uentry, CUSER_ENTRY_SIZE)
   if (perm (LOGIN_PERM) == 'n'c) {
      call errmsg ("User is currently logged in; authorization"p)
      call errmsg ("may not be changed"p)
      return
      }

   for (i = 2; i <= aupos (1) + 1; i += 1) {
      p = aupos (i)
      call getyn (auths (p), auths (p + 1), auths (p + 2), perm)
      }

   for (i = 1; i <= NUMBER_OF_PERMS; i += 1)
      if (Permit (i) == 'n'c && perm (i) == 'y'c) {
         call errmsg ("Sorry, new authorizations must be a subset"p)
         call errmsg ("of your own"p)
         return
         }

   call lock         ### begin critical section
   if (getent (uentry, CUSER_ENTRY_SIZE, Mulfil, NO) == EOF) {
      call unlock    ### end critical section
      call errmsg ("User disappeared while permissions were changing"p)
      return
      }
   call getdat (perm2, PERMISSIONS_FLAG, uentry, CUSER_ENTRY_SIZE)
   if (perm2 (LOGIN_PERM) == 'n'c) {
      call unlock    ### end critical section
      call errmsg ("User logged in...authorizations may not change"p)
      return
      }
   call putdat (perm, PERMISSIONS_FLAG, uentry, CUSER_ENTRY_SIZE)
   call updent (uentry, CUSER_ENTRY_SIZE, Mulfil, NO)
   call unlock       ### end critical section

   return
   end



# bhndlr --- Prime-specific break handling routine

   subroutine bhndlr (param)
   long_int param

   include commonblocks

   Broke = YES

   return
   end



# check_for_activity --- check all of a user's conferences for activity

   subroutine check_for_activity (user_name)
   character user_name (ARB)

   include commonblocks

   character centry (MAXLINE, CONF_ENTRY_SIZE),
      uentry (MAXLINE, USERLIST_ENTRY_SIZE),
      buf (MAXLINE), cname (MAXLINE)

   integer l, last_entered, num_confs
   integer ctoi, getent, getlin

   filedes clfd, scrfd
   filedes open, mktemp

   num_confs = 0
   scrfd = mktemp (READWRITE)
   call inient (uentry, USERLIST_ENTRY_SIZE)
   call putkey (uentry, user_name)
   call inient (centry, CONF_ENTRY_SIZE)

   call lock

   clfd = open (Clfil, READ)

   repeat {
      l = getlin (cname, clfd)
      if (l == EOF)
         break
      cname (l) = EOS
      if (cname (1) == KEY_FLAG) {           # got a conference name?
         call putkey (centry, cname (2))     # subarray
         l = getent (centry, CONF_ENTRY_SIZE, Clfil, NO)
         call getdat (buf, LAST_ENTRY_FLAG, centry, CONF_ENTRY_SIZE)
         l = 1
         last_entered = ctoi (buf, l)
         call getdat (buf, USER_FILE_FLAG, centry, CONF_ENTRY_SIZE)
         if (getent (uentry, USERLIST_ENTRY_SIZE, buf, NO) ~= EOF) {
            call getdat (buf, LAST_ENTRY_FLAG, uentry, USERLIST_ENTRY_SIZE)
            l = 1
            if (last_entered > ctoi (buf, l)) {
               call print (scrfd, "*s*n"s, cname (2))
               num_confs += 1
               }
            }
         # else user is not in this conference
         }
      }  # repeat

   call close (clfd)

   call unlock

   if (num_confs > 0) {
      call print (STDOUT, "The following conferences are active:*n"s)
      call rewind (scrfd)
      while (getlin (buf, scrfd) ~= EOF)
         call print (STDOUT, "     *s"s, buf)
      }

   call rmtemp (scrfd)
   return
   end



# ckmesg --- check for any conference messages or personal notes

   subroutine ckmesg

   include commonblocks

   integer i, lseen, lentrd
   integer ctoi, itoc, length, getlin, getent

   character buf (MAXLINE), centry (MAXLINE, CONF_ENTRY_SIZE)

   file_des fd
   file_des open

   if (Joined) {
      call inient (centry, CONF_ENTRY_SIZE)
      call putkey (centry, Connam)
      if (getent (centry, CONF_ENTRY_SIZE, Clfil, YES) == EOF)
         return      # ???
      call getdat (buf, LAST_ENTRY_FLAG, centry, CONF_ENTRY_SIZE)
      i = 1
      lentrd = ctoi (buf, i)
      call getdat (buf, LAST_ENTRY_FLAG, Conent, USERLIST_ENTRY_SIZE)
      i = 1
      lseen = ctoi (buf, i)
      if (lentrd > lseen + 10)
         call print (STDOUT, "You have seen *i messages out of *i.*n"s,
            lseen, lentrd)
      else if (lentrd > lseen)
         call revces (lseen + 1, lentrd)
      }

   call getdat (buf, MARK_FLAG, Cuser, CUSER_ENTRY_SIZE)
   i = 1
   lseen = ctoi (buf, i)
   call lock         ### begin critical section
   fd = open (Npnfil, READ)
   if (fd == ERR) {
      call unlock       ### end critical section
      return
      }
   i = getlin (buf, fd)
   call close (fd)
   i = 1
   lentrd = ctoi (buf, i)
   call unlock       ### end critical section
   if (lentrd > lseen)
      call revpns (lseen + 1, lentrd)

   return
   end



# clean --- clean up after the Moot is over

   subroutine clean

   include commonblocks

   call remove (Entfil)

   return
   end



# docmds --- read and execute 'moot' commands

   subroutine docmds

   include commonblocks

   integer getcmd

   string_table cmdpos, cmds _
      /  1, "add conference" _
      /  2, "delete conference" _
      /  3, "add member" _
      /  4, "delete member" _
      /  5, "list conferences" _
      /  6, "list users" _
      / 11, "list members" _
      /  7, "enter" _
      /  8, "edit" _
      /  9, "join" _
      / 17, "index" _
      / 10, "review" _
      / 12, "submit" _
      / 13, "authorize" _
      / 14, "status" _
      / 15, "mail" _
      / 16, "letter" _
      / 99, "quit"

   repeat {
      Broke = NO
      Cmdcnt += 1
      if (Cmdcnt > MESG_CHECK_COUNT) {
         Cmdcnt = 1
         call ckmesg
         }
      select (getcmd ("."p, cmdpos, cmds))
         when ( 1)      call mkconf
         when ( 2)      call rmconf
         when ( 3)      call mkmemb
         when ( 4)      call rmmemb
         when ( 5)      call lconfs
         when ( 6)      call lusers
         when ( 7)      call mktext
         when ( 8)      call edit_buffer
         when ( 9)      call join
         when (10)      call revcen
         when (11)      call lmemb
         when (12)      call subcen
         when (13)      call author
         when (14)      call status
         when (15)      call subpn
         when (16)      call revpn
         when (17)      call index
         when (99, EOF) break
      }

   return
   end



# edit_buffer --- edit stuff in user's text buffer

   subroutine edit_buffer

   include commonblocks

   file_des entfd
   file_des open

   entfd = open (Entfil, READ)
   if (entfd == ERR) {
      call errmsg ("No entry has been made"p)
      return
      }
   call close (entfd)

   call edit (Entfil, STDIN, STDOUT)

   return
   end



# errmsg --- print error message, flush the input buffer

   subroutine errmsg (msg)
   packed_char msg (ARB)

   include commonblocks

   call remark (msg)
   Inbuf (Ibp) = EOS

   return
   end



#  index --- print index of entries in current conference.

   subroutine index

   include commonblocks

   file_des scrfd, textfd
   file_des open, mktemp

   integer l, number
   integer getlin

   character line (MAXLINE), number (MAXLINE), sender (MAXLINE),
      subj (MAXLINE), date (MAXLINE)

   if (~Joined) {
      call errmsg("You are not currently in a conference"p)
      return
      }

   scrfd = mktemp (READWRITE)

   call lock      ### begin critical section

   textfd = open (Curinx, READ)
   if (textfd == ERR) {
      call putlin (Curinx, ERROUT)
      call errmsg (":  can't open"p)
      call unlock       ### end critical section
      return
      }

   call print (scrfd,
      " No.*11tName*41tSubject*72tDate*n*n"s)

   repeat {
      l = getlin (line, textfd)
      if (l ~= EOF) {
         line (l) = EOS
         select (line (1))
            when (KEY_FLAG)
               call scopy (line, 2, number, 1)
            when (SENDER_FLAG)
               call scopy (line, 2, sender, 1)
            when (SUBJECT_FLAG)
               call scopy (line, 2, subj, 1)
            when (DATE_FLAG)
               call scopy (line, 11, date, 1)
            when (MARK_FLAG)
               call print (scrfd,
                  "*4,4s *16,16s *46,46s *8,8s.*n"s,
                  number, sender, subj, date)
         }
      } until (l == EOF)

   call close (textfd)

   call unlock       ### end of critical section

   call rewind (scrfd)     ### list index
   call page (scrfd,
      "page *i; continue? "s,
      "page *i (final page) "s,
      22, STDOUT, PG_VTH)

   call rmtemp (scrfd)

   return
   end



# initlz --- initialize everything

   subroutine initlz

   include commonblocks

   integer i

   string clstr  CONFERENCE_LIST_FILE
   string mulstr MASTER_USERLIST_FILE
   string pnistr PN_INDEX_FILE
   string pntstr PN_TEXT_FILE
   string npnstr PN_NUMBER_FILE

   Broke = NO

   do i = 1, NUMBER_OF_PERMS
      Permit (i) = 'y'c
   Permit (MAKE_CONF_PERM) = 'n'c
   Permit (REMOVE_CONF_PERM) = 'n'c
   Permit (MAKE_MEMBER_PERM) = 'n'c
   Permit (REMOVE_MEMBER_PERM) = 'n'c
   Permit (ALTER_PERMS_PERM) = 'n'c
   Permit (NUMBER_OF_PERMS + 1) = EOS

   call inient (Cuser, CUSER_ENTRY_SIZE)
   call inient (Conent, USERLIST_ENTRY_SIZE)

   call scopy (clstr, 1, Clfil, 1)
   call scopy (mulstr, 1, Mulfil, 1)
   call scopy (pnistr, 1, Pnifil, 1)
   call scopy (pntstr, 1, Pntfil, 1)
   call scopy (npnstr, 1, Npnfil, 1)

   call scratf (Entfil, MAXLINE)

   Ibp = 1
   Inbuf (Ibp) = EOS

   Cmdcnt = MESG_CHECK_COUNT

   return
   end



# join --- join a conference or return to command level

   subroutine join

   include commonblocks

   character centry (MAXLINE, CONF_ENTRY_SIZE),
      buf (MAXLINE)

   integer getent

   filedes txtfd, inxfd, ulfd
   filedes open

   if (Permit (JOIN_PERM) == 'n'c) {
      call errmsg ("You are not permitted to join conferences"p)
      return
      }

   call updcen

   call inient (centry, CONF_ENTRY_SIZE)
   call ask ("Conference: "p, buf)
   if (buf (1) == EOS)
      return                  # do nothing; we're already out
   call putkey (centry, buf)
   if (getent (centry, CONF_ENTRY_SIZE, Clfil, YES) == EOF) {
      call errmsg ("That is not the name of an active conference"p)
      return
      }
   call getkey (centry, Connam)
   call getdat (Curtxt, TEXT_FILE_FLAG, centry, CONF_ENTRY_SIZE)
   call getdat (Curinx, INDEX_FILE_FLAG, centry, CONF_ENTRY_SIZE)
   call getdat (Curul, USER_FILE_FLAG, centry, CONF_ENTRY_SIZE)

   call lock
   txtfd = open (Curtxt, READWRITE)
   if (txtfd ~= ERR)
      call close (txtfd)
   inxfd = open (Curinx, READWRITE)
   if (inxfd ~= ERR)
      call close (inxfd)
   ulfd = open (Curul, READWRITE)
   if (ulfd ~= ERR)
      call close (ulfd)
   call unlock
   if (txtfd == ERR || inxfd == ERR || ulfd == ERR) {
      call errmsg ("System security is preventing access to that conference"p)
      return
      }

   if (getent (Conent, USERLIST_ENTRY_SIZE, Curul, YES) == EOF) {
      call errmsg ("You are not a member of that conference"p)
      return
      }

   Joined = .true.

   return
   end



# lconfs --- list active conferences

   subroutine lconfs

   include commonblocks

   character buf (MAXLINE)

   integer getlin

   file_des scr, fd
   file_des mktemp, open

   if (Permit (LIST_CONF_PERM) == 'n'c) {
      call errmsg ("You are not permitted to list active conferences"p)
      return
      }

   scr = mktemp (READWRITE)

   call lock      ### begin critical section

   fd = open (Clfil, READ)
   if (fd == ERR) {
      call errmsg ("can't open conference list"p)
      return
      }

   call fcopy (fd, scr)

   call close (fd)

   call unlock    ### end critical section

   call rewind (scr)
   while (getlin (buf, scr) ~= EOF) {
      if (buf (1) == KEY_FLAG)
         call putlin (buf (2), STDOUT)
      if (Broke == YES)
         break
      }
   call rmtemp (scr)

   return
   end



# lmemb --- list members of the current conference

   subroutine lmemb

   include commonblocks

   character buf (MAXLINE)

   integer l
   integer getlin

   file_des scr, fd
   file_des mktemp, open

   if (Permit (LIST_MEMBERS_PERM) == 'n'c) {
      call errmsg ("You are not permitted to list conference members"p)
      return
      }

   if (~Joined) {
      call lusers    # list everybody if we're not in a conference
      return
      }

   scr = mktemp (READWRITE)

   call lock      ### begin critical section

   fd = open (Curul, READ)
   if (fd == ERR) {
      call errmsg ("can't open users list"p)
      return
      }

   call fcopy (fd, scr)

   call close (fd)

   call unlock    ### end critical section

   call rewind (scr)
   repeat {
      l = getlin (buf, scr)
      if (l == EOF || Broke == YES)
         break
      if (buf (1) == KEY_FLAG) {
         buf (l) = EOS
         call print (STDOUT, "*s*30t "s, buf (2))
         l = getlin (buf, scr)      # the last entry seen
         buf (l) = EOS
         call print (STDOUT, "*s*5t "s, buf (2))
         l = getlin (buf, scr)      # status (observer/participant)
         buf (l) = EOS
         call print (STDOUT, "*s*15t "s, buf (2))
         l = getlin (buf, scr)      # time/date of last entry
         call putlin (buf (2), ERROUT)
         }
      }
   call rmtemp (scr)

   return
   end



# login --- log user into the moot, create an account if necessary

   subroutine login

   include commonblocks

   character pword (MAXLINE), buf (MAXLINE)

   integer duplex, code
   integer getent, equal, duplx$, sem$ts

   file_mark fm

   repeat
      call ask ("Please enter your name:  "p, buf)
      until (buf (1) ~= EOS)
   call putkey (Cuser, buf)

  # Kluge to see if locking semaphore might be messed up:
   if (sem$ts (1, code) ~= -1) {
      call sleep$ (intl (5000))
      if (sem$ts (1, code) ~= -1)
         call error ("The data base is locked --- please ask for assistance"p)
      }

   call lock      ### begin critical section
   if (getent (Cuser, CUSER_ENTRY_SIZE, Mulfil, NO) == EOF) {

     # a new user; set up a dummy entry to lock out further logins
      call putdat (EOS, PWORD_FLAG, Cuser, CUSER_ENTRY_SIZE)
      fm = 0      # file mark zero is assumed to be beginning-of-file
      call fmtoc (fm, buf)
      call putdat (buf, MARK_FLAG, Cuser, CUSER_ENTRY_SIZE)
      call gettim (buf)
      call putdat (buf, DATE_FLAG, Cuser, CUSER_ENTRY_SIZE)
      Permit (LOGIN_PERM) = 'n'c
      call putdat (Permit, PERMISSIONS_FLAG, Cuser, CUSER_ENTRY_SIZE)
      call makent (Cuser, CUSER_ENTRY_SIZE, Mulfil, NO)

      call unlock       ### end critical section

      call remark ("Ah, an unfamiliar name."p)
      call remark ("If you would like the name you just specified"p)
      call remark ("to be the name by which Moot will identify you"p)
      call remark ("(the management recommends calling name followed"p)
      call remark ("by last name, both capitalized), please verify"p)
      call ask ("by typing 'y':  "p, buf)
      if (buf (1) ~= 'y'c && buf (1) ~= 'Y'c) {
         call remark ("Very well.  Please reenter Moot and try again."p)
         call getkey (Cuser, buf)
         call delent (buf, Mulfil, YES)
         stop
         }
      call remark ("Please enter a secret password, which will be"p)
      duplex = duplx$ (-1)    # get current duplex
      call duplx$ (:140000)   # switch to half duplex
      call ask ("required to reenter the Moot in the future: "p, pword)
      call duplx$ (duplex)    # go back to original duplex
      call remark (""p)
      call pwcryp (pword)
      call putdat (pword, PWORD_FLAG, Cuser, CUSER_ENTRY_SIZE)
      }

   else {   # An old friend.  Be paranoid and check his password anyway.
      call getdat (Permit, PERMISSIONS_FLAG, Cuser, CUSER_ENTRY_SIZE)
      if (Permit (LOGIN_PERM) == 'n'c) {
         call unlock       ### end critical section
         call error ("You are not permitted to log in now"p)
         }
      Permit (LOGIN_PERM) = 'n'c
      call putdat (Permit, PERMISSIONS_FLAG, Cuser, CUSER_ENTRY_SIZE)
      call updent (Cuser, CUSER_ENTRY_SIZE, Mulfil, NO)

      call unlock       ### temporary end of critical section

      duplex = duplx$ (-1)       # get current duplex
      call duplx$ (:140000)      # switch to half dup
      call ask ("Please enter your password: "p, pword)
      call duplx$ (duplex)       # back to original state
      call remark (""p)
      call pwcryp (pword)
      call getdat (buf, PWORD_FLAG, Cuser, CUSER_ENTRY_SIZE)
      if (equal (pword, buf) == NO) {
         call remark ("Your password was incorrect"p)
         call remark ("Please recheck it and try again"p)
         Permit (LOGIN_PERM) = 'y'c
         call putdat (Permit, PERMISSIONS_FLAG, Cuser, CUSER_ENTRY_SIZE)
         call updent (Cuser, CUSER_ENTRY_SIZE, Mulfil, YES)
         stop
         }
      }

   Permit (LOGIN_PERM) = 'y'c
   call putdat (Permit, PERMISSIONS_FLAG, Cuser, CUSER_ENTRY_SIZE)

   call remark ("Welcome to the Moot."p)
   Joined = .false.
   call getkey (Cuser, User)        # record full name of user
   call putkey (Conent, User)       # save for conference control

   return
   end



# logout --- log a user out of the moot, update his accounting info

   subroutine logout

   include commonblocks

   character buf (MAXLINE)

   call updcen       # if we're in a conference, update our entry

   call gettim (buf)
   call putdat (buf, DATE_FLAG, Cuser, CUSER_ENTRY_SIZE)
   call updent (Cuser, CUSER_ENTRY_SIZE, Mulfil, YES)

   return
   end



# lusers --- list all 'moot' users

   subroutine lusers

   include commonblocks

   character buf (MAXLINE)

   integer l
   integer getlin

   file_des scr, fd
   file_des mktemp, open

   if (Permit (LIST_USERS_PERM) == 'n'c) {
      call errmsg ("You are not permitted to list Moot users"p)
      return
      }

   scr = mktemp (READWRITE)

   call lock      ### begin critical section

   fd = open (Mulfil, READ)
   if (fd == ERR) {
      call errmsg ("can't open users list"p)
      return
      }

   call fcopy (fd, scr)

   call close (fd)

   call unlock    ### end critical section

   call rewind (scr)
   repeat {
      l = getlin (buf, scr)
      if (l == EOF || Broke == YES)
         break
      if (buf (1) == KEY_FLAG) {
         buf (l) = EOS
         call print (STDOUT, "*s*30t"s, buf (2))
         l = getlin (buf, scr)
         if (buf (1) == DATE_FLAG)
            call putlin (buf (2), STDOUT)
         l = getlin (buf, scr)
         if (buf (1) == DATE_FLAG)
            call putlin (buf (2), STDOUT)
         l = getlin (buf, scr)
         if (buf (1) == DATE_FLAG)
            call putlin (buf (2), STDOUT)
         }
      }
   call rmtemp (scr)

   return
   end



# mkconf --- create a new conference

   subroutine mkconf

   include commonblocks

   integer getent

   character entry (MAXLINE, CONF_ENTRY_SIZE), answer (MAXLINE)

   logical equnam

   file_des fd
   file_des create

   if (Permit (MAKE_CONF_PERM) == 'n'c) {
      call errmsg ("You are not permitted to make conferences"p)
      return
      }

   call inient (entry, CONF_ENTRY_SIZE)
   call ask ("Title: "p, answer)
   call putkey (entry, answer)

   if (getent (entry, 1, Clfil, YES) ~= EOF) {
      call errmsg ("A conference by that name already exists"p)
      return
      }

   call ask ("Access (open or closed): "p, answer)
   if (~equnam (answer, "open"s) && ~equnam (answer, "closed"s)) {
      call errmsg ("Access must be 'open' or 'closed'"p)
      return
      }
   call putdat (answer, ACCESS_FLAG, entry, CONF_ENTRY_SIZE)

   call putdat ("0"s, LAST_ENTRY_FLAG, entry, CONF_ENTRY_SIZE)

   call gettim (answer)
   call putdat (answer, DATE_FLAG, entry, CONF_ENTRY_SIZE)

   call ask ("File for storage of text: "p, answer)
   call putdat (answer, TEXT_FILE_FLAG, entry, CONF_ENTRY_SIZE)

   call ask ("File for storage of index: "p, answer)
   call putdat (answer, INDEX_FILE_FLAG, entry, CONF_ENTRY_SIZE)

   call ask ("File for storage of user list: "p, answer)
   call putdat (answer, USER_FILE_FLAG, entry, CONF_ENTRY_SIZE)

   call ask ("Is the information above acceptable? "p, answer)
   if (~equnam (answer, "yes"s))
      return

   call getdat (answer, TEXT_FILE_FLAG, entry, CONF_ENTRY_SIZE)
   fd = create (answer, READWRITE)
   if (fd == ERR)
      call cant (answer)
   call close (fd)

   call getdat (answer, INDEX_FILE_FLAG, entry, CONF_ENTRY_SIZE)
   fd = create (answer, READWRITE)
   if (fd == ERR)
      call cant (answer)
   call close (fd)

   call getdat (answer, USER_FILE_FLAG, entry, CONF_ENTRY_SIZE)
   fd = create (answer, READWRITE)
   if (fd == ERR)
      call cant (answer)
   call close (fd)

   call makent (entry, CONF_ENTRY_SIZE, Clfil, YES)

   return
   end



# mkmemb --- add a user to a conference

   subroutine mkmemb

   include commonblocks

   character centry (MAXLINE, CONF_ENTRY_SIZE),
      uentry (MAXLINE, USERLIST_ENTRY_SIZE),
      buf (MAXLINE)

   integer junk
   integer getent, itoc

   logical equnam

   if (Permit (MAKE_MEMBER_PERM) == 'n'c) {
      call errmsg ("You are not permitted to add members to conferences"p)
      return
      }

   call inient (centry, CONF_ENTRY_SIZE)
   call ask ("Conference name: "p, buf)
   if (buf (1) == EOS)
      return
   call putkey (centry, buf)
   if (getent (centry, CONF_ENTRY_SIZE, Clfil, YES) == EOF) {
      call errmsg ("That is not the name of an active conference"p)
      return
      }

   call inient (uentry, USERLIST_ENTRY_SIZE)
   call ask ("User name: "p, buf)
   if (buf (1) == EOS)
      return
   call putkey (uentry, buf)
   if (getent (uentry, USERLIST_ENTRY_SIZE, centry (2, 7), YES) ~= EOF) {
      call errmsg ("The user is already a member of the conference"p)
      return
      }

   if (getent (uentry, 1, Mulfil, YES) == EOF)
      call errmsg ("Warning:  there is no Moot user by that name"p)

   call putdat ("0"s, LAST_ENTRY_FLAG, uentry, USERLIST_ENTRY_SIZE)

   repeat {
      call ask ("'Observer' or 'participant' status? "p, buf)
      if (equnam (buf, "observer"s) || equnam (buf, "participant"s))
         break
      call errmsg ("Please enter 'observer' or 'participant'"p)
      }
   call putdat (buf, USER_STATUS_FLAG, uentry, USERLIST_ENTRY_SIZE)

   call putdat (EOS, DATE_FLAG, uentry, USERLIST_ENTRY_SIZE)

   call getdat (buf, USER_FILE_FLAG, centry, CONF_ENTRY_SIZE)
   call makent (uentry, USERLIST_ENTRY_SIZE, buf, YES)

   return
   end



# mktext --- make text of an entry

   subroutine mktext

   include commonblocks

   character buf (MAXLINE)

   file_des fd
   file_des create

   if (Permit (MAKE_TEXT_PERM) == 'n'c) {
      call errmsg ("You are not permitted to enter text"p)
      return
      }

   call remove (Entfil)
   fd = create (Entfil, READWRITE)
   if (fd == ERR) {
      call errmsg ("can't open temporary file for text storage"p)
      return
      }

   call ask ("Subject: "p, buf)
   call putlin (buf, fd)
   call putch (NEWLINE, fd)

   call ask ("Reference entries: "p, buf)
   call putlin (buf, fd)
   call putch (NEWLINE, fd)

   call remark ("Text:"p)
   call fcopy (STDIN, fd)

   call close (fd)
   return
   end



# revcen --- review one or a range of conference entries by number

   subroutine revcen

   include commonblocks

   character buf (MAXLINE)

   integer start, finish, i
   integer ctoi

   if (~Joined) {
      call errmsg ("You are not currently in a conference"p)
      return
      }

   if (Permit (REVIEW_CONF_PERM) == 'n'c) {
      call errmsg ("You are not permitted to review conference entries"p)
      return
      }

   call ask ("Entry or range of entries: "p, buf)
   i = 1
   start = ctoi (buf, i)
   if (start == 0) {
      call errmsg ("Entries are specified by number"p)
      return
      }
   if (buf (i) == '-'c) {
      i += 1
      finish = ctoi (buf, i)
      if (finish == 0) {
         call errmsg ("Entries are specified by number"p)
         return
         }
      if (finish < start)
         finish = start
      }
   else
      finish = start

   call revces (start, finish)

   return
   end



# revces --- review a given range of conference entries

   subroutine revces (start, finish)
   integer start, finish

   include commonblocks

   integer i, l, lseen, lrevd
   integer ctoi, getent, getlin

   character buf (MAXLINE), ientry (MAXLINE, CMESG_ENTRY_SIZE),
      sender (MAXLINE), subj (MAXLINE), xref (MAXLINE),
      date (MAXLINE)

   file_mark sm

   file_des textfd, scrfd
   file_des open, mktemp

   call itoc0f (start, buf, 5)
   call inient (ientry, CMESG_ENTRY_SIZE)
   call putkey (ientry, buf)
   if (getent (ientry, CMESG_ENTRY_SIZE, Curinx, YES) == EOF) {
      call errmsg ("Entry number specified is out of range"p)
      return
      }

   call getdat (buf, MARK_FLAG, ientry, CMESG_ENTRY_SIZE)
   call ctofm (buf, sm)

   scrfd = mktemp (READWRITE)

   call lock         ### begin critical section

   textfd = open (Curtxt, READ)
   if (textfd == ERR) {
      call unlock    ### end critical section
      call error ("Fatal error --- can't open text storage file"p)
      }

   call seekf (sm, textfd)

   repeat {
      l = getlin (buf, textfd)
      if (l == EOF || Broke == YES)
         break
      select (buf (1))
         when (KEY_FLAG) {
            i = 2
            lrevd = ctoi (buf, i)
            if (lrevd > finish) {
               lrevd = lrevd - 1
               break
               }
            call print (scrfd, "*n*n[*i] "s, lrevd)
            }
         when (SENDER_FLAG) {
            buf (l) = EOS
            call scopy (buf, 2, sender, 1)
            }
         when (SUBJECT_FLAG)
            call scopy (buf, 2, subj, 1)
         when (XREF_ENTRY_FLAG)
            call scopy (buf, 2, xref, 1)
         when (DATE_FLAG)
            call scopy (buf, 2, date, 1)
         when (TEXT_FLAG) {
            call print (scrfd, "*s, *sRe:  *sCross-Reference:  *s*n"s,
               sender, date, subj, xref)
            repeat {
               call putlin (buf (2), scrfd)
               l = getlin (buf, textfd)
               } until (buf (1) == ENDMARKER)
            }
      }

   call close (textfd)

   call unlock       ### end critical section

   call rewind (scrfd)     # position to beginning-of-file
   call page (scrfd,
      "page *i; continue? "s,
      "page *i (final page) "s,
      22, STDOUT, PG_VTH)

   call getdat (buf, LAST_ENTRY_FLAG, Conent, USERLIST_ENTRY_SIZE)
   i = 1
   lseen = ctoi (buf, i)
   if (lrevd > lseen) {
      call itoc0f (lrevd, buf, 5)
      call putdat (buf, LAST_ENTRY_FLAG, Conent, USERLIST_ENTRY_SIZE)
      }

   call rmtemp (scrfd)

   return
   end



# revpn --- review one or a range of personal notes, by number

   subroutine revpn

   include commonblocks

   character buf (MAXLINE)

   integer start, finish, i
   integer ctoi

   if (Permit (REVIEW_NOTE_PERM) == 'n'c) {
      call errmsg ("You are not permitted to review personal notes"p)
      return
      }

   call ask ("Note number or range of numbers: "p, buf)
   i = 1
   start = ctoi (buf, i)
   if (start == 0) {
      call errmsg ("Notes are specified by number"p)
      return
      }
   if (buf (i) == '-'c) {
      i += 1
      finish = ctoi (buf, i)
      if (finish == 0) {
         call errmsg ("Notes are specified by number"p)
         return
         }
      if (finish < start)
         finish = start
      }
   else
      finish = start

   call revpns (start, finish)

   return
   end



# revpns --- review given personal notes

   subroutine revpns (start, finish)
   integer start, finish

   include commonblocks

   integer i, l, noteno, lastnt
   integer ctoi, getent, getlin

   character buf (MAXLINE), pentry (MAXLINE, PNOTE_ENTRY_SIZE),
      sender (MAXLINE), subj (MAXLINE), xref (MAXLINE),
      date (MAXLINE)

   logical equnam

   file_mark sm

   file_des textfd, scrfd
   file_des open, mktemp

   call getdat (buf, MARK_FLAG, Cuser, CUSER_ENTRY_SIZE)
   i = 1
   lastnt = ctoi (buf, i)

   call itoc0f (start, buf, 5)
   call inient (pentry, PNOTE_ENTRY_SIZE)
   call putkey (pentry, buf)
   if (getent (pentry, PNOTE_ENTRY_SIZE, Pnifil, YES) == EOF) {
      call errmsg ("Note number specified is out of range"p)
      return
      }

   call getdat (buf, MARK_FLAG, pentry, PNOTE_ENTRY_SIZE)
   call ctofm (buf, sm)

   scrfd = mktemp (READWRITE)

   call lock         ### begin critical section

   textfd = open (Pntfil, READ)
   if (textfd == ERR) {
      call unlock    ### end critical section
      call error ("Fatal error --- can't open text storage file"p)
      }

   call seekf (sm, textfd)

   repeat {
      l = getlin (buf, textfd)
      if (l == EOF || Broke == YES)
         break
      select (buf (1))
         when (KEY_FLAG) {
            i = 2
            noteno = ctoi (buf, i)
            if (noteno > finish)
               break
            lastnt = max0 (noteno, lastnt)  # for updating last note seen
            }
         when (SENDER_FLAG) {
            buf (l) = EOS
            call scopy (buf, 2, sender, 1)
            }
         when (ADDRESSEE_FLAG) {
            buf (l) = EOS
            if (~equnam (buf (2), User))
               while (buf (1) ~= ENDMARKER)
                  l = getlin (buf, textfd)
            }
         when (SUBJECT_FLAG)
            call scopy (buf, 2, subj, 1)
         when (XREF_ENTRY_FLAG)
            call scopy (buf, 2, xref, 1)
         when (DATE_FLAG)
            call scopy (buf, 2, date, 1)
         when (TEXT_FLAG) {
            call print (scrfd,
               "*n*n[*i] *s, *sRe:  *sCross-reference:  *s*n"s,
               noteno, sender, date, subj, xref)
            repeat {
               call putlin (buf (2), scrfd)
               l = getlin (buf, textfd)
               } until (buf (1) == ENDMARKER)
            }
      }

   call close (textfd)

   call unlock       ### end critical section

   call rewind (scrfd)     # position to beginning-of-file
   call page (scrfd,
      "page *i; continue? "s,
      "page *i (final page) "s,
      22, STDOUT, PG_VTH)

   call rmtemp (scrfd)

   call itoc0f (lastnt, buf, 5)
   call putdat (buf, MARK_FLAG, Cuser, CUSER_ENTRY_SIZE)

   return
   end



# rmconf --- remove a conference

   subroutine rmconf

   include commonblocks

   character entry (MAXLINE, CONF_ENTRY_SIZE), buf (MAXLINE)

   integer getent

   if (Permit (REMOVE_CONF_PERM) == 'n'c) {
      call errmsg ("You are not permitted to remove conferences"p)
      return
      }

   call inient (entry, CONF_ENTRY_SIZE)
   call ask ("Conference name: "p, buf)
   if (buf (1) == EOS)
      return
   call putkey (entry, buf)
   if (getent (entry, CONF_ENTRY_SIZE, Clfil, YES) == EOF) {
      call errmsg ("That is not the name of an active conference"p)
      return
      }

   call getdat (buf, TEXT_FILE_FLAG, entry, CONF_ENTRY_SIZE)
   call remove (buf)
   call getdat (buf, INDEX_FILE_FLAG, entry, CONF_ENTRY_SIZE)
   call remove (buf)
   call getdat (buf, USER_FILE_FLAG, entry, CONF_ENTRY_SIZE)
   call remove (buf)

   call getkey (entry, buf)
   call delent (buf, Clfil, YES)

   return
   end



# rmmemb --- remove a user from a conference

   subroutine rmmemb

   include commonblocks

   character centry (MAXLINE, CONF_ENTRY_SIZE), name (MAXLINE),
      buf (MAXLINE)

   integer getent

   if (Permit (REMOVE_MEMBER_PERM) == 'n'c) {
      call errmsg ("You are not permitted to remove members from conferences"p)
      return
      }

   call inient (centry, CONF_ENTRY_SIZE)
   call ask ("Conference name: "p, name)
   if (name (1) == EOS)
      return
   call putkey (centry, name)
   if (getent (centry, CONF_ENTRY_SIZE, Clfil, YES) == EOF) {
      call errmsg ("That is not the name of an active conference"p)
      return
      }

   call ask ("User name: "p, name)
   if (name (1) == EOS)
      return
   call getdat (buf, USER_FILE_FLAG, centry, CONF_ENTRY_SIZE)
   call delent (name, buf, YES)

   return
   end



# status --- print miscellaneous status information

   subroutine status

   include commonblocks

   character buf (MAXLINE), name (MAXLINE)

   integer getlin

   file_des fd, ulfd
   file_des open, mktemp

   fd = mktemp (READWRITE)

   call lock         ### begin critical section

   ulfd = open (Mulfil, READ)
   if (ulfd == ERR) {
      call unlock    ### end critical section
      call errmsg ("Cannot open master userlist"p)
      return
      }

   while (getlin (buf, ulfd) ~= EOF)
      if (buf (1) == KEY_FLAG)
         call scopy (buf, 2, name, 1)
      else if (buf (1) == PERMISSIONS_FLAG)
         if (buf (LOGIN_PERM + 1) == 'n'c)
            call putlin (name, fd)

   call close (ulfd)

   call unlock       ### end critical section

   call rewind (fd)
   call print (STDOUT, "Present:*n"s)
   while (getlin (buf, fd) ~= EOF)
      call print (STDOUT, "     *s"s, buf)
   call rmtemp (fd)

   if (Joined)
      call print (STDOUT, "*nYou are in conference '*s'*n"s, Connam)
   else
      call print (STDOUT, "*nYou are not in a conference at this time*n"s)

   return
   end



# subcen --- submit conference entry

   subroutine subcen

   include commonblocks

   file_des entfd, textfd
   file_des open

   character centry (MAXLINE, CONF_ENTRY_SIZE),
      ientry (MAXLINE, CMESG_ENTRY_SIZE),
      buf (MAXLINE)

   integer i, le
   integer getent, ctoi, getlin

   logical equnam

   file_mark markf

   if (~Joined) {
      call errmsg ("You are not currently in a conference"p)
      return
      }

   if (Permit (SUBMIT_TEXT_PERM) == 'n'c) {
      call errmsg ("You are not permitted to submit text"p)
      return
      }

   entfd = open (Entfil, READ)
   if (entfd == ERR) {
      call errmsg ("No entry has been made"p)
      return
      }

   call getdat (buf, USER_STATUS_FLAG, Conent, USERLIST_ENTRY_SIZE)
   if (equnam (buf, "observer"s)) {
      call errmsg ("You have 'observer' status only; you cannot submit"p)
      return
      }

   call lock         ### begin critical section

   textfd = open (Curtxt, READWRITE)
   if (textfd == ERR) {
      call unlock       ### end critical section
      call error ("fatal error --- can't open conference text file"p)
      }
   call wind (textfd)   # position to end-of-file

   call inient (centry, CONF_ENTRY_SIZE)
   call putkey (centry, Connam)
   if (getent (centry, CONF_ENTRY_SIZE, Clfil, NO) == EOF) {
      call unlock       ### end critical section
      call error ("fatal error --- can't get conference entry"p)
      }

   call getdat (buf, LAST_ENTRY_FLAG, centry, CONF_ENTRY_SIZE)
   i = 1
   le = ctoi (buf, i) + 1
   call itoc0f (le, buf, 5)
   call putdat (buf, LAST_ENTRY_FLAG, centry, CONF_ENTRY_SIZE)
   call putdat (buf, LAST_ENTRY_FLAG, Conent, USERLIST_ENTRY_SIZE)

   call updent (centry, CONF_ENTRY_SIZE, Clfil, NO)

   call inient (ientry, CMESG_ENTRY_SIZE)
   call putkey (ientry, buf)
   call putdat (User, SENDER_FLAG, ientry, CMESG_ENTRY_SIZE)
   i = getlin (buf, entfd)
   call putdat (buf, SUBJECT_FLAG, ientry, CMESG_ENTRY_SIZE)
   i = getlin (buf, entfd)
   call putdat (buf, XREF_ENTRY_FLAG, ientry, CMESG_ENTRY_SIZE)
   call gettim (buf)
   call putdat (buf, DATE_FLAG, ientry, CMESG_ENTRY_SIZE)
   call fmtoc (markf (textfd), buf)
   call putdat (buf, MARK_FLAG, ientry, CMESG_ENTRY_SIZE)

   call makent (ientry, CMESG_ENTRY_SIZE, Curinx, NO)

   for (i = 1; i <= CMESG_ENTRY_SIZE; i += 1)
      call print (textfd, "*s*n"s, ientry (1, i))

   while (getlin (buf, entfd) ~= EOF)
      call print (textfd, "*c*s"s, TEXT_FLAG, buf)
   call print (textfd, "*c*n"s, ENDMARKER)

   call close (entfd)
   call close (textfd)

   call unlock       ### end critical section

   call print (STDOUT, "*i*n"s, le)

   return
   end



# subpn --- send personal note to another user

   subroutine subpn

   include commonblocks

   character pentry (MAXLINE, PNOTE_ENTRY_SIZE), buf (MAXLINE)

   integer l, i, le
   integer getent, getlin, ctoi

   file_des entfd, textfd, npnfd
   file_des open, create

   file_mark markf

   if (Permit (SUBMIT_NOTE_PERM) == 'n'c) {
      call errmsg ("You are not permitted to send personal notes"p)
      return
      }

   call inient (pentry, PNOTE_ENTRY_SIZE)
   call ask ("Addressee: "p, buf)
   if (buf (1) == EOS)
      return
   call putkey (pentry, buf)
   if (getent (pentry, 1, Mulfil, YES) == EOF) {
      call errmsg ("That name does not correspond to a Moot user"p)
      return
      }
   call putdat (buf, ADDRESSEE_FLAG, pentry, PNOTE_ENTRY_SIZE)
   entfd = open (Entfil, READ)
   if (entfd == ERR) {
      call errmsg ("No entry has been made"p)
      return
      }

   call lock      ### begin critical section

   npnfd = open (Npnfil, READWRITE)
   if (npnfd == ERR) {
      call unlock       ### end critical section
      call error ("Personal note key file is unavailable"p)
      }
   l = getlin (buf, npnfd)
   i = 1
   le = ctoi (buf, i) + 1
   call itoc0f (le, buf, 5)
   call rewind (npnfd)
   call print (npnfd, "*s*n"s, buf)
   call close (npnfd)
   call putkey (pentry, buf)

   textfd = open (Pntfil, READWRITE)
   if (textfd == ERR) {
      call unlock ### end critical section
      call error ("Fatal error --- cannot open text file"p)
      }
   call wind (textfd)      # position to end-of-file

   call putdat (User, SENDER_FLAG, pentry, PNOTE_ENTRY_SIZE)

   l = getlin (buf, entfd)
   call putdat (buf, SUBJECT_FLAG, pentry, PNOTE_ENTRY_SIZE)

   l = getlin (buf, entfd)
   call putdat (buf, XREF_ENTRY_FLAG, pentry, PNOTE_ENTRY_SIZE)

   call gettim (buf)
   call putdat (buf, DATE_FLAG, pentry, PNOTE_ENTRY_SIZE)

   call fmtoc (markf (textfd), buf)
   call putdat (buf, MARK_FLAG, pentry, PNOTE_ENTRY_SIZE)

   call makent (pentry, PNOTE_ENTRY_SIZE, Pnifil, NO)

   for (l = 1; l <= PNOTE_ENTRY_SIZE; l += 1)
      call print (textfd, "*s*n"s, pentry (1, l))

   buf (1) = TEXT_FLAG
   while (getlin (buf (2), entfd) ~= EOF)
      call putlin (buf, textfd)

   call print (textfd, "*c*n"s, ENDMARKER)

   call close (textfd)

   call unlock    ### end critical section

   call print (STDOUT, "*i*n"s, le)
   call close (entfd)

   return
   end



# updcen --- update current conference userlist entry, if necessary

   subroutine updcen

   include commonblocks

   character buf (MAXLINE)

   integer getent

   if (Joined) {        # update info for this conference if necessary
      call gettim (buf)
      call putdat (buf, DATE_FLAG, Conent, USERLIST_ENTRY_SIZE)
      call updent (Conent, USERLIST_ENTRY_SIZE, Curul, YES)
      Joined = .false.
      }

   return
   end
