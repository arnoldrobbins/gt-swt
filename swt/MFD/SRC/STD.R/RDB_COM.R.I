# rdb_com.r.i --- common declarations for the 'rdb' programs

   relation_des Rd (RDSIZE)
   character Arg (MAXARG)
   integer Ap, Pos2
   integer Rpn (RPNSIZE), Rpnlen
   integer Symtype, Symtext (MAXARG)
   integer Cbuf (RDATASIZE), Cbuflen
   longreal Errlab

   common /rslcom/ Rd, Arg, Ap, Rpn, Rpnlen, Symtype, Symtext,
                   Cbuf, Cbuflen, Errlab, Pos2
