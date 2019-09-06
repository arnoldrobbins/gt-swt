# Common blocks for phase 2 of C program checker

   character Buf (MAXBUF)
   integer Bp
   character Name (MAXLINE)
   character Line (MAXLINE)
   character File (MAXLINE)
   character Fname (MAXLINE)
   character Fline (MAXLINE)
   character Ffile (MAXLINE)
   integer Fnargs
   integer Fref
   integer Mtype (MAXMODES, MAXARGS)
   longint Mlen (MAXMODES, MAXARGS)

   common /cck2c/ Buf, Bp, Name, Line, File, Fname, Fline, Ffile,
      Fnargs, Fref, Mtype, Mlen
