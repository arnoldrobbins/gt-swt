#  histsub --- perform a history substitution

   integer function histsub(command)
   pointer command

   include HIST_COMMON

   pointer p
   character c
   character lsgetc
   integer histexp, histque


   if (command == 0 || H_on == NO)
      return(OK)

   if (histexp(command) == ERR || histque(command) == ERR)
      return(ERR)

   p = command                   # ensure that any non-null command
   if (lsgetc(p, c) == EOS)      # is set to a legitimate value before
      call lsfree(command, ALL)  # it leaves

   return(OK)
   end



#  histinit --- initialize the history common blocks

   subroutine histinit

   include HIST_COMMON


   H_pf = 1
   H_pl = 1
   H_bf = 1
   H_bl = 1
   H_line = 1

   return
   end



#  histexp --- perform history expansion on a command line

   integer function histexp(command)
   pointer command

   character c
   pointer p, s
   integer hflag
   integer start, len
   character buf(MAXLINE)
   character lsgetc, lspos
   integer histfind, histlook

   hflag = NO
   while (histfind(command, start, len) == OK) {
      if (len >= MAXLINE - 1) {
         call errmsg(command, start, "history token too large"p)
         return(ERR)
         }

      p = command
      call lspos(p, start)
      call lsextr(p, buf, len + 1)
      if (buf(len) == HISTCHAR)
         buf(len) = EOS

      if (histlook(buf, s, command, start) == ERR)
         return(ERR)

#  the following bizzare code exists because lsins doesn't insert a
#  null string correctly if the string to be modifed is also null.
#  I have to check to avoid a slightly irritating bug

      p = s
      call lsdel(command, start, len)
      if (lsgetc(p, c) ~= EOS)
         call lsins(command, start - 1, s, 1, ALL)

      call lsfree(s, ALL)
      hflag = YES
      }

   if (hflag == YES) {
      call lsputf(command, TTY)
      call putch(NEWLINE, TTY)
      }

   return(OK)
   end



#  histque --- place the given command in the history queue

   integer function histque(command)
   pointer command

   include HIST_COMMON

   pointer p
   character c
   character lsgetc

   H_ptr(H_pf) = H_bf
   H_pf = mod(H_pf, MAXHIST) + 1
   if (H_pf == H_pl)
      call histfree

   p = command
   c = lsgetc(p, c)
   while (c ~= EOS && H_pf ~= H_pl) {
      repeat {
         H_buf(H_bf) = c
         c = lsgetc(p, c)
         H_bf = mod(H_bf, HISTSIZE) + 1
         } until (c == EOS || H_bf == H_bl)

      if (H_bf == H_bl)
         call histfree
      }

   if (H_pf ~= H_pl) {
      H_buf(H_bf) = EOS
      H_bf = mod(H_bf, HISTSIZE) + 1

      if (H_bf == H_bl)
         call histfree
      }

   if (H_pf == H_pl) {
      call errmsg(0, 0, "history buffer overflow"p)
      call histinit
      return(ERR)
      }

   return(OK)
   end



#  histfree --- free the next queue pointer

   subroutine histfree

   include HIST_COMMON

   H_pl = mod(H_pl, MAXHIST) + 1
   H_bl = H_ptr(H_pl)
   H_line += 1

   return
   end



#  histfind --- find the start and length of a history pattern

   integer function histfind(command, start, len)
   integer start, len
   pointer command

   pointer p
   character c
   integer subseen
   character lsgetc

   start = 1
   p = command
   c = lsgetc(p, c)
   while (c ~= HISTCHAR && c ~= EOS) {
      if (c == ESCAPE) {
         c = lsgetc(p, c)
         start += 1
         }

      if (c ~= EOS) {
         c = lsgetc(p, c)
         start += 1
         }
      }

   if (c == EOS)
      return(ERR)

   len = 1
   c = lsgetc(p, c)
   if (c == HISTLOOK) {
      len += 1
      c = lsgetc(p, c)

      while (c ~= HISTLOOK && c ~= EOS) {
         if (c == ESCAPE) {
            c = lsgetc(p, c)
            len += 1
            }

         if (c ~= EOS) {
            c = lsgetc(p, c)
            len += 1
            }
         }
      }

   while (c ~= ' 'c && c ~= TAB && c ~= HISTCHAR && c ~= EOS) {
      if (c == HISTSUB) {
         len += 1
         subseen = 0
         c = lsgetc(p, c)

         while (subseen < 2 && c ~= EOS) {
            if (c == ESCAPE) {
               c = lsgetc(p, c)
               len += 1
               }
            if (c ~= EOS) {
               c = lsgetc(p, c)
               len += 1
               }

            if (c == HISTSUB)
               subseen += 1
            }
         }

      if (c == ESCAPE) {
         c = lsgetc(p, c)
         len += 1
         }

      if (c ~= EOS) {
         c = lsgetc(p, c)
         len += 1
         }
      }

   if (c == HISTCHAR)
      len += 1

   return(OK)
   end



