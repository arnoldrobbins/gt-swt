# ar_def.r.i --- defintions for the 'ar' program

   define (MAXHEADER,192)  # must be >= NAMESIZE+43
   define (NAMESIZE,128)   # must be the same as MAXARG
   define (MAXFILES,256)
   define (MAXBUF,2048)
   define (EXTRACT,'x'c)
   define (PRINT,'p'c)
   define (UPDATE,'u'c)
   define (DELETE,'d'c)
   define (AR_COMMON,"ar_com.r.i")
   define (HEADER,"#HD#:")
