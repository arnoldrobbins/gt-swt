# sprint --- optimize printing on the Spinwriter

   include "sprint_def.r.i"
   include SPRINT_COMMON

   character name (MAXLINE)
   integer save_lword, state (4), i, junk
   integer duplx$, gfnarg
   file_des open
   external quit_unit
   shortcall mkonu$ (18)
   character vert (16), horiz (16)

   data vert/'P'c,'Q'c,'R'c,'S'c,'T'c,'U'c,'V'c,'W'c,'X'c,'Y'c,'Z'c,
      '['c,'\'c,']'c,'^'c,'_'c/
   data horiz/'@'c,'A'c,'B'c,'C'c,'D'c,'E'c,'F'c,'G'c,'H'c,'I'c,'J'c,
      'K'c,'L'c,'M'c,'N'c,'O'c/

   define (quit,1)

   PARSE_COMMAND_LINE ("c<ri>h<ri>jl<ri>n<ign>sv<ri>x"s,
      "Usage: sprint {-c <copies>|-h <horiz>|-j|-l <length>|-s|-v <vert>|-x} [<file>]"s)

   ARG_DEFAULT_INT (c, 1)
   ARG_DEFAULT_INT (l, 66)

   if (ARG_PRESENT (h))
      if (ARG_VALUE (h) < 0 || 15 < ARG_VALUE (h))
         call error ("illegal horizontal spacing"s)

   if (ARG_PRESENT (v))
      if (ARG_VALUE (v) < 1 || 16 < ARG_VALUE (v))
         call error ("illegal vertical spacing"s)

   call mklb$f ($ quit, Quit_label)
   call mkonu$ ("QUIT$"v, loc (quit_unit))

   save_lword = duplx$ (-1)   # save terminal configuration
   junk = duplx$ (or (save_lword, :140000)) # turn off echo and auto-lf
   call set_delay (0, 0, 1)

   Pos = 1                    # set initial column number
   Line = 1                   # set initial line number
   Outstanding_lf = 0         # set initial number of outstanding LFs
   Chunk = 0                  # no characters sent since last poll
   Direction = FORWARD        # start print left-to-right
   Outstanding_poll = FALSE   # haven't sent a poll sequence yet

   OUTCON (CR)                # make sure carriage is in column 1...

   if (~ARG_PRESENT (x)) {
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

                  if (ARG_PRESENT (h))
                     Spacing = horiz (ARG_VALUE (h) + 1)
                  else
                     Spacing = DEFARG
                  SET_HORIZONTAL_SPACING

                  if (ARG_PRESENT (v))
                     Formadvance = vert (ARG_VALUE (v))
                  else
                     Formadvance = DEFARG
                  SET_VERTICAL_SPACING

                  call sprint
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



# sprint --- optimize printing for one file

   subroutine sprint

   include SPRINT_COMMON

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

   include SPRINT_COMMON

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
      elif (buf (i) ~= hlf && buf (i) ~= rhlf && buf (i) ~= rlf)
         size += 1
      }

   return (l)
   end



