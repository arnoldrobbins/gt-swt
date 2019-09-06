# sv_def.i --- shell variable definitions

   define (SV_MEMSIZE,4096)
   define (SV_MEMEND,1)    # index of pointer to end of memory
   define (SV_AVAIL,2)     # start of available space list
   define (SV_CLOSE,8)     # threshhold for close-fitting blocks
   define (SV_OHEAD,2)     # total words of overhead per block
   define (SV_LINK,1)      # offset of link field of storage block
   define (SV_SIZE,0)      # offset of size field of storage block
   define (SV_HLINK,0)     # offset of hash link field of sv descriptor
   define (SV_NAME,1)      # offset of name pointer field of sv descriptor
   define (SV_VALUE,2)     # offset of value pointer field of sv descriptor
   define (SV_MAXHASH,13)  # number of shell variable hash threads
   define (SVDEPTH,32)     # maximum number of shell variable scope levels
   define (SV_COMMON,"sv_com.r.i")
