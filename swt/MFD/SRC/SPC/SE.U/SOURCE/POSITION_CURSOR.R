# position_cursor --- position cursor to row, col

   subroutine position_cursor (row, col)
   integer row, col

   include SE_COMMON

   if (row <= Nrows && row >= 1                 # within vertical range?
         && col <= Ncols && col >= 1            # within horizontal range?
         && (row ~= Currow || col ~= Curcol))   # not already there?
      select (Term_type)
         when (ADDS980)
            call addspos (row, col)
         when (ADDS100, VIEWPT90)
            call regentpos (row, col)
         when (HP2621, HP2626, HP2648, HP9845)
            call hppos (row,col)
         when (BANTAM, FOX)
            call pepos (row, col)
         when (TVT)
            call tvtpos (row, col)
         when (GT40)
            call gt40pos (row, col)
         when (B150, B200, MICROB, PT45, SBEE, SOL)
            call beepos (row, col)
         when (HZ1420, HZ1421, HZ1510)
            call hazpos (row, col)
         when (CG)
            call cgpos (row, col)
         when (ISC8001)
            call iscpos (row, col)
         when (ADM3A, ADM31, TS1, TVI, VC4404, VIEWPT, ADM5, ADM42)
            call admpos (row, col)
         when (IBM)
            call ibmpos (row, col)
         when (ANP)
            call anppos (row, col)
         when (NETRON)
            call netpos (row, col)
         when (H19, Z19, VI200)
            call h19pos (row, col)
         when (TRS80)
            call trspos (row, col)
         when (BEE2)
            call bee2pos (row, col)
         when (TERAK)
            call terakpos (row, col)
         when (INFO)
            call infopos (row,col)
         when (NBY)
            call nbypos (row, col)
         when (PST100, VT100)
            call ansipos (row, col)
         when (FORSYS)
            call forsyspos (row, col)

   return
   end
