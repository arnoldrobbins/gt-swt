include PRIMOS_KEYS
include "defines"


# p$abi --- integer absolute value
   subroutine p$abi
   include creg

   store (sp) = iabs (store (sp))

   return
   end


# p$abr --- real absolute value
   subroutine p$abr
   include creg

   storer (sp) = abs (storer (sp))

   return
   end


# p$adi --- integer addition
   subroutine p$adi
   include creg

   sp = sp - 1
   store (sp) = store (sp) + store (sp + 1)

   return
   end


# p$adr --- real addition
   subroutine p$adr
   include creg

   sp = sp - 1
   storer (sp) = storer (sp) + storer (sp + 1)

   return
   end


# p$and --- boolean and
   subroutine p$and
   include creg

   sp = sp - 1
   if (store (sp + 1) == 0)
      store (sp) = 0

   return
   end


# p$atn --- arc tangent
   subroutine p$atn
   include creg

   storer (sp) = atan (storer (sp))

   return
   end


# p$brd --- binary read - reads num * 2 words from file
   subroutine p$brd(num)
   integer num, i, j, fd, nrd, code, filebuf, nr, mapfd, mapsu
   include creg

   fd = store (store (sp - 1))       # get device number for file
   nr = num * 2                      # convert to number of 16 bit words
   if (fd == STDOUT | fd == STDOUT2)
     call p$bomb ('read on output file.')
   filebuf = store (sp - 1) + 1      # get starting address of file buffer
   i = store (sp)                    # get address of variable
   for (j = 0; j < num; j = j + 1)   # load variable with contents of buffer
      store (i + j) = store (filebuf + j)
   call prwf$$ (KREAD, mapfd (mapsu (fd)), loc(store (filebuf)),
      nr, intl(0), nrd, code)
   if (code == BEOF)
     store (filebuf) = EOF           # set first loc in file buffer to EOF
   elif (nrd ~= nr)
     call p$bomb ('tried to read past end of file.')
   sp = sp - 1

   return
   end


# p$bwr --- binary write - writes num words to file
   subroutine p$bwr(num)
   integer num, i, j, fd, nwr, code, filebuf, nw, mapsu, mapfd
   include creg

   fd = store (store (sp - 1))        # get device number for file
   nw = num * 2                       # convert to number of 16 bit words
   if (fd == STDIN | fd == STDIN2)
     call p$bomb ('write on input file.')
   filebuf = store (sp - 1) + 1       # get starting address of file buffer
   i = store (sp)                     # get address of variable
   call prwf$$ (KWRIT, mapfd (mapsu (fd)), loc(store (i)),
      nw, intl(0), nwr, code)
   for (j = 0; j < num; j = j + 1)    # load buffer with contents of variable
      store (filebuf + j) = store (i + j)
   if (nw ~= nwr | code ~= 0)
     call p$bomb ('error in writing to binary file.')
   sp = sp - 1

   return
   end


# p$cfp --- converts a fortran array into a pascal (unpacked) array
   subroutine p$cfp (size)
   integer size, i, j, limit, adr
   include creg

   adr = store (sp)
   limit = adr + size - 1
   i = int (size / 2)
   if (size ~= i * 2) { # start at even numbered word
      store (limit) = rt (store (i + 1), 16)
      limit = limit - 1
      }
   for (i = limit; i >= adr; i = i - 2) {
      j = int ((i - adr) / 2) + adr
      store (i) = rt (store (j), 16)
      store (i - 1) = rs (store (j), 16)
      }

   return
   end


# p$cpf --- converts a pascal (unpacked) array into a fortran array
   subroutine p$cpf (size)
   integer size, i, j, limit, adr
   include creg

   j = 0
   adr = store (sp)
   limit = adr + size - 1
   for (i = adr; i <= int(limit/2) + 1; i = i + 1) {
      j = j + 2
      if (i + j <= limit) {
         store (i) = ls (store (adr + j + 1), 16) + rt (store (adr + j), 16)
         }
      else
         store (i) = rt (store (i + j), 16)
      }

   return
   end


# p$chk --- bounds check
   subroutine p$chk (lb, ub)
   longint lb, ub
   include creg

   if (store (sp) < lb || store (sp) > ub) {
      call print (ERROUT, "lb = *l, ub = *l, val = *l*n.",
         lb, ub, store (sp))
      call p$bomb ("value out of range.")
      }

   return
   end


