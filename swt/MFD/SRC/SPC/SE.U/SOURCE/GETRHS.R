# getrhs --- get substitution string for "s" command

   integer function getrhs (lin, i, sub, gflag)
   character lin (MAXLINE), sub (MAXPAT)
   integer gflag, i

   include SE_COMMON

   integer maksub
   character saved_sub
   integer j

   if (Unix_mode == YES)
      saved_sub = '%'c
   else
      saved_sub = '&'c

   Errcode = EBADSUB
   getrhs = ERR

   if (lin (i) == EOS)  # missing the middle delimiter
      return

   if (lin (i + 1) == saved_sub && (lin (i + 2) == lin (i)
                                    || lin (i + 2) == NEWLINE)) {
###
### s//&/ --- should mean do the same thing as I did last time
### s//%/ --- even if I deleted something. So we comment out these lines.
###
###     if (Subs (1) == EOS) {
###        Errcode = ENOSUB
###        return
###        }
###
      call ctoc (Subs, sub, MAXPAT)
      i += 2
      if (lin (i) == NEWLINE) {
         # fix it up for pattern macthing routines
         lin (i) = lin (i - 2)
         lin (i + 1) = NEWLINE
         lin (i + 2) = EOS
         Peekc = SKIP_RIGHT
         }
      }

   else {
      if (lin (i + 1) == NEWLINE) {
         # missing the trailing delimiter
         # pattern was empty
         lin (i + 1) = lin (i)   # supply trailing delmiter
         lin (i + 2) = NEWLINE
         lin (i + 3) = EOS
         Peekc = SKIP_RIGHT
         # return (ERR)    # original action
         }
      else {      # stuff in pattern, check end of line
         for (j = i; lin (j) ~= EOS; j += 1)
            ;
         j -= 2   # j now points to char before NEWLINE

         if (lin (j) == 'p'c || lin (j) == 'P'c) {
            j -= 1
            if (lin (j) == GLOBAL || lin (j) == UCGLOBAL) {
               if (j >= i + 1 && lin (j-1) == lin (i) &&
                     (lin (j-2) ~= ESCAPE || lin (j-3) == ESCAPE))
                  ;  # leave alone
               else {
                  # @<delim>gp@n is the pattern
                  # supply trailing delim
                  j += 2   # j now at NEWLINE
                  lin (j) = lin (i)
                  lin (j+1) = NEWLINE
                  lin (j+2) = EOS
                  Peekc = SKIP_RIGHT
                  }
               }
            else if (j >= i + 1 && lin (j) == lin (i) &&
                  (lin (j-1) ~= ESCAPE || lin(j-2) == ESCAPE))
               ;  # leave alone
            else {
               # @<delim>p@n is the pattern
               # supply trailing delim
               j += 2
               lin (j) = lin (i)
               lin (j+1) = NEWLINE
               lin (j+2) = EOS
               Peekc = SKIP_RIGHT
               }
            }
         else if (lin (j) == GLOBAL || lin (j) == UCGLOBAL) {
            j -= 1
            if (j >= i + 1 && lin (j) == lin (i) &&
                  (lin (j - 1) ~= ESCAPE || lin (j - 2) == ESCAPE))
               ; # leave alone
            else {
               # @<delim>g@n is the pattern
               # supply trailing deliim
               j += 2   # j now at NEWLINE
               lin (j) = lin (i)
               lin (j+1) = NEWLINE
               lin (j+2) = EOS
               Peekc = SKIP_RIGHT
               }
            }
         else if ((lin (j) ~= lin (i)) ||
               (lin (j) == lin (i) && lin (j-1) == ESCAPE
               && lin (j-2) ~= ESCAPE)) {
            # escaped delimiter, missing final one
            # or simply missing final delimiter
            # supply it
            j += 1
            lin (j) = lin (i)
            lin (j+1) = NEWLINE
            lin (j+2) = EOS
            Peekc = SKIP_RIGHT
            }
         # else
            # delim is there, leave well enough alone
         }

      i = maksub (lin, i + 1, lin (i), sub)
      if (i == ERR)
         return

      call ctoc (sub, Subs, MAXPAT) # save pattern for later
      }

   if (lin (i + 1) == GLOBAL || lin (i + 1) == UCGLOBAL) {
      i += 1
      gflag = YES
      }
   else
      gflag = NO

   Errcode = EEGARB     # the default

   return (OK)

   end
