# dprint --- optimize printing on the Diablo

   include "dprint_def.r.i"
   include DPRINT_COMMON

   character name (MAXLINE)
   integer save_lword, state (4), i, junk
   integer duplx$, gfnarg
   file_des open
   external quit_unit
   shortcall mkonu$ (18)

   define (quit,1)

   PARSE_COMMAND_LINE ("c<ri>jl<ri>n<ign>sx"s,
         "Usage: dprint {-c <copies>|-j|-l <length>|-s|-x} [<file>]"s)

   ARG_DEFAULT_INT (c, 1)
   ARG_DEFAULT_INT (l, 66)

   call mklb$f ($ quit, Quit_label)
   call mkonu$ ("QUIT$"v, loc (quit_unit))

   save_lword = duplx$ (-1)   # save terminal configuration
   junk = duplx$ (or (save_lword, :140000)) # turn off echo and auto-lf
   call set_delay (0, 0, 1)

   Pos = 1                    # set initial column number
   Line = 1                   # set initial line number
   Chunk = 0                  # no characters sent since last poll
   Direction = FORWARD        # start print left-to-right
   Outstanding_poll = FALSE   # haven't sent a poll sequence yet

   OUTCON (CR)                # make sure carriage is in column 1...

   if (~ARG_PRESENT(x)) {
      OUTCON (FF)             # ... and at the top of a page
      TOP_OF_FORM             # allow user to position paper
      }

   state (1) = 1
   repeat
      select (gfnarg (name, state))
         when (EOF)
            break
         when (OK) {
            Fd = open (name, READ)
            if (Fd ~= ERR) {
               for (i = 1; i <= COPIES; i += 1) {
                  call dprint
                  call rewind (Fd)
                  }
               call close (Fd)
               }
            else
               call print (ERROUT, "*s: can't open*n"s, name)
            }
         when (ERR)
            call print (ERROUT, "*s: can't open*n"s, name)

   call outch (CR)   # flush out pending NEWLINEs and return carriage


quit;    # come to this label on QUIT

   call rvonu$ ("QUIT$"v)
   if (Outstanding_poll)
      WAIT_FOR_ACK

   if (Fd ~= STDIN)
      call close (Fd)

   call set_delay (MIN, MAX, SLOPE)    # reset to reasonable value
   junk = duplx$ (save_lword)   # restore echo

   stop
   end



# dprint --- optimize printing for one file

   subroutine dprint

   include DPRINT_COMMON

   character buf (BUFLENGTH)
   integer i, j, k, start, size, len
   integer inbuf

   while (inbuf (buf, len, start, size) ~= EOF) {
      if (size == 0)
         call outch (NEWLINE)  # linefeed
      elif (Pos - start > size - Pos) {   # print in reverse direction
         START_BACKWARD_PRINT
         if (Pos ~= size) {
            MOVE_TO_COLUMN (size)
            Pos = size
            }
         for (i = len; i >= start; i -= 1) {
            k = 0
            for (j = i; buf (j) == ' 'c; j -= 1)
               k += 1
            if (k > 3) {   # is it cheaper to do absolute positioning?
               MOVE_TO_COLUMN (Pos - k)
               Pos -= k
               i = j   # now put out non-blank
               }
            if (Pos > 0)    # don't print before column 1
               call outch (buf (i))  # put out character
            if (buf (i) == BS)
               Pos += 1
            elif (buf (i) ~= hlf && buf (i) ~= rhlf)
               Pos -= 1
            }
         call outch (NEWLINE)
         }

      else {      # print in forward direction
         START_FORWARD_PRINT
         if (Pos ~= start) {
            MOVE_TO_COLUMN (start)
            Pos = start
            }
         for (i = start; i <= len; i += 1) {
            k = 0
            for (j = i; buf (j) == ' 'c; j += 1)
               k += 1
            if (k > 3) {   # is it cheaper to do absolute positioning?
               MOVE_TO_COLUMN (Pos + k)
               Pos += k
               i = j   # now put out non-blank
               }
            if (Pos > 0)      # don't print before column 1
               call outch (buf (i))   # put out character
            if (buf (i) == BS)
               Pos -= 1
            elif (buf (i) ~= hlf && buf (i) ~= rhlf)
               Pos += 1
            }
         call outch (NEWLINE)
         }
      }

   if (EJECT_OPT && Line > 1)
      call outch (FF)

   return
   end