# p$chka --- pointer check
   subroutine p$chka (p, q)
   longint p, q
   include creg

   if (store (sp) < intl (np) || store (sp) > q) {
      call print (ERROUT, "heap = *i, ptr = *l*n.", np, store (sp))
      call p$bomb ("pointer out of range.")
      }

   return
   end


# p$chr --- convert integer to character
   subroutine p$chr
   include creg

   store (sp) = store (sp) + 128

   return
   end


# p$cls --- close a file
   subroutine p$cls
   integer fd, close
   include creg

   fd = store (store (sp))
   if (fd ~= 0)
     call close (fd)
   sp = sp - 1

   return
   end


# p$cos --- cosine
   subroutine p$cos
   include creg

   storer (sp) = cos (storer (sp))

   return
   end


# p$dat --- calls date subroutine to get data and time
   subroutine p$dat(code)
   integer code, string(10), adr, i
   include creg

   call date (code, string)
   adr = store (sp)
   for (i = 0; i < 8; i = i + 1)
      store (adr + i) = string (i + 1)
   sp = sp - 1

   return
   end


# p$dec --- decrement
   subroutine p$dec (p, q)
   integer p
   longint q
   include creg

   store (sp) = store (sp) - q

   return
   end


# p$dif --- set difference
   subroutine p$dif
   integer i
   include creg

   for (i = sp - 8; sp > i; sp = sp - 1)
      store (sp - 8) = and (store (sp - 8), not (store (sp)))

   return
   end


# p$dvi --- integer division
   subroutine p$dvi
   include creg

   sp = sp - 1
   store (sp) = store (sp) / store (sp + 1)

   return
   end


# p$dvr --- real division
   subroutine p$dvr
   include creg

   sp = sp - 1
   storer (sp) = storer (sp) / storer (sp + 1)

   return
   end


# p$eln --- end-of-line test
   subroutine p$eln
   integer i, fd
   include creg

   fd = store (store (sp))
   i = store (sp) + 1
   store (sp) = rt ((store (i) == NEWLINE | store (i) == EOF), 32)

   return
   end


# p$ent --- block entry
   subroutine p$ent (p, q)
   integer p, q
   include creg

   if (p == 1) {
      sp = mp + q    # q = length of data segment
      if (sp > np)
         call p$bomb ("stack overflow.")
      }
   else {
      ep = sp + q
      if (ep > np)      # ep = maximum space required on stack
         call p$bomb ("store overflow.")
      }

   return
   end


# p$eof --- end-of-file test
   subroutine p$eof
   integer i
   include creg

   i = store (sp) + 1
   store (sp) = rt ((store (i) == EOF), 32)

   return
   end


# p$equ --- compare for equality
   subroutine p$equ (p, q)
   integer p, q
   integer i
   logical bval
   logical p$comp
   include creg

   sp = sp - 1
   if (p == 4) {
      sp = sp - 14   # point to first word of first set
      bval = .true.
      for (i = sp + 7; i >= sp & bval; i = i - 1)
         bval = store (i) == store (i + 8)
      }
   elif (p == 5)
      bval = p$comp (q, EQU)
   else
      bval = store (sp) == store (sp + 1)

   store (sp) = intl (rt (bval, 16))

   return
   end


# p$exp --- exponential
   subroutine p$exp
   include creg

   storer (sp) = exp (storer (sp))

   return
   end


# p$flo --- integer to real conversion (next-to-top of stack)
   subroutine p$flo
   include creg

   storer (sp - 1) = store (sp - 1)

   return
   end


# p$flt --- integer to real conversion (top of stack)
   subroutine p$flt
   include creg

   storer (sp) = store (sp)

   return
   end


# p$fms --- prints final compilation message if any errors
   subroutine p$fms (message)
   integer message (MAXLINE)
   integer q
   include creg

   q = store (store (sp))
   if (q ~= 0)   # there were compilation errors
      call print (ERROUT, "*4i*p*n.", q, message)
   sp = sp - 1

   return
   end


# p$geq --- compare for greater-than or equal-to relation
   subroutine p$geq (p, q)
   integer p, q
   integer i
   logical bval
   logical p$comp
   include creg

   sp = sp - 1
   if (p == 0)
      call p$bomb ("illegal address comparison.")
   elif (p == 2)
      bval = storer (sp) >= storer (sp + 1)
   elif (p == 4) {
      sp = sp - 14   # point to first word of first set
      bval = .true.
      for (i = sp + 7; i >= sp & bval; i = i - 1)
         bval = and (store (i), store (i + 8)) == store (i + 8)
      }
   elif (p == 5)
      bval = p$comp (q, GEQ)
   else
      bval = store (sp) >= store (sp + 1)

   store (sp) = intl (rt (bval, 16))

   return
   end