#  histlook --- lookup the value of a history string

   integer function histlook(str, sub, com, pos)
   character str(ARB)
   pointer sub, com
   integer pos

   include HIST_COMMON

   character c
   integer ctoi
   pointer histget
   character lspos
   pointer p, sp, rp
   character buf(MAXLINE), rep(MAXLINE)
   integer i, val, si, flag, len, loc, last, null


#  first attempt to find which command on which we are to operate
#
#  the entire history format is as follows
#
#     ! [<str> | <num> | ? <str> ?] [` <num>] {^ <str> ^ <str> ^}

   si = 2
   select (str(si))
   when (EOS, HISTARG, HISTSUB) {   # !
      if (H_pf == H_pl) {
         call errmsg(com, pos, "no history exists, yet"p)
         return(ERR)
         }

      val = mod(H_pf - H_pl + MAXHIST, MAXHIST) + H_line - 1
      if (histget(val, sub) == ERR) {
         call errmsg(com, pos, "history internal error"p)
         return(ERR)
         }
      }
   when (SET_OF_DIGITS) {  # !<num>
      val = ctoi(str, si)
      if (histget(val, sub) == ERR) {
         call errmsg(com, pos, "history item not found"p)
         return(ERR)
         }
      }
   when (HISTLOOK) {    #?<str>?
      i = 1
      si += 1
      while (str(si) ~= EOS && str(si) ~= HISTLOOK) {
         if (str(si) == ESCAPE)
            si += 1

         if (str(si) ~= EOS)
            buf(i) = str(si)

         si += 1
         i += 1
         }

      buf(i) = EOS
      if (str(si) == HISTLOOK)
         si += 1

      flag = NO
      val = mod(H_pf - H_pl + MAXHIST, MAXHIST) + H_line - 1
      while (histget(val, sub) ~= ERR) {
         p = sub
         c = lsgetc(p, c)
         while (c ~= EOS) {

            i = 1
            while (c ~= EOS && buf(i) ~= EOS && c ~= buf(i))
               c = lsgetc(p, c)

            sp = p
            while (c ~= EOS && buf(i) ~= EOS && c == buf(i)) {
               c = lsgetc(sp, c)
               i += 1
               }

            if (buf(i) == EOS) {
               flag = YES
               break 2
               }

            p = sp
            c = lsgetc(p, c)
            }

         val -= 1
         call lsfree(sub, ALL)
         }

      if (flag == NO) {
         call errmsg(com, pos, "history item not found"p)
         return(ERR)
         }
      }
   else {      # !<str>
      i = 1
      while (str(si) ~= EOS && str(si) ~= HISTARG && str(si) ~= HISTSUB) {
         if (str(si) == ESCAPE)
            si += 1

         if (str(si) ~= EOS)
            buf(i) = str(si)

         si += 1
         i += 1
         }
      buf(i) = EOS

      flag = NO
      val = mod(H_pf - H_pl + MAXHIST, MAXHIST) + H_line - 1
      while (histget(val, sub) ~= ERR) {
         p = sub
         c = lsgetc(p, c)
         while (c == ' 'c || c == TAB)
            c = lsgetc(p, c)

         i = 1
         while (buf(i) ~= EOS && buf(i) == c) {
            c = lsgetc(p, c)
            i += 1
            }

         if (buf(i) == EOS) {
            flag = YES
            break
            }

         call lsfree(sub, ALL)
         val -= 1
         }

      if (flag == NO) {
         call errmsg(com, pos, "history item not found"p)
         return(ERR)
         }
      }

#  ! [<str> | <num> | ? <str> ?] has now been parsed and the command
#  line has been placed in "sub". now see if the next character is a
#  legal following character

   if (str(si) ~= EOS && str(si) ~= HISTARG && str(si) ~= HISTSUB) {
      call errmsg(com, pos + si - 1, "illegal history token"p)
      return(ERR)
      }

#  if there is no more to the history string, we are done

   if (str(si) == EOS)
      return(OK)