# outch --- send character;  handle timing and vertical spacing

   subroutine outch (c)
   character c

   include SPRINT_COMMON

   integer sGAMMA (13), sLAMBDA (13), snabla (23), snot (11),
      snu (11), sphi (7), sPHI (43), spsi (19), sPSI (19),
      sPI (33), stheta (5), sTHETA (5), szeta (15),
      siota (13), sXI (63), supsilon (13),
      schi (7), spsset (19), ssset (21), sle (13), sge (13),
      simp (9), sexist (31), snexist (33), suniv (15), sor (15),
      sand (15), sne (5), siso (13), sapeq (13), sscolon (5),
      sdquote (11), sdollar (5)
   character vert (16)

   data _
      sGAMMA /a_GAMMA, R, R, R, R, "'"c, L, L, L, L, L, L, 0/,
      sLAMBDA /L, '/'c, R, R, R, SO, a_bslash, SI, L, L, L, L, 0/,
      snabla /L, SO, a_bslash, SI, R, R, R, '/'c, L, L, U, U, U, U, '-'c,
         L, L, L, D, D, D, D, 0/,
      snot /L, '-'c, R, D, D, "'"c, L, L, U, U, 0/,
      snu /L, '('c, R, R, R, '/'c, L, L, L, L, 0/,
      sphi /'o'c, L, D, '|'c, L, U, 0/,
      sPHI /'o'c, L, L, L, D, D, D, SO, a_brbrace, SI, R, R, R, R,
         SO, a_blbrace, SI, L, L, L, L, L, L, L, U, U, U, U, U, U, a_trbrace,
         R, R, R, R, a_tlbrace, L, L, L, D, D, D, 0/,
      spsi /'|'c, L, '-'c, D, R, R, "'"c, L, L, L, L, L, L, L, "'"c,
         R, R, U, 0/,
      sPSI /'I'c, L, '-'c, D, R, R, "'"c, L, L, L, L, L, L, L,
         "'"c, R, R, U, 0/,
      sPI /L, L, L, L, L, L, L, L, a_trbrace, R, R, R, R, a_tlbrace,
         R, R, R, R, a_trbrace, R, R, R, R, a_tlbrace, L, L, L, L,
         L, L, L, L, 0/,
      stheta /'O'c, L, '-'c, L, 0/,
      sTHETA /'O'c, L, '='c, L, 0/,
      szeta /U, U, U, U, U, '-'c, D, D, D, D, D, 16r24, L, L, 0/,
      siota /D, D, 16r27, D, D, "'"c, U, U, U, U, L, L, 0/,
      sXI /'_'c, D, '-'c, U, U, U, U, U, U, U, L, L, '_'c,
         D, D, D, D, D, D, L, L, L, L, L, "'"c, R, R, R, R, R, R,
         R, R, R, "'"c, L, D, D, D, D, D, "'"c, L, L, L, L, L, L,
         L, L, L, L, L, "'"c, U, U, U, U, U, R, R, R, 0/,
      supsilon /SO, a_backslash, SI, R, R, R, ')'c, L, L, L, L, L, 0/,
      schi /16r24, L, SO, 16r4A, SI, L, 0/,
      spsset /U, 'c'c, R, R, U, '-'c, L, D, D, D, '-'c, D,
         U, U, L, L, L, L, 0/,
      ssset /U, 'c'c, R, R, U, '-'c, L, D, D, D, '-'c, L, U, U, '_'c,
         D, L, L, L, L, 0/,
      sle /U, U, '<'c, L, D, D, D, D, '-'c, U, U, L, 0/,
      sge /U, U, '>'c, L, D, D, D, D, '-'c, U, U, L, 0/,
      simp /'='c, R, R, '>'c, L, L, L, L, 0/,
      sexist /'_'c, U, U, U, U, U, U, U, U, L, '_'c, D, D, D, D, D, D,
         D, D, R, '-'c, R, R, '|'c, L, L, L, L, L, L, 0/,
      snexist /'_'c, U, U, U, U, U, U, U, U, L, '_'c, D, D, D, D, D, D,
         D, D, R, '-'c, L, '/'c, R, R, '|'c, L, L, L, L, L, L, 0/,
      suniv /SO, a_backslash, SI, R, R, '-'c, R, '/'c, L, L, L, L, L, L, 0/,
      sor /SO, a_backslash, SI, R, R, R, R, '/'c, L, L, L, L, L, L, 0/,
      sand /'/'c, R, R, R, R, SO, a_backslash, SI, L, L, L, L, L, L, 0/,
      sne /'='c, L, '/'c, L, 0/,
      siso /'='c, L, U, U, U, SO, a_tilde, SI, L, D, D, D, 0/,
      sapeq /U, SO, a_tilde, SI, D, D, L, SO, a_tilde, SI, U,  L, 0/,
      sscolon /':'c, L, ','c, L, 0/,
      sdquote /L, L, "'"c, R, R, R, "'"c, L, L, L, 0/,
      sdollar /'S'c, L, '|'c, L, 0/
   data vert/'P'c,'Q'c,'R'c,'S'c,'T'c,'U'c,'V'c,'W'c,'X'c,'Y'c,'Z'c,
      '['c,'\'c,']'c,'^'c,'_'c/

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
      Outstanding_lf = 0
      }
   elif (c == NEWLINE) {
      Line += 1
      if (Line > PAGE_LENGTH) {
         Chunk += 1
         call t1ou (FF)
         TOP_OF_FORM
         Line = 1
         Outstanding_lf = 0
         }
      else
         Outstanding_lf += 1
      }
   else {
      if (Outstanding_lf ~= 0) {
         MOVE_TO_LINE (Outstanding_lf)
         Outstanding_lf = 0
         }
      select (c)
         when (alpha)         OUTSCON (a_alpha)
         when (ALPHA)         OUTCON (a_ALPHA)
         when (beta)          OUTCON (a_beta)
         when (BETA)          OUTCON (a_BETA)
         when (gamma)         OUTSCON (a_gamma)
         when (GAMMA)         call plotstr (sGAMMA)
         when (delta)         OUTSCON (a_delta)
         when (DELTA)         OUTSCON (a_DELTA)
         when (epsilon)       OUTSCON (a_epsilon)
         when (EPSILON)       OUTCON (a_EPSILON)
         when (zeta)          call plotstr (szeta)
         when (ZETA)          OUTCON (a_ZETA)
         when (eta)           OUTSCON (a_eta)
         when (ETA)           OUTCON (a_ETA)
         when (theta)         call plotstr (stheta)
         when (THETA)         call plotstr (sTHETA)
         when (iota)          call plotstr (siota)
         when (IOTA)          OUTCON (a_IOTA)
         when (kappa)         OUTCON ('k'c)
         when (KAPPA)         OUTCON ('K'c)
         when (lambda)        OUTSCON (a_lambda)
         when (LAMBDA)        call plotstr (sLAMBDA)
         when (mu)            OUTCON (a_mu)
         when (MU)            OUTCON (a_MU)
         when (nu)            call plotstr (snu)
         when (NU)            OUTCON (a_NU)
         when (xi)            OUTSCON (a_xi)
         when (XI)            call plotstr (sXI)
         when (omicron)       OUTCON (a_omicron)
         when (OMICRON)       OUTCON (a_OMICRON)
         when (pi)            OUTCON (a_pi)
         when (PI)            call plotstr (sPI)
         when (rho)           OUTSCON (a_rho)
         when (RHO)           OUTCON (a_RHO)
         when (sigma)         OUTSCON (a_sigma)
         when (SIGMA)         OUTDCHAR (PNCHAR(a_tSIGMA), PSCHAR(a_bSIGMA))
         when (tau)           OUTSCON (a_tau)
         when (TAU)           OUTCON (a_TAU)
         when (upsilon)       call plotstr (supsilon)
         when (UPSILON)       OUTCON ('Y'c)
         when (phi)           call plotstr (sphi)
         when (PHI)           call plotstr (sPHI)
         when (chi)           call plotstr (schi)
         when (CHI)           OUTCON (a_CHI)
         when (psi)           call plotstr (spsi)
         when (PSI)           call plotstr (sPSI)
         when (omega)         OUTSCON (a_omega)
         when (OMEGA)         OUTCON (a_OMEGA)
         when (infinity)      OUTSCON (a_infinity)
         when (integral)      OUTCON (a_integral)
         when (INTEGRAL)      OUTDCHAR (PSCHAR(a_tintegral), PNCHAR(a_bintegral))
         when (largerbrace)   OUTDCHAR (PNCHAR (a_trbrace), PSCHAR (a_brbrace))
         when (largelbrace)   OUTDCHAR (PNCHAR (a_tlbrace), PSCHAR (a_blbrace))
         when (tilde)         OUTSCON (a_tilde)
         when (backslash)     OUTSCON (a_backslash)
         when (uparrow)       OUTSCON (a_uparrow)
         when (downarrow)     OUTSCON (a_downarrow)
         when (nabla)         call plotstr (snabla)
         when (not)           call plotstr (snot)
         when (partial)       OUTSCON (a_partial)
         when (proportional)  OUTSCON (a_proportional)
         when (psset)         call plotstr (spsset)
         when (sset)          call plotstr (ssset)
         when (le)            call plotstr (sle)
         when (ge)            call plotstr (sge)
         when (imp)           call plotstr (simp)
         when (exist)         call plotstr (sexist)
         when (nexist)        call plotstr (snexist)
         when (univ)          call plotstr (suniv)
         when (OR)            call plotstr (sor)
         when (AND)           call plotstr (sand)
         when (ne)            call plotstr (sne)
         when (iso)           call plotstr (siso)
         when (apeq)          call plotstr (sapeq)
         when (lfloor)        OUTSCON (a_lfloor)
         when (rfloor)        OUTSCON (a_rfloor)
         when (lceil)         OUTCON (a_lceil)
         when (rceil)         OUTCON (a_rceil)
         when (small0)        OUTSCON (a_small0)
         when (small1)        OUTSCON (a_small1)
         when (small2)        OUTSCON (a_small2)
         when (small3)        OUTSCON (a_small3)
         when (small4)        OUTSCON (a_small4)
         when (small5)        OUTSCON (a_small5)
         when (small6)        OUTSCON (a_small6)
         when (small7)        OUTSCON (a_small7)
         when (small8)        OUTSCON (a_small8)
         when (small9)        OUTSCON (a_small9)
         when (scolon)        call plotstr (sscolon)
         when (dquote)        call plotstr (sdquote)
         when (dollar)        call plotstr (sdollar)
         when (rlf) {
            call t1ou (ESC)
            call t1ou ('9'c)
            }
         when (hlf) {
            call t1ou (ESC)
            call t1ou (']'c)
            call t1ou ('S'c)
            if (Direction == FORWARD) {
               call t1ou (LF)
               Chunk += 4
               }
            else {
               call t1ou (ESC)
               call t1ou ('9'c)
               Chunk += 5
               }
            RESTORE_NORMAL_SPACING
            }
         when (rhlf) {
            call t1ou (ESC)
            call t1ou (']'c)
            call t1ou ('S'c)
            if (Direction == FORWARD) {
               call t1ou (ESC)
               call t1ou ('9'c)
               Chunk += 5
               }
            else {
               call t1ou (LF)
               Chunk += 4
               }
            RESTORE_NORMAL_SPACING
            }
         else
            if (c >= 8r020 & c <= 8r037) { # change vertical spacing
               Formadvance = vert (c - 8r017)
               SET_VERTICAL_SPACING
               }
            else
               OUTCON (c)
      }

   return
   end