# p$get --- get item from file
   subroutine p$get
   integer i, fd
   integer getch
   character c
   include creg

   i = store (sp) + 1
   fd = store (store (sp))
   if (fd == STDOUT)
     call p$bomb ("get on output file.")
   elif (fd == STDOUT2)
     call p$bomb ("get on prr file.")
   else
     store (i) = getch (c, fd)
   sp = sp - 1

   return
   end


# p$grt --- compare for greater-than
   subroutine p$grt (p, q)
   integer p, q
   logical bval
   logical p$comp
   include creg

   sp = sp - 1
   if (p == 0)
      call p$bomb ("illegal address comparison.")
   elif (p == 1 | p == 3 | p == 6)
      bval = store (sp) > store (sp + 1)
   elif (p == 2)
      bval = storer (sp) > storer (sp + 1)
   elif (p == 4) {
      call p$bomb ("illegal set inclusion.")
      }
   else  # (p == 5)
      bval = p$comp (q, GRT)

   store (sp) = intl (rt (bval, 16))

   return
   end


# p$inc --- increment
   subroutine p$inc (p, q)
   integer p
   longint q
   include creg

   store (sp) = store (sp) + q

   return
   end


# p$ind --- indirect load
   subroutine p$ind (p, q)
   integer p, q
   integer i
   include creg

   if (p == 4) {
      sp = sp - 1
      i = store (sp) + q
      store (sp) = store (sp + 1)   # copy descriptor
      call p$ldos (i)
      }
   else {
      i = store (sp) + q
      store (sp) = store (i)
      }

   return
   end


# p$inf --- initialize a file buffer
   subroutine p$inf
   include creg

   store (store (sp)) = 0
   sp = sp - 1

   return
   end


# p$inn --- set membership test
   subroutine p$inn
   integer b, w
   logical bval
   include creg
   include cmasks

   sp = sp - 8
   w = store (sp) / 32
   b = mod (store (sp), 32)
   bval = and (store (sp + w + 1), masks (b + 1)) ~= 0
   store (sp) = intl (rt (bval, 16))

   return
   end


# p$int --- set intersection
   subroutine p$int
   integer i
   include creg

   for (i = sp - 8; sp > i; sp = sp - 1)
      store (sp - 8) = and (store (sp - 8), store (sp))

   return
   end


# p$ior --- boolean inclusive or
   subroutine p$ior
   include creg

   sp = sp - 1
   if (store (sp + 1) == 1)
      store (sp) = 1

   return
   end


# p$ixa --- generate pointer to array element
   subroutine p$ixa (q)
   integer q
   include creg

   sp = sp - 1
   store (sp) = store (sp) + q * store (sp + 1)

   return
   end


# p$lao --- load global address
   subroutine p$lao (q)
   integer q
   include creg

   sp = sp + 1
   store (sp) = q

   return
   end


# p$lca --- load address of constant
   subroutine p$lca (q)
   integer q
   include creg

   sp = sp + 1
   store (sp) = q

   return
   end


# p$lda --- load address
   subroutine p$lda (p, q)
   integer p, q
   integer p$base
   include creg

   sp = sp + 1
   store (sp) = p$base (p) + q

   return
   end


# p$ldc --- load constant
   subroutine p$ldc (p, q)
   integer p
   longint q
   include creg

   if (p == 0) {
      sp = sp + 1
      store (sp) = MAXSTORE   # load nil
      }
   elif (p == 4)
      call p$ldos (ints (q))
   else {
      sp = sp + 1
      store (sp) = q
      }

   return
   end


# p$ldo --- load global variable
   subroutine p$ldo (p, q)
   integer p, q
   include creg

   if (p == 4)
      call p$ldos (q)
   else {
      sp = sp + 1
      store (sp) = store (q)
      }

   return
   end


# p$ldos --- load set
   subroutine p$ldos (q)
   integer q
   integer i, j, lo, hi
   include creg

   lo = rs (store (sp), 8)
   hi = rt (store (sp), 8)
   sp = sp - 1
   j = q
   for (i = 0; i < lo; i = i + 1) {
      sp = sp + 1; store (sp) = 0
      }
   for ( ; i <= hi; i = i + 1) {
      sp = sp + 1; store (sp) = store (j)
      j = j + 1
      }
   for ( ; i < 8; i = i + 1) {
      sp = sp + 1; store (sp) = 0
      }

   return
   end


