# bnames_def.r.i --- definitions for 'bnames' program

   define (GROUP_TYPE(b),rs(b,8))
   define (GROUP_SIZE(b),rt(b,8))
   define (BLOCK_TYPE(b),rs(b(1),12))
   define (BLOCK_SIZE(b),rt(b(1),8))
   define (SFL_GROUP,16r1000)
   define (RFL_GROUP,16r1100)
   define (MAXBUF,256)
   define (PREFIX_BLOCK,9)
   define (DATA_BLOCK,10)
   define (END_BLOCK,11)
   define (PROCDEF,30)
   define (ENTABS,2)
   define (ENTREL,3)
   define (ENTLB,31)
   define (ENTLBA,32)
   define (DYNT,43)
