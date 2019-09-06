# garbage_collect --- compress scratch file

   subroutine garbage_collect

   include SE_COMMON

   character new_name (MAXLINE)
   integer new_fd, i
   longint new_scrend
   pointer p

   call makscr (new_fd, new_name)

   call mesg ("collecting garbage"s, REMARK_MSG)
   new_scrend = 0
   for ({p = Limbo; i = 1}; i <= Limcnt; {p = Nextline (p); i += 1}) {
      call gtxt (p)
      call writef (Txt, Lineleng (p), new_fd)
      Seekaddr (p) = new_scrend
      new_scrend += Lineleng (p)
      }

   for ({p = Line0; i = 0}; i <= Lastln; {p = Nextline (p); i += 1}) {
      call gtxt (p)
      call writef (Txt, Lineleng (p), new_fd)
      Seekaddr (p) = new_scrend
      new_scrend += Lineleng (p)
      }

   call closef (Scr)
   call remove (Scrname)

   Scr = new_fd
   call scopy (new_name, 1, Scrname, 1)
   Scrend = new_scrend
   Lost_lines = 0

   call mesg (EOS, REMARK_MSG)

   return
   end