# p$leq --- compare for less-than or equal-to relation
   subroutine p$leq (p, q)
   integer p, q
   integer i
   logical bval
   logical p$comp
   include creg

   sp = sp - 1
   if (p == 0)
      call p$bomb ("illegal address comparison.")
   elif (p == 1 || p == 3 || p == 6)
      bval = store (sp) <= store (sp + 1)
   elif (p == 2)
      bval = storer (sp) <= storer (sp + 1)
   elif (p == 4) {
      sp = sp - 14   # point to first word of first set
      bval = .true.
      for (i = sp + 7; i >= sp & bval; i = i - 1)
         bval = and (store (i), store (i + 8)) == store (i)
      }
   else  # (p == 5)
      bval = p$comp (q, LEQ)

   store (sp) = intl (rt (bval, 16))

   return
   end


# p$les --- compare for less-than
   subroutine p$les (p, q)
   integer p, q
   logical bval
   logical p$comp
   include creg

   sp = sp - 1
   if (p == 0)
      call p$bomb ("illegal address comparison.")
   elif (p == 1 || p == 3 || p == 6)
      bval = store (sp) < store (sp + 1)
   elif (p == 2)
      bval = storer (sp) < storer (sp + 1)
   elif (p == 4)
      call p$bomb ("illegal set inclusion.")
   else  # (p == 5)
      bval = p$comp (q, LES)

   store (sp) = intl (rt (bval, 16))

   return
   end


# p$lod --- load variable
   subroutine p$lod (p, q)
   integer p, q
   integer p$base
   include creg

   sp = sp + 1
   store (sp) = store (p$base (p) + q)

   return
   end


# p$loda --- load pointer variable
   subroutine p$loda (p, q)
   integer p, q
   integer p$base
   include creg

   sp = sp + 1
   store (sp) = store (p$base (p) + q)

   return
   end


# p$lods --- load set variable
   subroutine p$lods (p, q)
   integer p, q
   integer p$base
   include creg

   call p$ldos (p$base (p) + q)

   return
   end


# p$log --- natural logarithm
   subroutine p$log
   include creg

   storer (sp) = alog (storer (sp))

   return
   end


# p$mod --- modulus
   subroutine p$mod
   include creg

   sp = sp - 1
   store (sp) = mod (store (sp), store (sp + 1))

   return
   end


# p$mov --- move
   subroutine p$mov (q)
   integer q
   integer i, i1, i2
   include creg

   i1 = store (sp - 1)
   i2 = store (sp)
   sp = sp - 2    # pop pointers
   for (i = 1; i <= q; i = i + 1) {
      store (i1) = store (i2)
      i1 = i1 + 1;  i2 = i2 + 1
      }

   return
   end


# p$mpi --- integer multiplication
   subroutine p$mpi
   include creg

   sp = sp - 1
   store (sp) = store (sp) * store (sp + 1)

   return
   end


# p$mpr --- real multiplication
   subroutine p$mpr
   include creg

   sp = sp - 1
   storer (sp) = storer (sp) * storer (sp + 1)

   return
   end


# p$mst --- mark stack
   subroutine p$mst (p)
   integer p
   integer p$base
   include creg

   # p is the static level diference between caller and callee.
   # Store static link, dynamic link and current stack limit; bump sp;
   # reserve space for function value; size must be
   # max (intsize, realsize, boolsize, charsize, ptrsize).

   store (sp + 2) = p$base (p)   # static link
   store (sp + 3) = mp           # dynamic link
   store (sp + 4) = ep           # stack limit
   sp = sp + 5

   return
   end


# p$mts --- generate subrange set
   subroutine p$mts
   integer lwb, upb, lw, lb, uw, ub, i
   include creg

   lwb = store (sp - 1)
   if (lwb < 0 || lwb > 255)
      call p$bomb ("mts lower bound out of range.")
   upb = store (sp)
   if (upb < 0 || upb > 255)
      call p$bomb ("mts upper bound out of range.")
   sp = sp - 2
   lw = lwb / 32
   lb = mod (lwb, 32)
   uw = upb / 32
   ub = mod (upb, 32)
   for (i = 0; i < lw; i = i + 1) {
      sp = sp + 1
      store (sp) = 0
      }
   if (lw < uw) {
      sp = sp + 1
      store (sp) = lt (:37777777777, 32 - lb)
      for (i = lw + 1; i < uw; i = i + 1) {
         sp = sp + 1
         store (sp) = :37777777777
         }
      sp = sp + 1
      store (sp) = rt (:37777777777, ub + 1)
      }
   else {
      sp = sp + 1
      store (sp) = lt (rt (:37777777777, ub + 1), 32 - lb)
      }
   for (i = uw + 1; i < 8; i = i + 1) {
      sp = sp + 1
      store (sp) = 0
      }

   return
   end


