# patsiz --- returns size of pattern entry at pat (n)

   integer function patsiz (pat, n)
   character pat (MAXPAT)
   integer n

   if (pat (n) == PAT_CHAR || pat (n) == PAT_START_TAG || pat (n) == PAT_STOP_TAG)
      patsiz = 2
   else if (pat (n) == PAT_BOL || pat (n) == PAT_EOL || pat (n) == PAT_ANY)
      patsiz = 1
   else if (pat (n) == PAT_CCL || pat (n) == PAT_NCCL)
      patsiz = pat (n + 1) + 2
   else if (pat (n) == PAT_CLOSURE)      # optional
      patsiz = PAT_CLOSIZE
   else
      call error ("in patsiz: can't happen"s)

   return
   end
