# file names of global interest:
   character _
      Clfil (MAXLINE),
      Mulfil (MAXLINE),
      Pnifil (MAXLINE),
      Pntfil (MAXLINE),
      Entfil (MAXLINE),
      Npnfil (MAXLINE)
   common /Filcom/ Clfil, Mulfil, Pnifil, Pntfil, Entfil, Npnfil

# various data for the current user:
   character _
      User (MAXLINE),
      Connam (MAXLINE),
      Curul (MAXLINE),
      Curinx (MAXLINE),
      Curtxt (MAXLINE),
      Cuser (MAXLINE, CUSER_ENTRY_SIZE),
      Conent (MAXLINE, USERLIST_ENTRY_SIZE),
      Permit (MAXLINE)
   common /Cucom/ User, Connam, Curul, Curinx, Curtxt, Cuser, Conent,
      Permit

# miscellaneous:
   logical _
      Joined
   character _
      Inbuf (MAXLINE)
   integer _
      Ibp,
      Broke,
      Cmdcnt
   common /Miscom/ Joined, Inbuf, Ibp, Broke, Cmdcnt