#  now check for possible argument substitution. this section parses
#  [` <num>] and turns "sub" into the appropriate argument

   if (str(si) == HISTARG) {           # `<num>-<num>
      si += 1

      if ((str(si) < '0'c || str(si) > '9'c) &&
            str(si) ~= '-'c && str(si) ~= '$'c) {
         call errmsg(com, pos + si - 1, "illegal argument history"p)
         call lsfree(sub, ALL)
         return(ERR)
         }

      p = sub                          # determine the last argument
      last = -1
      call histarg(p, len)
      while (len > 0) {
         last += 1
         c = lspos(p, len + 1)
         while (c == ' 'c || c == TAB)
            c = lspos(p, 2)            # delete trailing blanks

         call histarg(p, len)
         }

      if (str(si) == '-'c)             # default to arg 1
         val = 1
      elif (str(si) >= '0'c && str(si) <= '9'c)
         val = min0(ctoi(str, si), last + 1)
      else {
         val = last

         if (str(si) ~= EOS)
            si += 1
         }

      for (i = val; i > 0; i -= 1) {   # delete preceding arguments
         call histarg(sub, len)
         call lsdel(sub, 1, len)
         }

      p = sub
      loc = 0                          # remove leading blanks
      c = lsgetc(p, c)
      while (c == ' 'c || c == TAB) {
         c = lsgetc(p, c)
         loc += 1
         }
      call lsdel(sub, 1, loc)

      if (str(si) == '-'c) {
         si += 1
         if (str(si) >= '0'c && str(si) <= '9'c)
            val = min0(ctoi(str, si), last) - val + 1
         else {
            val = last - val + 1

            if (str(si) ~= EOS)
               si += 1
            }

         p = sub
         loc = 0
         call histarg(p, len)
         while (val > 0 && len > 0) {
            val -= 1
            loc += len
            call lspos(p, len + 1)
            call histarg(p, len)
            }
         call lsdel(sub, loc + 1, ALL)
         }
      else {
         call histarg(sub, len)
         call lsdel(sub, len + 1, ALL)
         }
      }

#  check that the remaining characters represent legal following chars

   if (str(si) ~= EOS && str(si) ~= HISTSUB) {
      call errmsg(com, pos + si - 1, "illegal history token"p)
      call lsfree(sub, ALL)
      return(ERR)
      }

#  check for no substitutions and return if we are done

   if (str(si) == EOS)
      return(OK)

#  keep performing substitutions until there are no more

   while (str(si) == HISTSUB) {
      i = 1
      si += 1
      flag = NO
      while (str(si) ~= EOS && str(si) ~= HISTSUB) {
         if (str(si) == ESCAPE)
            si += 1

         if (str(si) ~= EOS)
            buf(i) = str(si)

         i += 1
         if (str(si) ~= EOS)
            si += 1
         }
      buf(i) = EOS

      i = 1
      if (str(si) ~= EOS)
         si += 1

      while (str(si) ~= EOS && str(si) ~= HISTSUB) {
         if (str(si) == ESCAPE)
            si += 1

         if (str(si) ~= EOS)
            rep(i) = str(si)

         i += 1
         if (str(si) ~= EOS)
            si += 1
         }

      null = NO
      len = i - 1
      rep(i) = EOS
      call lsmake(rp, rep)
      if (len == 0)
         null = YES

      if (str(si) == HISTSUB)
         si += 1

      if (str(si) == 'g'c || str(si) == 'G'c) {
         flag = YES
         si += 1
         }

      loc = 1
      p = sub
      c = lsgetc(p, c)
      sp = p
      while (c ~= EOS) {
         i = 1
         while (c ~= EOS && c ~= buf(i)) {
            loc += 1
            c = lsgetc(p, c)
            sp = p
            }

         while (c ~= EOS && buf(i) ~= EOS && c == buf(i)) {
            c = lsgetc(p, c)
            i += 1
            }

         if (buf(i) == EOS) {
            call lsdel(sub, loc, i - 1)

            if (null == NO)                           # watch out for
               call lsins(sub, loc - 1, rp, 1, ALL)   # lsins bug

            if (flag == NO)         # only 1 substitution
               break

            loc += len
            }
         else {            # back up and try again
            p = sp
            c = lsgetc(p, c)
            loc += 1
            sp = p
            }
         }

      call lsfree(rp, ALL)    # free the replacement string storage
      }

   return(OK)
   end



