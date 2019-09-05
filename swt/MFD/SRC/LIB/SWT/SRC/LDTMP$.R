# ldtmp$ --- load the per-user template area

   subroutine ldtmp$

   include SWT_COMMON

   filedes fd
   filedes open
   integer i
   integer getlin, gtemp
   character str (MAXLINE), nm (MAXARG), repl (MAXARG)

   procedure add_entry forward

   define (out,1)

   call break$ (DISABLE)

   do i = 1, MAXTEMPHASH
      Uhashtb (i) = LAMBDA
   Utemptop = 0

   fd = open ("=utemplate="s, READ)
   if (fd == ERR) {
      call break$ (ENABLE)
      return
      }

   while (getlin (str, fd) ~= EOF)
      if (gtemp (str, nm, repl) ~= EOF)
         add_entry      # Add the entry to the table

out;
   call close (fd)
   call break$ (ENABLE)

   return


   # add_entry --- add an entry to the template table

      procedure add_entry {

      local h, i, p, q, need
      integer h, i, p, q, need
      integer scopy, length

      need = length (nm) + length (repl) + 4
      if (Utemptop + need > MAXTEMPBUF) {
         call print (ERROUT, "*s: too many user templates*n"s, nm)
         call seterr (1000)
         goto out
         }

      h = 0
      for (i = 1; i <= 4 && nm (i) ~= EOS; i += 1)
         h += nm (i)
      h = mod (h, MAXTEMPHASH) + 1
      p = Utemptop + 1
      Utempbuf (p) = Uhashtb (h)
      Uhashtb (h) = p
      q = p + 2 + scopy (nm, 1, Utempbuf, p + 2) + 1
      Utempbuf (p + 1) = q
      Utemptop = q + scopy (repl, 1, Utempbuf, q)

      }

   undefine (out)

   end
