#  ptar_com.r.i --- common blocks for reading tar tapes

   integer Tbuf(512)
   character Name(100)
   character Mode(8)
   character Uid(8)
   character Gid(8)
   character Size(12)
   character Mtime(12)
   character Chksum(8)
   character Linkflag
   character Linkname(100)

   equivalence (Tbuf(1), Name(1))
   equivalence (Tbuf(101), Mode(1))
   equivalence (Tbuf(109), Uid(1))
   equivalence (Tbuf(117), Gid(1))
   equivalence (Tbuf(125), Size(1))
   equivalence (Tbuf(137), Mtime(1))
   equivalence (Tbuf(149), Chksum(1))
   equivalence (Tbuf(157), Linkflag)
   equivalence (Tbuf(158), Linkname(1))

   common /tarcom/ Tbuf


   long_int Block

   common /blkcom/ Block


   # global static line buffer for packing lines

   integer P, Pbuf(512)

   common /bufcom/ P, Pbuf


   # input file descriptor

   common /filcom/ infile

   integer infile
