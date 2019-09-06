# mkcl --- create a clist file using readf, writef, seekf
#          to improve efficiency of guess
#

define (MAXSIZE, 32)
define (MAXTEXT, 4096)
define (MAXWORDS, 600)

   file_mark marks (MAXSIZE)
   integer   sizes (MAXSIZE)

   common /toget/ marks, sizes

   character text (MAXTEXT)
   integer size2 (MAXWORDS)
   integer start (MAXWORDS)

   integer clist, len, savail, tavail
   integer i, tsize, j
   character name (MAXLINE), arg (MAXARG)

   integer equal, getname, create, seekf, writef
   file_mark markf

   call getarg (1, arg, MAXARG)
   if (equal (arg, "-s"s) == YES)
      clist = create ("=extra=/clist"s, READWRITE)
   else if (arg (1) == EOS)
      clist = create ("=ubin=/clist"s, READWRITE)
   else
      call error ("Usage: mkcl [-s]"p)
   if (clist == ERR)
      call error ("Can't create clist file"s)

   savail = 1
   tavail = 1

   len = getname (STDIN, name)
   while (len ~= EOF) {
      size2 (savail) = len
      start (savail) = tavail
      for (i = 1; i <= len + 1; i += 1) {
         text (tavail) = name (i)
         tavail += 1
         }
      savail += 1
      if (tavail > MAXTEXT || savail > MAXWORDS)
         call error ("Overflow!!!!!!!! ARggggg..."s)
      len = getname (STDIN, name)
      }

   for (i = 1; i <= MAXSIZE; i += 1) {
      marks (i) = 0
      sizes (i) = 0
      }

   if (writef (marks, MAXSIZE * 3, clist) == ERR)  # initialize header
      call error ("writef returned an error"s)

   for (i = 1; i <= MAXSIZE; i += 1) {
      tsize = 0
      marks (i) = markf (clist)
      for (j = 1; j <= savail - 1; j += 1)
         if (size2 (j) == i) {
            if (writef (text (start (j)), i + 1, clist) == ERR)
               call error ("writef died in loop"s)
            tsize += i + 1
            }
      sizes (i) = tsize
      }

   if (seekf (intl (0), clist) == ERR)
      call error ("seekf returned error"s)
   if (writef (marks, MAXSIZE * 3, clist) == ERR)  # update headers after
      call error ("writef died on last writef"s)   # filling file

   stop
   end

# getname --- get a name, fill in EOS, convert to lower, return
#             actual length, not including EOS

   integer function getname (fd, name)
   integer fd
   character name (ARB)

   integer l, getlin

   l = getlin (name, fd)
   if (l ~= EOF)
      name (l) = EOS
   else
      return (EOF)

   call mapstr (name, LOWER)
   return (l - 1)
   end