# plotstr --- output special character plot string

   subroutine plotstr (str)
   integer str (ARB)

   include SPRINT_COMMON

   integer i

   DISABLE_BREAKS    # so Spinwriter isn't left in plot mode
   ENTER_PLOT_MODE

   if (Direction == REVERSE) {
      call t1ou (ESC)
      call t1ou (FWD)
      Chunk += 2
      }

   for (i = 1; str (i) ~= 0; i += 1) {
      if (Chunk >= MAXCHUNK) {
         if (Outstanding_poll)
            WAIT_FOR_ACK
         else
            Outstanding_poll = TRUE
         call t1ou (ETX)   # send poll
         Chunk = 0
         }

      if (str (i) == U) {
         call t1ou (ESC)
         call t1ou ('9'c)
         Chunk += 2
         }
      else {
         call t1ou (str (i))
         Chunk += 1
         }
      }

   if (Direction == REVERSE) {
      call t1ou (ESC)
      call t1ou (BKWD)
      Chunk += 2
      }

   EXIT_PLOT_MODE
   ENABLE_BREAKS

   return
   end



# position_horizontally --- generate an absolute horiz. tab

   subroutine position_horizontally (pos)
   integer pos

   character second_key, third_key (32)

   data third_key/'@'c, 'A'c, 'B'c, 'C'c, 'D'c, 'E'c, 'F'c, 'G'c,
      'H'c, 'I'c, 'J'c, 'K'c, 'L'c, 'M'c, 'N'c, 'O'c, 'P'c, 'Q'c,
      'R'c, 'S'c, 'T'c, 'U'c, 'V'c, 'W'c, 'X'c, 'Y'c, 'Z'c, '['c,
      '\'c, ']'c, '^'c, '_'c/

   if (pos <= 32)
      second_key = 'P'c
   elif (pos <= 64)
      second_key = 'Q'c
   elif (pos <= 96)
      second_key = 'R'c
   elif (pos <= 128)
      second_key = 'S'c
   elif (pos <= 160)
      second_key = 'T'c
   else
      second_key = 'U'c
   call t1ou (ESC)
   call t1ou (second_key)
   call t1ou (third_key (mod (pos - 1, 32) + 1))

   return
   end