# p$neq --- compare for inequality
   subroutine p$neq (p, q)
   integer p, q
   integer i
   logical bval
   logical p$comp
   include creg

   sp = sp - 1
   if (p == 4) {
      sp = sp - 14   # point to first word of first set
      bval = .false.
      for (i = sp + 7; i >= sp & ~bval; i = i - 1)
         bval = store (i) ~= store (i + 8)
      }
   elif (p == 5)
      bval = p$comp (q, NEQ)
   else
      bval = store (sp) ~= store (sp + 1)

   store (sp) = intl (rt (bval, 16))

   return
   end


# p$new --- allocate storage from heap
   subroutine p$new
   integer i
   include creg

   np = np - store (sp)
   if (np <= ep)
      call p$bomb ("heap overflow.")
   else {
      i = store (sp - 1)
      store (i) = np
      sp = sp - 2
      }

   return
   end


# p$ngi --- integer negation
   subroutine p$ngi
   include creg

   store (sp) = -store (sp)

   return
   end


# p$ngr --- real negation
   subroutine p$ngr
   include creg

   storer (sp) = -storer (sp)

   return
   end


# p$not --- boolean not
   subroutine p$not
   include creg

   if (store (sp) == 0)
      store (sp) = 1
   else
      store (sp) = 0

   return
   end


# p$odd --- test for odd
   subroutine p$odd

   include creg

   store (sp) = rt (store (sp), 1)

   return
   end


# p$ord --- character to integer conversion
   subroutine p$ord (p)
   integer p
   include creg

   if (p == 6)
      store (sp) = store (sp) - 128

   return
   end


# p$pag --- output a form feed in a test file
   subroutine p$pag
   integer fd, i, putch
   include creg

   i = store (sp) + 1
   fd = store (store (sp))
   if (store (i) ~= NEWLINE)
      call putch (NEWLINE, fd)
   call putch (FF, fd)
   call putch (NEWLINE, fd)
   sp = sp - 1

   return
   end


# p$put --- put item into file
   subroutine p$put
   integer i, fd, putch
   include creg

   i = store (sp) + 1
   fd = store (store (sp))
   call putch (ints (store (i)), fd)
   sp = sp - 1

   return
   end


# p$rdc --- read character
   subroutine p$rdc
   integer i, j, fd
   integer getch
   character c
   include creg

   j = store (sp)
   i = store (sp - 1) + 1
   fd = store (store (sp - 1))
   if (fd == STDIN2) { #STDIN2 is assumed to be terminal input
     store (i) = getch (c, fd)
     if (store (i) == NEWLINE)
       store (j) = ' 'c
     else
       store (j) = store (i)
     }
   else {
     if (store (i) == NEWLINE)
       store (j) = ' 'c
     else
       store (j) = store (i)
     store (i) = getch (c, fd)
     }
   sp = sp - 1

   return
   end


# p$rdi --- read integer
   subroutine p$rdi
   character getch, buffer(12)
   character c
   integer i, j, k, fd
   longint gctol
   include creg

   fd = store (store (sp - 1))
   i = store (sp - 1) + 1
   j = store (sp)
   if (fd == STDIN2)
     store (i) = getch (c, fd)
   else
     c = store (i)
   while (store (i) == ' 'c | store (i) == NEWLINE)
     store (i) = getch (c, fd)
   buffer (1) = c
   for (k = 2; k < 12; k = k + 1)
     if (getch (buffer (k), fd) == EOF
           || buffer (k) < '0'c || buffer (k) > '9'c)
       break
   store (i) = buffer (k)
   buffer (k) = EOS
   k = 1
   store (j) = gctol (buffer, k, 10)
   if (buffer (k) ~= EOS)
     call p$bomb ("illegal character in input.")
   sp = sp - 1

   return
   end


