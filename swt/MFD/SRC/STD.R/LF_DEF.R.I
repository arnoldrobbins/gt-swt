# lf_def.r.i --- definitions for the 'lf' program

# Entry field offset definitions:

   define (SIZEPOS,2)
   define (OWNERPOS,4)
   define (NAMEPOS,11)
   define (PROPOS,27)
   define (DTMPOS,30)


# Option definitions:

   define (ALL_FILES,1)           # -a
   define (COLUMNAR,2)            # -c
   define (DIRECTORY,3)           # -d
   define (DUMPED,4)              # -u
   define (FILETYPE,5)            # -t
   define (FULLNAME,6)            # -f
   define (LABEL,7)               # -v
   define (LOCK,8)                # -k
   define (NOSORT,9)              # -n
   define (OWNER,10)              # -o
   define (PROTECTIONS,11)        # -p
   define (REVERSE,12)            # -r
   define (SECURITY,13)           # -b
   define (SEGMENT_DIR,14)        # -g
   define (SUBTREE,15)            # -s
   define (TIMEDATE,16)           # -m
   define (WORDS,17)              # -w
   define (PASSWORD,18)           # -q


# Miscellaneous definitions:

   define (DUMPED_BIT,8r40000)
   define (MODIFIED_BIT,8r20000)
   define (SPECIAL_FILE,8r10000)
   define (LOCK1,8r2000)
   define (LOCK2,8r4000)
   define (MAXOPTS,18)
   define (MEMSIZE,32000)
   define (NODESIZE,42)       # dependent on MAXDIRENTRY + 10
   define (OUTPUT_WIDTH,78)   # should be a multiple of TAB_WIDTH
   define (RWLOCK,8r6000)
   define (TAB_WIDTH,13)      # width of each output column
   define (MAXPATH,512)
