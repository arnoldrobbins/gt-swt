# keys.r.i --- symbolic keys for Primos file system (Ratfor version)


##################### PRWF$$ #######################
               ###### RWKEY  ######
   define (KREAD,:1)       # read
   define (KWRIT,:2)       # write
   define (KPOSN,:3)       # position only
   define (KTRNC,:4)       # truncate
   define (KRPOS,:5)       # read current position
               ###### POSKEY ######
   define (KPRER,:0)       # pre-position relative
   define (KPREA,:10)      # pre-position absolute
   define (KPOSR,:20)      # post-position relative
   define (KPOSA,:30)      # post-position absolute
               ###### MODE   ######
   define (KCONV,:400)     # convenient number of words
   define (KFRCW,:40000)   # forced write to disk

##################### SRCH$$ #######################
               ###### ACTION ######
#  define (KREAD,:1)       # open for read
#  define (KWRIT,:2)       # open for write
   define (KRDWR,:3)       # open for reading and writing
   define (KCLOS,:4)       # close file unit
   define (KDELE,:5)       # delete file
   define (KEXST,:6)       # check file's existence
   define (KVMR,:20)       # open for vmfa reading
   define (KVMRW,:60)      # open for vmfa reading/writing
   define (KGETU,:40000)   # system returns unit number
   define (KRESV,:100000)  # reserved
               ###### REF    ######
   define (KIUFD,:0)       # file entry is in ufd
   define (KISEG,:100)     # file entry is in segment directory
   define (KCACC,:1000)    # change access
               ###### NEWFIL ######
   define (KNSAM,:0)       # new sam file
   define (KNDAM,:2000)    # new dam file
   define (KNSGS,:4000)    # new sam segment directory
   define (KNSGD,:6000)    # new dam segment directory
   define (KCURR,:177777)  # currently attached ufd


##################### VINIT$ #######################

   define (KANY,:0)        # use any segments
   define (KSPEC,:1)       # use specified segments
   define (KDUPL,:20)      # use duplicate segments
   define (KCNSC,:10)      # consecutive segments required
   define (KR,:2)          # read access on segment (^= KREAD!)
   define (KRX,:6)         # read/execute access

##################### GETSN$, FIND_SEG ####################

   define (KDOWN,:0)       # allocate decreasing segment #'s
   define (KUP,:1)         # allocate increasing segment #'s
   define (KUPC,:2)        # allocate increasing consec. segs
   define (KDWNC,:4)       # allocate decreasing consec. segs

##################### ATCH$$ #######################
               ###### KEY    ######
   define (KIMFD,:0)       # ufd is in mfd
   define (KICUR,:2)       # ufd is in current ufd
               ###### KEYMOD ######
   define (KSETC,:0)       # set current ufd (do not set home)
   define (KSETH,:1)       # set home ufd (as well as current)
               ###### NAME   ######
   define (KHOME,:0)       # return to home ufd (key=KIMFD)
               ###### LDISK  ######
   define (KALLD,:100000)  # search all disks
#  define (KCURR,:177777)  # search mfd of current disk

##################### AC$SET #######################

#  define (KANY,:0)        # do it regardless
   define (KCREA,:1)       # create new acl (error if already exists)
   define (KREP,:2)        # replace existing acl (error if does not exist)

##################### SGDR$$ #######################
               ###### KEY    ######
   define (KSPOS,:1)       # position to entry number in segdir
   define (KGOND,:2)       # position to end of segdir
   define (KGPOS,:3)       # return current entry number
   define (KMSIZ,:4)       # make segdir given nr of entries
   define (KMVNT,:5)       # move file entry to different position
   define (KFULL,:6)       # position to next non-empty entry
   define (KFREE,:7)       # position to next free entry

##################### RDEN$$ #######################
               ###### KEY    ######
#  define (KREAD,:1)       # read next entry
   define (KRSUB,:2)       # read next sub-entry
#  define (KGPOS,:3)       # return current position in ufd
   define (KUPOS,:4)       # position in ufd
   define (KNAME,:5)       # read entry specified by name

##################### DIR$RD #######################

#  define (KREAD,:1)       # read next entry
   define (KINIT,:2)       # initialize directory (read header)

##################### SATR$$ #######################
               ###### KEY    ######
   define (KPROT,:1)       # set protection
   define (KDTIM,:2)       # set date/time modified
   define (KDMPB,:3)       # set dumped bit
   define (KRWLK,:4)       # set per file read/write lock
   define (KSOWN,:5)       # set owner field on file
   define (KSDL,:6)        # set acl/delete switch on file
   define (KLTYP,:7)       # set logical file type
   define (KDTLS,:10)      # set date/time last saved
   define (KTRUN,:11)      # set truncated by fix_disk bit
               ###### RWLOCK ######
   define (KDFLT,:0)       # use system default value
   define (KEXCL,:1)       # n readers or one writer
   define (KUPDT,:2)       # n readers and one writer
   define (KNONE,:3)       # n readers and n writers