# p$rdr --- read real
   subroutine p$rdr
   character getch, buffer (21)
   character c
   integer i, j, k, fd
   real ctor
   include creg

   j = store (sp)
   i = store (sp - 1) + 1
   fd = store (store (sp - 1))
   c = store (i)
   while (c == ' 'c | c == NEWLINE)
      call getch (c, fd)
   buffer (1) = c
   for (k = 2; k < 21; k = k + 1)
      if (getch (buffer (k), fd) == EOF ||
            buffer (k) < '0'c || buffer (k) > '9'c)
         break
   if (buffer (k) == '.'c & k < 21) {
      for (k = k + 1; k < 21; k = k + 1)
         if (getch (buffer (k), fd) == EOF ||
               buffer (k) < '0'c || buffer (k) > '9'c)
            break
      }
   if (buffer (k) == 'e'c || buffer (k) == 'E'c) {
      k = k + 1
      buffer (k) = getch (c, fd)
      for (k = k + 1; k < 21; k = k + 1)
         if (getch (buffer (k), fd) == EOF ||
               buffer (k) < '0'c || buffer (k) > '9'c)
            break
      }
   store (i) = buffer (k)
   buffer (k) = EOS
   k = 1
   storer (j) = ctor (buffer, k)
   sp = sp - 1

   return
   end


# p$rem --- remove file - removes temporary file
   subroutine p$rem (q, path)
   integer path (ARB)
   character pathname (MAXLINE)
   integer p, q, remove
   include creg

   p = store (sp)
   if (store (p) ~= 0) {
     if (q ~= 0)
       call p$mkpn (q, path, pathname)
     else
       call ptoc (path, ';'c, pathname, MAXLINE)
     call remove (pathname)
     store (p) = 0
     }
   sp = sp - 1

   return
   end


# p$res ---  reset file  - open file for read only
   subroutine p$res (flev, num, pathname)
   integer pathname (ARB)
   character c, path (MAXLINE)
   integer p, fd, flev, num, nrd, code, lev, nr
   integer open, getch, close, mapfd, mapsu
   include creg

   p = store (sp)
   fd = store (p)
   if (fd ~= 0)
     call close (fd)
   if (flev ~= 0) {
     lev = flev
     call p$mkpn (lev, pathname, path)
     }
   else
     call ptoc (pathname, ';'c, path, MAXLINE)
   fd = open (path, READ)
   store (p) = fd
   if (fd == ERR)
     call p$bomb ('file could not be opened for reading.')
   elif (num == 0)           # fill file buffer from ascii file
     store (p + 1) = getch (c, fd)
   else {                  # fill file buffer from binary file
     nr = num * 2
     call prwf$$(KREAD, mapfd (mapsu (fd)), loc (store (p + 1)),
        nr, intl(0), nrd, code)
     if (nr ~= nrd || code ~= 0)
       call p$bomb ('error in reading binary file.')
     }
   sp = sp - 1

   return
   end


# p$rln --- skip remainder of input record
   subroutine p$rln
   integer i, fd
   integer getch
   character c
   include creg

   i = store (sp) + 1
   fd = store (store (sp))
   if (store (i) == NEWLINE && fd ~= STDIN2)
     store (i) = getch (c, fd)
   else {
     while (store (i) ~= NEWLINE & store (i) ~= EOF)
        store (i) = getch (c, fd)
     if (store (i) ~= EOF & fd ~= STDIN2)
        store (i) = getch (c, fd)
     }
   sp = sp - 1

   return
   end


# p$rst --- restore heap pointer
   subroutine p$rst
   include creg

   np = store (sp)
   sp = sp - 1

   return
   end


# p$rwr --- rewrite files - open file for write only
   subroutine p$rwr (flev, pathname)
   integer pathname (ARB)
   character path (MAXLINE)
   integer p, fd, flev, lev
   integer create, close
   include creg

   p = store (sp)
   fd = store (p)
   if (fd ~= 0)
     call close (fd)
   if (flev ~= 0) {
     lev = flev
     call p$mkpn (lev, pathname, path)
     }
   else
     call ptoc (pathname, ';'c, path, MAXLINE)
   fd = create (path, WRITE)
   store (p) = fd
   if (fd == ERR)
     call p$bomb ('could not open file for writing.')
   sp = sp - 1

   return
   end


# p$sav --- save heap pointer
   subroutine p$sav
   integer i
   include creg

   i = store (sp)
   store (i) = np
   sp = sp - 1

   return
   end


# p$sbi --- integer subtraction
   subroutine p$sbi
   include creg

   sp = sp - 1
   store (sp) = store (sp) - store (sp + 1)

   return
   end


# p$sbr --- real subtraction
   subroutine p$sbr
   include creg

   sp = sp - 1
   storer (sp) = storer (sp) - storer (sp + 1)

   return
   end


