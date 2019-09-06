# amatch --- (non-recursive) look for match starting at lin (from)

   integer function amatch (lin, from, pat, tagbeg, tagend)
   character lin (ARB), pat (MAXPAT)
   integer from, tagend (9), tagbeg (9)

   integer omatch, patsiz
   integer i, j, offset, stack

   stack = 0
   offset = from      # next unexamined input character
   for (j = 1; pat (j) ~= EOS; j += patsiz (pat, j))
      if (pat (j) == PAT_CLOSURE) {      # a closure entry
         stack = j
         j += PAT_CLOSIZE      # step over PAT_CLOSURE
         for (i = offset; lin (i) ~= EOS; )   # match as many as
            if (omatch (lin, i, pat, j) == NO)   # possible
               break
         pat (stack + PAT_COUNT) = i - offset
         pat (stack + PAT_START) = offset
         offset = i      # character that made us fail
         }
      else if (pat (j) == PAT_START_TAG) {
         i = pat (j + 1)
         tagbeg (i) = offset
         }
      else if (pat (j) == PAT_STOP_TAG) {
         i = pat (j + 1)
         tagend (i) = offset
         }
      else if (omatch (lin, offset, pat, j) == NO) {  # non-closure
         for ( ; stack > 0; stack = pat (stack + PAT_PREVCL))
            if (pat (stack + PAT_COUNT) > 0)
               break
         if (stack <= 0) {      # stack is empty
            amatch = 0      # return failure
            return
            }
         pat (stack + PAT_COUNT) -= 1
         j = stack + PAT_CLOSIZE
         offset = pat (stack + PAT_START) + pat (stack + PAT_COUNT)
         }
      # else omatch succeeded
   amatch = offset

   return      # success
   end
