#  cron --- definitions for the cron processor

   define (CRONTEMP,"=crondir=/cph*4,-16,0i"s)  # cron phantom files
   define (CRONFILE,"=cronfile="s)           # job file
   define (CRONDIR,"=crondir="s)             # cron's directory
   define (COMMENT,'#'c)                     # comment character
   define (PERIOD,1)                         # minutes between checks
   define (DB,#)                             # debug

   define (MAXMIN,10)
   define (MAXHRS,10)
   define (MAXDAY,10)
   define (MAXDATE,10)
   define (MAXMONTH,10)
   define (MAXLINE,512)