#  histget --- get a specified string from the history buffers

   integer function histget(hp, sub)
   pointer sub
   integer hp

   include HIST_COMMON

   pointer p
   character buf(MAXLINE)
   integer i, j, max, hval

   max = mod(H_pf - H_pl + MAXHIST, MAXHIST) + H_line - 1
   if (hp < H_line || hp > max)     # out of range
      return(ERR)

   call lsmake(sub, ""s)
   hval = mod(hp - H_line + H_pl - 1, MAXHIST) + 1
   for (i = H_ptr(hval); H_buf(i) ~= EOS;) {

      j = 1
      while (H_buf(i) ~= EOS && j < MAXLINE) {
         buf(j) = H_buf(i)
         i = mod(i, HISTSIZE) + 1
         j += 1
         }

      buf(j) = EOS
      call lsmake(p, buf)
      call lsjoin(sub, p)
      }

   return(OK)
   end



#  histarg --- return the last position of the next argument

   subroutine histarg(ptr, len)
   pointer ptr
   integer len

   pointer p
   character c
   character lsgetc
   integer paren, bracket, brace, squote, dquote, skip

   p = ptr
   len = 0
   skip = NO
   paren = 0
   brace = 0
   squote = 0
   dquote = 0
   bracket = 0

   repeat {
      len += 1
      c = lsgetc(p, c)
      while (skip == NO && (c == ' 'c || c == TAB)) {
         c = lsgetc(p, c)
         len += 1
         }

      skip = YES
      select(c)
      when ('('c)
         if (squote == 0 && dquote == 0)
            paren += 1
      when (')'c)
         if (squote == 0 && dquote == 0)
            paren -= 1
      when ('{'c)
         if (squote == 0 && dquote == 0)
            brace += 1
      when ('}'c)
         if (squote == 0 && dquote == 0)
            brace -= 1
      when ('['c)
         if (squote == 0 && dquote == 0)
            bracket += 1
      when (']'c)
         if (squote == 0 && dquote == 0)
            bracket -= 1
      when ("'"c)
         if (dquote == 0)
            squote = 1 - squote
      when ('"'c)
         if (squote == 0)
            dquote = 1 - dquote
      } until (c == EOS ||
         ((c == ' 'c || c == TAB) && paren == 0 && brace == 0 &&
          bracket == 0 && squote == 0 && dquote == 0))

   len -= 1

   return
   end



#  histsave --- save history command lines

   integer function histsave (file)
   character file (ARB)

   include HIST_COMMON

   file_des fd
   integer status

   file_des open
   integer writef

   fd = open(file, WRITE)
   if (fd == ERR)
      return(ERR)

   status = OK
   if (writef(MAXHIST, 1, fd) ~= 1)
      status = ERR
   if (status == OK && writef(HISTSIZE, 1, fd) ~= 1)
      status = ERR
   if (status == OK && writef(H_bf, 1, fd) ~= 1)
      status = ERR
   if (status == OK && writef(H_bl, 1, fd) ~= 1)
      status = ERR
   if (status == OK && writef(H_pf, 1, fd) ~= 1)
      status = ERR
   if (status == OK && writef(H_pl, 1, fd) ~= 1)
      status = ERR
   if (status == OK && writef(H_ptr, MAXHIST, fd) ~= MAXHIST)
      status = ERR
   if (status == OK && writef(H_buf, HISTSIZE, fd) ~= HISTSIZE)
      status = ERR

   if (status == ERR)
      call rewind(fd)

   call trunc(fd)
   call close(fd)

   return(status)
   end



#  histrest --- restore a history save file

   integer function histrest (file)
   character file (ARB)

   include HIST_COMMON

   file_des fd
   integer status, junk

   file_des open
   integer readf

   fd = open(file, READ)
   if (fd == ERR)
      return(ERR)

   status = OK
   if (readf(junk, 1, fd) ~= 1 || junk ~= MAXHIST)
      status = ERR
   if (status == OK && (readf(junk, 1, fd) ~= 1 || junk ~= HISTSIZE))
      status = ERR
   if (status == OK && readf(H_bf, 1, fd) ~= 1)
      status = ERR
   if (status == OK && readf(H_bl, 1, fd) ~= 1)
      status = ERR
   if (status == OK && readf(H_pf, 1, fd) ~= 1)
      status = ERR
   if (status == OK && readf(H_pl, 1, fd) ~= 1)
      status = ERR
   if (status == OK && readf(H_ptr, MAXHIST, fd) ~= MAXHIST)
      status = ERR
   if (status == OK && readf(H_buf, HISTSIZE, fd) ~= HISTSIZE)
      status = ERR

   call close(fd)
   return(status)
   end