# p$sgs --- generate singleton set
   subroutine p$sgs
   integer i, w, b
   include creg
   include cmasks

   if (store (sp) < 0 | store (sp) > 255)
      call p$bomb ("set element out of range.")
   w = store (sp) / 32
   b = mod (store (sp), 32)
   sp = sp - 1
   for (i = 0; i < w; i = i + 1) {
      sp = sp + 1
      store (sp) = 0
      }
   sp = sp + 1
   store (sp) = masks (b + 1)
   for (i = i + 1; i < 8; i = i + 1) {
      sp = sp + 1
      store (sp) = 0
      }

   return
   end


# p$sin --- sine
   subroutine p$sin
   include creg

   storer (sp) = sin (storer (sp))

   return
   end


# p$sqi --- integer square
   subroutine p$sqi
   include creg

   store (sp) = store (sp) * store (sp)

   return
   end


# p$sqr --- real square
   subroutine p$sqr
   include creg

   storer (sp) = storer (sp) * storer (sp)

   return
   end


# p$sqt --- square root
   subroutine p$sqt
   include creg

   storer (sp) = sqrt (storer (sp))

   return
   end


# p$sro --- store into global variable
   subroutine p$sro (p, q)
   integer p, q
   include creg

   if (p == 4)
      call p$sros (q)
   else {
      store (q) = store (sp)
      sp = sp - 1
      }

   return
   end


# p$sros --- store into global set variable
   subroutine p$sros (q)
   integer q
   integer i, j, lo, hi
   include creg

   i = q
   j = sp - 8  # point to first word of set
   lo = j + rs (store (sp), 8)
   hi = j + rt (store (sp), 8)

   for ( ; j < lo; j = j + 1)
      if (store (j) ~= 0)
         call p$bomb ("set too large.")
   for (j = hi + 1; j < sp; j = j + 1)
      if (store (j) ~= 0)
         call p$bomb ("set too large.")
   for (j = lo; j <= hi; j = j + 1) {
      store (i) = store (j)
      i = i + 1
      }

   sp = sp - 9    # pop set and descriptor

   return
   end


# p$sto --- store into variable
   subroutine p$sto (p)
   integer p, i
   include creg

   if (p == 4) {
      i = store (sp - 9)
      call p$sros (i)
      sp = sp - 1    # pop pointer
      }
   else {
      i = store (sp - 1)
      store (i) = store (sp)
      sp = sp - 2
      }

   return
   end


# p$stp --- stop
   subroutine p$stp

   stop

   end


# p$str --- store into variable
   subroutine p$str (p, q)
   integer p, q
   integer i
   integer p$base
   include creg

   i = p$base (p) + q
   store (i) = store (sp)
   sp = sp - 1

   return
   end


# p$stra --- store into pointer variable
   subroutine p$stra (p, q)
   integer p, q
   integer i
   integer p$base
   include creg

   i = p$base (p) + q
   store (i) = store (sp)
   sp = sp - 1

   return
   end


# p$strs --- store into set variable
   subroutine p$strs (p, q)
   integer p, q
   integer p$base
   include creg

   call p$sros (p$base (p) + q)

   return
   end


# p$trc --- real to integer conversion
   subroutine p$trc
   include creg

   store (sp) = storer (sp)

   return
   end


# p$ujc --- case statement error
   subroutine p$ujc
   include creg

   call p$bomb ("case statement error.")

   return
   end


# p$uni --- set union
   subroutine p$uni
   integer i
   include creg

   for (i = sp - 8; sp > i; sp = sp - 1)
      store (sp - 8) = or (store (sp - 8), store (sp))

   return
   end


# p$wln --- write newline
   subroutine p$wln
   integer i, fd, putch
   include creg

   i = store (sp) + 1
   fd = store (store (sp))
   call putch (NEWLINE, fd)
   store (i) = NEWLINE
   sp = sp - 1

   return
   end


# p$wrc --- write character
   subroutine p$wrc
   integer bufp, width, fd
   include creg

   bufp = store (sp - 2)
   fd = store (bufp)
   for (width = store (sp); width > 1; width = width - 1)
      call putch (' 'c, fd)
   store (bufp + 1) = store (sp - 1)
   call putch (ints (store (bufp + 1)), fd)
   sp = sp - 2

   return
   end


# p$wri --- write integer
   subroutine p$wri
   integer bufp, fd
   include creg

   bufp = store (sp - 2)
   store (bufp + 1) = store (sp - 1)
   fd = store (bufp)
   call print (fd, "*#l.", ints (store (sp)), store (bufp + 1))
   sp = sp - 2

   return
   end


