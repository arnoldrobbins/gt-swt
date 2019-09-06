# initswt --- initialize the Subsystem template areas

   include LIBRARY_DEFS
   include PRIMOS_KEYS
   include PRIMOS_ERRD

   subroutine main

   include "=incl=/temp_com.r.i"

   integer junk, code, unit, i, l, j
   integer buf (MAXLINE), info (8)
   integer length, ctop, gtemp, gctoi, equal
   character str (MAXLINE), nm (MAXLINE), repl (MAXLINE)
   string_table dynpos, dyntxt
      /  TEMP_DATE,     "date",
      /  TEMP_TIME,     "time",
      /  TEMP_USER,     "user",
      /  TEMP_PID,      "pid",
      /  TEMP_PASSWD,   "passwd",
      /  TEMP_DAY,      "day",
      /  TEMP_HOME,     "home"

   procedure add_entry forward

   define (out,1)

   do i = 1, MAXTEMPHASH
      Hashtb (i) = LAMBDA
   Temptop = 0

   for (i = 1; i <= dynpos (1); i += 1) {
      call scopy (dyntxt, dynpos (i + 1) + 1, nm, 1)
      repl (1) = -dyntxt (dynpos (i + 1))
      add_entry
      }

   call rdtk$$ (1, info, buf, MAXLINE, code)
   call errpr$ (KNRTN, code, 0, 0, "rdtk$$", 6)

   if (info (1) == 6) {
      i = 1
      info (2) = ctop ("extra>template"s, i, buf, MAXLINE)
      }

   info (1) = 0
   call tsrc$$ (KREAD + KGETU, buf, unit, info, junk, code)
   call errpr$ (KNRTN, code, buf, info (2), "tsrc$$", 6)

   Cldata_ptr (1) = :6002
   Cldata_ptr (2) = :6

   repeat {
      call rdlin$ (unit, buf, MAXLINE, code)
      if (code == EEOF)
         break
      call errpr$ (KNRTN, code, "Reading template file", 21,
                     "initswt", 7)
      call ptoc (buf, EOS, str, MAXLINE)
      if (gtemp (str, nm, repl) ~= EOF) {
         if (equal (nm, "cldata"s) == YES) {
            i = 1
            Cldata_ptr (1) = gctoi (repl, i, 8)
            Cldata_ptr (2) = gctoi (repl, i, 8)
            }
         add_entry      # add the entry to the table
         }
      }

out;
   call srch$$ (KCLOS, 0, 0, unit, junk, code)
   call errpr$ (KNRTN, code, "Closing template file", 21,
                     "initswt", 7)

   call exit


   # add_entry --- add an entry to the template table

      procedure add_entry {

      local h, i, p, q, need
      integer h, i, p, q, need
      integer scopy, length

      need = length (nm) + 3
      if (repl (1) > 0)    # not a dynamic template?
         need += length (repl) + 1
      if (Temptop + need > MAXTEMPBUF) {
         for (i = 1; nm (i) ~= EOS; i += 1)
            call t1ou (nm (i))
         call errpr$ (KIRTN, ENULL, ": too many system templates", 27,
               "initswt", 7)
         goto out
         }

      h = 0
      for (i = 1; i <= 4 && nm (i) ~= EOS; i += 1)
         h += nm (i)
      h = mod (h, MAXTEMPHASH) + 1

      p = Temptop + 1

      Tempbuf (p) = Hashtb (h)
      Hashtb (h) = p

      q = p + 2 + scopy (nm, 1, Tempbuf, p + 2) + 1

      if (repl (1) <= 0) {
         Tempbuf (p + 1) = repl (1)
         Temptop = q - 1
         }
      else {
         Tempbuf (p + 1) = q
         Temptop = q + scopy (repl, 1, Tempbuf, q)
         }

      }

   undefine (out)

   end