# inbuf --- input buffer, returning length and text size

   integer function inbuf (buf, len, start, size)
   character buf (BUFLENGTH)
   integer len, start, size

   include DPRINT_COMMON

   integer l, k, i
   integer getlin

   l = getlin (buf, Fd)
   if (l == EOF)
      return (l)

   while (buf (l) ~= NEWLINE && l < BUFLENGTH - MAXLINE) {
      k = getlin (buf (l + 1), Fd)
      if (k == EOF)
         break
      l += k
      }

   for (len = l - 1; len > 0; len -= 1)
      if (buf (len) ~= ' 'c)
         break

   for (start = 1; start <= len; start += 1)
      if (buf (start) ~= ' 'c)
         break

   size = 0
   for (i = 1; i <= len; i += 1) {
      if (buf (i) == BS)
         size -= 1
      elif (buf (i) ~= hlf && buf (i) ~= rhlf)
         size += 1
      }

   return (l)
   end



# outch --- send character;  handle timing and vertical spacing

   subroutine outch (c)
   character c

   include DPRINT_COMMON

   integer salpha (7), sbeta (11), sdelta (7), sDELTA (19),
      sepsilon (5), seta (13), sgamma (5), sGAMMA (18),
      sinfinity (11), sintegral (26), slambda (17),
      sLAMBDA (11), smu (13), snabla (19), snot (9),
      snu (9), somega (9), sOMEGA (12), spartial (13),
      sphi (3), sPHI (4), spsi (17), sPSI (18), spi (12),
      sPI (20), srho (11), ssigma (9), sSIGMA (14),
      stau (12), stheta (3), sTHETA (3), sxi (15), szeta (12)
   bool outstanding_lf

   data outstanding_lf / FALSE /
   data _
      salpha /L, 'c'c, R, R, '('c, L, 0/,
      sbeta /'B'c, L, L, D, D, '|'c, R, R, U, U, 0/,
      sdelta /'o'c, U, U, '<'c, D, D, 0/,
      sDELTA /L, L, '/'c, D, D, D, '-'c, R, R, R, R, '-'c,
         U, U, U, '\'c, L, L, 0/,
      sepsilon /'c'c, D, '-'c, U, 0/,
      seta /'n'c, R, R, D, D, D, '|'c, L, L, U, U, U, 0/,
      sgamma /')'c, R, '/'c, L, 0/,
      sGAMMA /L, L, '|'c, R, R, U, U, U, '-'c, D, D, D,
         R, R, '`'c, L, L, 0/,
      sinfinity /L, L, 'c'c, R, R, R, R, 'o'c, L, L, 0/,
      sintegral /'|'c, "'"c, R, R, '`'c, L, L, L,
         D, D, D, D, D, D, "'"c, L, '`'c, R, R, U, U, U, U, U, U, 0/,
      slambda /'\'c, D, D, D, L, "'"c, D, L, "'"c,
         U, U, U, U, U, R, R, 0/,
      sLAMBDA /L, L, '/'c, R, R, R, R, '\'c, L, L, 0/,
      smu /'u'c, L, L, D, D, D, '|'c, U, U, U, R, R, 0/,
      snabla /L, L, '\'c, U, U, U, '-'c, R, R, R, R,
         '-'c, D, D, D, '/'c, L, L, 0/,
      snot /'-'c, R, R, U, ','c, D, L, L, 0/,
      snu /L, '('c, R, R, R, '/'c, L, L, 0/,
      somega /L, 'u'c, R, R, R, 'u'c, L, L, 0/,
      sOMEGA /'O'c, D, D, L, '-'c, R, R, '-'c, L, U, U, 0/,
      spartial /'o'c, R, D, '`'c, L, U, '`'c, L, U, '`'c, R, D, 0/,
      sphi /'o'c, '|'c, 0/,
      sPHI /'o'c, '['c, ']'c, 0/,
      spsi /'/'c, '-'c, D, D, R, R, "'"c, L, L, L, L, "'"c,
         R, R, U, U, 0/,
      sPSI /'['c, ']'c, '-'c, D, R, R, "'"c, L, L, L, L, D,
         '`'c, R, R, U, U, 0/,
      spi /U, '-'c, D, D, D, '"'c, D, '"'c, U, U, U, 0/,
      sPI /L, L, '['c, ']'c, R, R, R, R, '['c, ']'c, L, L,
         U, U, U, '-'c, D, D, D, 0/,
      srho /'o'c, L, L, D, D, '|'c, U, U, R, R, 0/,
      ssigma /'o'c, D, R, R, '~'c, U, L, L, 0/,
      sSIGMA /'>'c, D, D, '-'c, U, U, U, U, U, '-'c, D, D, D, 0/,
      stau /'t'c, D, R, R, '~'c, L, L, L, '~'c, R, U, 0/,
      stheta /'O'c, '-'c, 0/,
      sTHETA /'O'c, '='c, 0/,
      sxi /'c'c, R, D, ','c, L, U, U, U, 'c'c, L, D, '`'c, R, D, 0/,
      szeta /'c'c, R, D, ','c, L, U, U, U, '<'c, D, D, 0/

   if (Chunk >= MAXCHUNK) {
      DISABLE_BREAKS
      if (Outstanding_poll)   # have we polled yet?
         WAIT_FOR_ACK
      else
         Outstanding_poll = TRUE
      call t1ou (ETX)         # send poll character
      Chunk = 0
      ENABLE_BREAKS
      }

   if (c == FF) {
      Chunk += 1
      call t1ou (FF)
      TOP_OF_FORM
      Line = 1
      outstanding_lf = FALSE
      }
   elif (c == NEWLINE) {
      Line += 1
      if (Line > PAGE_LENGTH) {
         Chunk += 1
         call t1ou (FF)
         TOP_OF_FORM
         Line = 1
         outstanding_lf = FALSE
         }
      else
         outstanding_lf = TRUE
      }
   else {
      if (outstanding_lf) {
         outstanding_lf = FALSE
         MOVE_TO_LINE (Line)
         }
      select (c)
         when (alpha)     call plotstr (salpha)
         when (beta)      call plotstr (sbeta)
         when (delta)     call plotstr (sdelta)
         when (DELTA)     call plotstr (sDELTA)
         when (epsilon)   call plotstr (sepsilon)
         when (eta)       call plotstr (seta)
         when (gamma)     call plotstr (sgamma)
         when (GAMMA)     call plotstr (sGAMMA)
         when (infinity)  call plotstr (sinfinity)
         when (integral)  call plotstr (sintegral)
         when (lambda)    call plotstr (slambda)
         when (LAMBDA)    call plotstr (sLAMBDA)
         when (mu)        call plotstr (smu)
         when (nabla)     call plotstr (snabla)
         when (not)       call plotstr (snot)
         when (nu)        call plotstr (snu)
         when (omega)     call plotstr (somega)
         when (OMEGA)     call plotstr (sOMEGA)
         when (partial)   call plotstr (spartial)
         when (phi)       call plotstr (sphi)
         when (PHI)       call plotstr (sPHI)
         when (psi)       call plotstr (spsi)
         when (PSI)       call plotstr (sPSI)
         when (pi)        call plotstr (spi)
         when (PI)        call plotstr (sPI)
         when (rho)       call plotstr (srho)
         when (sigma)     call plotstr (ssigma)
         when (SIGMA)     call plotstr (sSIGMA)
         when (tau)       call plotstr (stau)
         when (theta)     call plotstr (stheta)
         when (THETA)     call plotstr (sTHETA)
         when (xi)        call plotstr (sxi)
         when (zeta)      call plotstr (szeta)
         when (hlf) {
            call t1ou (ESC)
            if (Direction == FORWARD)
               call t1ou ('U'c)
            else
               call t1ou ('D'c)
            Chunk += 2
            }
         when (rhlf) {
            call t1ou (ESC)
            if (Direction == FORWARD)
               call t1ou ('D'c)
            else
               call t1ou ('U'c)
            Chunk += 2
            }
      else
         OUTCON (c)
      }

   return
   end



