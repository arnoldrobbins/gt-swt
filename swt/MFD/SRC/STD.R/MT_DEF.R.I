# mt_def.r.i --- definitions for the 'mt' program

   define (ON,)                        # conditional compilation
   define (OFF,#)
   define (DB,ON)

   define (ASCII,0)                    # character conversion types
   define (BINARY,1)
   define (EBCDIC,2)

   define (ABSOLUTE,0)                 # positioning types
   define (FORWARD,1)
   define (REVERSE,-1)

   define (CSW,2)                      # status vector fields
   define (NWR,3)

   define (DEFAULT_RECSIZE,80)         # default parameters
   define (DEFAULT_BLKSIZE,800)
   define (DEFAULT_CONV,ASCII)
   define (DEFAULT_UNIT,0)

   define (ASCII_FILL,8r40)            # fill characters
   define (BINARY_FILL,0)
   define (EBCDIC_FILL,8r100)

   define (MAX_BLKSIZE,5120)           # dimensions and limits
   define (MAX_RETRYS,10)
   define (MAX_UNIT,7)
   define (MIN_UNIT,0)

   define (NEXT_BUF(b),xor(b,3))

   define (AT_BOT(c),(and(c,8r10)~=0))       # status-checking macros
   define (AT_EOF(c),(and(c,8r400)~=0))
   define (AT_EOT(c),(and(c,8r40)~=0))
   define (CRCERR(c),(and(c,8r20000)~=0))
   define (DMARANGE(c),(and(c,8r4000)~=0))
   define (ERROR_BITS(c),(and(c,:177000)~=0))
   define (FILE_PROTECT(c),(and(c,4)~=0))
   define (IN_MID_FILE(c),(and(c,8r410)==0))
   define (LRCERR(c),(and(c,8r10000)~=0))
   define (ONLINE(c),(and(c,8r100)~=0))
   define (RAWERR(c),(and(c,8r1000)~=0))
   define (READY(c),(and(c,8r200)~=0))
   define (REWINDING(c),(and(c,8r20)~=0))
   define (RUNAWAY(c),(and(c,8r40000)~=0))
   define (UNCERR(c),(and(c,8r2000)~=0))
   define (VPERR(c),(and(c,:100000)~=0))

   define (NTBACKF,8r22100)            # instructions to t$mt
   define (NTSKIPF,8r22200)
   define (NTBACKR,8r62100)
   define (NTSKIPR,8r62200)
   define (NTWRITE1,8r42220)
   define (NTWRITE2,8r42620)
   define (NTREAD1,8r42200)
   define (NTREAD2,8r42600)
   define (NTCREAD1,8r52200)
   define (NTCREAD2,8r52600)
   define (NTFMARK,8r22220)
   define (NTCORRBIT,8r10000)
   define (READ_STATUS,:100000)
   define (REWIND,8r40)

   define (MT_COMMON,"mt_com.r.i")     # common include file name

   include ARGUMENT_DEFS
