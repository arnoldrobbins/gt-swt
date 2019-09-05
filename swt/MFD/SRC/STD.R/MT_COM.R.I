# mt_com.r.i --- common declarations for the 'mt' program

   longint Baddr              # buffer pointers for t$mt
   integer Buffer_1,          # first i/o buffer
           Buffer_2,          # second i/o buffer
           Bufstat,           # hardware status vector
           Buflen,            # number of words in each buffer
           Bufok,             # buffer validity flag
           Conv,              # code conversion specification
           Blksize,           # physical block size
           Recsize,           # logical record size
           Block,             # current block number
           Corrected,         # number of corrected i/o errors
           Recovered,         # number of recovered i/o errors
           Unit,              # mt unit number
           Verbose            # verbose flag

   common /mt$com/ Baddr (2), Bufstat (8, 2), Buflen (2), Bufok (2),
      Conv, Blksize, Recsize, Block, Corrected, Recovered, Unit,
      Verbose

   common /mt$buf/ Buffer_1 (MAX_BLKSIZE), Buffer_2 (MAX_BLKSIZE)