# p$wrr --- write real
   subroutine p$wrr
   include creg
   integer i, j, k, fd

   fd = store (store (sp - 3))
   i = store (sp - 3) + 1
   j = store (sp - 1)
   k = store (sp)
   call print (fd, "*#,#r.", j, k, storer (sp - 2))
   storer (i) = store (sp - 2)
   sp = sp - 3

   return
   end


# p$wrs --- write string
   subroutine p$wrs
   integer fd, i, j, k, l, p
   integer gchar, putch
   include creg

   fd = store (store (sp - 3))
   i = store (sp - 3) + 1
   l = store (sp - 2)
   k = store (sp - 1)
   j = store (sp)
   if (k > j)
      for (p = 1; p <= k - j; p = p + 1)
         call putch (' 'c, fd)
   else
     j = k
   for (p = 0; p < j; )
     call putch (gchar (loc (store (l)), p), fd)
   p = p - 1
   store (i) = gchar (loc (store (l)), p)
   sp = sp - 3

   return
   end


# p$base --- follows the static link chain back ld levels and returns
#            the address of the stack frame origin for that level.
   integer function p$base (ld)
   integer ld
   integer lld, ad
   include creg

   ad = mp
   for (lld = ld; lld > 0; lld = lld - 1)
      ad = rt (store (ad + 1), 16)
   p$base = ad

   return
   end


# p$comp --- compare objects of length q pointed to by store (sp-1)
#            and store (sp), return YES if <rel> holds between them
   logical function p$comp (length, rel)
   integer length, rel
   integer i, l, i1, i2, r
   longint s1, s2
   include creg

   i1 = store (sp)
   i2 = store (sp + 1)
   l = length / 4    # length in words
   r = mod (length, 4)

   for (i = 1; i <= l & store (i1) == store (i2); i = i + 1) {
      i1 = i1 + 1
      i2 = i2 + 1
      }

   if (i > l)
      if (r == 0)
         i = EQU
      else {
         s1 = lt (store (i1), r * 8)
         s2 = lt (store (i2), r * 8)
         if (s1 == s2)
            i = EQU
         elif (s1 < s2)
            i = LES
         else
            i = GRT
         }
   elif (store (i1) > store (i2))
      i = GRT
   else
      i = LES

   select (rel)
      when (1)
         p$comp = i == EQU             # EQU
      when (2)
         p$comp = i ~= EQU             # NEQ
      when (3)
         p$comp = i == EQU | i == GRT  # GEQ
      when (4)
         p$comp = i == GRT             # GRT
      when (5)
         p$comp = i == EQU | i == LES  # LEQ
      when (6)
         p$comp = i == LES             # LES

   return
   end


# p$dbug --- print out contents of current pseudo-stack frame
   subroutine p$dbug (msg)
   integer i, j, b, base (3), msg (ARB), putch
   character c
   include creg
   data base /-8, 10, -16/

   call print (ERROUT, "*n*p*n*nmp=*i, sp=*i, ep=*i, np=*i*n*n.",
               msg, mp, sp, ep, np)

   do b = 1, 3; {
      call print (ERROUT, "Local stack contents in base *i? .",
         iabs (base (b)))
      call t1in (c)
      call tonl
      if (c == 'y'c | c == 'Y'c) {
         j = 0
         call tonl
         for (i = mp; i <= sp; i = i + 1) {
            call print (ERROUT, "*12,#l.", base (b), store (i))
            j = j + 1
            if (j >= 6) {
               j = 0
               call putch (NEWLINE, ERROUT)
               }
            }
         if (j > 0)
            call putch (NEWLINE, ERROUT)
         }
      }

   return
   end


# p$init --- initialize P-code interpreter
   subroutine p$init(j)
   integer getch, i, j
   include creg

   mp = 0
   sp = -1
   ep = 5
   np = MAXSTK1
   store (5) = STDIN
   store (7) = STDOUT
   store (9) = STDIN2
   store (11) = STDOUT2
   if (j == YES)  # input file is to be used
     store (6) = getch (i, STDIN)
   # note: buffer for keyboard file is not initialized

   return
   end


# p$mkpn --- take array or record id and make pathname
   subroutine p$mkpn (lev, pathname, pn)
   integer i, lev, ind, pathname (ARB)
   character pn (MAXLINE)
   integer ptoc, itoc
   include creg

   ind = store (sp)
   i = ptoc (pathname, ';'c, pn, MAXLINE)
   i = 3 + itoc (lev, pn (3), 3)
   i = i + itoc (ind, pn (i), 5)
   pn (i) = EOS

   return
   end
