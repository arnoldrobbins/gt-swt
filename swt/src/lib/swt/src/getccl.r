# getccl --- expand char class at arg (i) into pat (j)

   integer function getccl (arg, i, pat, j)
   character arg (MAXARG), pat (MAXPAT)
   integer i, j

   integer addset
   integer jstart, junk

   i += 1      # skip over [
   if (arg (i) == PAT_NOT) {
      junk = addset (PAT_NCCL, pat, j, MAXPAT)
      i += 1
      }
   else
      junk = addset (PAT_CCL, pat, j, MAXPAT)
   jstart = j
   junk = addset (0, pat, j, MAXPAT)      # leave room for count
   call filset (PAT_CCLEND, arg, i, pat, j, MAXPAT)
   pat (jstart) = j - jstart - 1
   if (arg (i) == PAT_CCLEND)
      getccl = OK
   else
      getccl = ERR

   return
   end