# plotstr --- output special character plot string

   subroutine plotstr (str)
   integer str (ARB)

   include DPRINT_COMMON

   integer i

   DISABLE_BREAKS    # so Diablo isn't left in plot mode
   ENTER_PLOT_MODE

   for (i = 1; str (i) ~= 0; i += 1) {
      if (Chunk >= MAXCHUNK) {
         if (Outstanding_poll)
            WAIT_FOR_ACK
         else
            Outstanding_poll = TRUE
         call t1ou (ETX)   # send poll
         Chunk = 0
         }

      select (str (i))
         when (L)
            if (Direction == REVERSE)
               call t1ou (8r040)
            else
               call t1ou (8r010)
         when (R)
            if (Direction == REVERSE)
               call t1ou (8r010)
            else
               call t1ou (8r040)
         when (U) {
            call t1ou (8r033)
            call t1ou (8r012)
            Chunk += 1
            }
         when (D)
            call t1ou (8r012)
      else
         call t1ou (str (i))
      Chunk += 1
      }

   EXIT_PLOT_MODE
   ENABLE_BREAKS

   return
   end



# quit_unit --- on-unit for the QUIT$ condition

   subroutine quit_unit (cp)
   longint cp

   include DPRINT_COMMON

   call t1ou (NEWLINE)
   call pl1$nl (Quit_label)

   return
   end



# set_delay --- set terminal delay characteristics

   subroutine set_delay (minimum, maximum, slope)
   integer minimum, maximum, slope

   character cmd (MAXLINE)

   call encode (cmd, MAXLINE, "*,-8udelay *i *i *i"s,
         minimum, maximum, slope)
   call sys$$ (cmd, ERR)

   return
   end
