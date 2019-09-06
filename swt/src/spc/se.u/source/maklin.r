# maklin --- construct a new line, add to scratch file

   integer function maklin (lin, i, newind)
   character lin (ARB)
   integer i
   pointer newind

   include SE_COMMON

   character text (MAXLINE)
   integer l, n
   pointer ptr
   pointer alloc

   maklin = ERR   # preset error status

   if (alloc (ptr) == NOMORE)    # get space for pointer block
      return

   for (n = i; lin (n) ~= EOS; n += 1)    # find end of line
      if (lin (n) == NEWLINE) {
         n += 1
         break
         }

   if (n - i >= MAXLINE)   # can't handle more than MAXLINE chars per line
      n = i + MAXLINE - 1
   l = n - i + 1           # length of new line (including EOS)

   call move$ (lin (i), text, l) # move new line into text
   text (l) = EOS                # add EOS

   Seekaddr (ptr) = Scrend       # will be added to end of scratch file
   Lineleng (ptr) = l            # line length including EOS
   Globmark (ptr) = NO           # not marked for global command
   Markname (ptr) = DEFAULTNAME  # give it a default mark name

   call seekf (Scrend, Scr)      # go to end of Scratch file
   call writef (text, l, Scr)    # write line on scratch file
   Scrend += l                   # update end-of-file pointer

   Buffer_changed = YES

   newind = ptr                  # return index of new line
   return (n)                    # return next char of interest in lin

   end