##################### ERRPR$ #######################
               ###### KEY    ######
   define (KNRTN,:0)       # never return to user
   define (KSRTN,:1)       # return after start command
   define (KIRTN,:2)       # immediate return to user

##################### LIMIT$ #######################
               ###### KEY    ######
#  define (KREAD,:0)       # returns information
#  define (KWRIT,:1)       # sets information
               ###### SUBKEY ######
   define (KCPLM,:400)     # cpu time in seconds
   define (KLGLM,:1000)    # login time in minutes


##################### GPATH$ #######################
               ###### KEY    ######
   define (KUNIT,:1)       # pathname of unit returned
   define (KCURA,:2)       # pathname of current attach point
   define (KHOMA,:3)       # pathname of home attach point
   define (KINIA,:4)       # pathname of initial attach point

##################### MSG$ST #######################

   define (KACPT,0)        # accept msgs (also mgset)
   define (KDEFR,1)        # defer msgs  (also mgset)
   define (KRJCT,2)        # reject msgs (also mgset)

##################### FNSID$ #######################

   define (KLIST,1)        # return entire list
   define (KADD,2)         # add to existing list
   define (KSRCH,3)        # search for specific node

########## KEYS FOR RESUME FUNCTIONALITY FOR EPFS ##########
##################### STR$AL, STR$FR #######################

   define (KPROC,1)        # storage types :  per process
   define (KLEVL,2)        # per level
   define (KPROG,2)        # per program
   define (KSYST,4)        # per system
   define (KFRBK,5)        # free a block of storage
   define (KANYW,-1)       # base the storage block anywhere
   define (KZERO,0)        # base the storage block at word 0

################# R$MAP, R$INIT, R$ALLC #####################
################# R$RUN, R$INVK, R$DEL  #####################

   define (KCOPY,1)        # copy epf file into temp segs
   define (KDBG,2)         # map dbg info epf into memory
   define (KINAL,1)        # init all of the epf's linkage
   define (KREIN,2)        # only init reinit epf linkage
   define (KINVK,0)        # invoke and delete epf from memory
   define (KIVND,1)        # invoke and do not delete epf from mem.
   define (KREST,2)        # do not invoke epf, just restore

################### DYNAMIC STORAGE MANAGER #################

#  define (KPROC,1)        # storage types: per process
#  define (KLEVL,2)        # per level
   define (KUSER,3)        # per user
#  define (KSYST,4)        # per system

################ FNCHK$, TNCHK$, IDCHK$, PWCHK$ #############

   define (KUPRC,1)        # mask string to uppercase
   define (KWLDC,2)        # allow wildcards (not PWCHK$)
   define (KNULL,4)        # allow null names
   define (KNUM,8)         # allow numeric names (FNCHK$ only)
   define (KGRP,8)         # check group name (IDCHK$ only)

##################### Q$SET ########################

   define (KSMAX,1)        # set max quota

##################### LGINI$ #######################

   define (KLOF,0)         # os logging on
   define (KNLOF,1)        # net logging off
   define (KLON,2)         # os logging on
   define (KNLON,3)        # net logging on
   define (KLONP,4)        # turn sys logging on, use prev file
   define (KNLOP,5)        # turn net logging on, use prev file
   define (KST$S,6)        # return system logging status
   define (KST$N,7)        # return network logging status

##################### LDISK$ #######################

   define (KALL,0)         # return all disks
   define (KLOCL,1)        # local disks only
   define (KREM,2)         # remote disks only
   define (KSYS,3)         # disks from a specified system

##################### SW$INT #######################

#  define (KREAD,1)        # read present status
   define (KON,2)          # turn on interrupt(s)
   define (KOFF,3)         # turn off interrupt(s)
   define (KRDON,4)        # read present status and
                           # turn on interrupt(s)
   define (KRDOF,5)        # read present status and
                           # turn off interrupt(s)
   define (KRDAL,6)        # read present status of all interrupts
   define (KALON,7)        # turn on all interrupts
   define (KALOF,8)        # turn off all interrupts
   define (KRAON,9)        # read present status and
                           # turn on all interrupts
   define (KRAOF,10)       # read present status and
                           # turn off all interrupts

##################### DIR$CR #######################

   define (KSAME,0)        # create directory of parent's type
   define (KPWD,1)         # create password directory

####################################################