# position_vertically --- generate an relative vertical tab

   subroutine position_vertically (pos)
   integer pos

   integer p
   character second_key, third_key, tk (32)

   data tk/'@'c, 'A'c, 'B'c, 'C'c, 'D'c, 'E'c, 'F'c, 'G'c,
      'H'c, 'I'c, 'J'c, 'K'c, 'L'c, 'M'c, 'N'c, 'O'c, 'P'c, 'Q'c,
      'R'c, 'S'c, 'T'c, 'U'c, 'V'c, 'W'c, 'X'c, 'Y'c, 'Z'c, '['c,
      '\'c, ']'c, '^'c, '_'c/

   p = pos
   repeat {
      if (p <= 31) {
         second_key = 'Z'c
         third_key = tk (p + 1)
         p = 0
         }
      else {
         second_key = '['c
         if (p <= 63) {
            third_key = tk (mod (p, 32) + 1)
            p = 0
            }
         else {
            third_key = tk (32)
            p -= 63
            }
         }
      call t1ou (ESC)
      call t1ou (second_key)
      call t1ou (third_key)
      }
   until (p == 0)

   return
   end



# quit_unit --- on-unit for the QUIT$ condition

   subroutine quit_unit (cp)
   longint cp

   include SPRINT_COMMON

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
