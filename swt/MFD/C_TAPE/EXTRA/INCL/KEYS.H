/* keys.h --- symbolic keys for Primos file system (C version) */


#ifndef KREAD   /* Arbitrary choice, it's the first key */
/*#################### PRWF$$ #######################*/
               /*##### RWKEY  ######*/
#define  KREAD  01        /* read */
#define  KWRIT  02        /* write */
#define  KPOSN  03        /* position only */
#define  KTRNC  04        /* truncate */
#define  KRPOS  05        /* read current position */
               /*##### POSKEY ######*/
#define  KPRER  00        /* pre-position relative */
#define  KPREA  010       /* pre-position absolute */
#define  KPOSR  020       /* post-position relative */
#define  KPOSA  030       /* post-position absolute */
               /*##### MODE   ######*/
#define  KCONV  0400      /* convenient number of words */
#define  KFRCW  040000    /* forced write to disk */

/*#################### SRCH$$ #######################*/
               /*##### ACTION ######*/
/*#define  KREAD  01        /* open for read */
/*#define  KWRIT  02        /* open for write */
#define  KRDWR  03        /* open for reading and writing */
#define  KCLOS  04        /* close file unit */
#define  KDELE  05        /* delete file */
#define  KEXST  06        /* check file's existence */
#define  KVMR  020        /* open for vmfa reading */
#define  KVMRW  060       /* open for vmfa reading/writing */
#define  KGETU  040000    /* system returns unit number */
#define  KRESV  0100000   /* reserved */
               /*##### REF    ######*/
#define  KIUFD  00        /* file entry is in ufd */
#define  KISEG  0100      /* file entry is in segment directory */
#define  KCACC  01000     /* change access */
               /*##### NEWFIL ######*/
#define  KNSAM  00        /* new sam file */
#define  KNDAM  02000     /* new dam file */
#define  KNSGS  04000     /* new sam segment directory */
#define  KNSGD  06000     /* new dam segment directory */
#define  KCURR  0177777   /* currently attached ufd */


/*#################### VINIT$ #######################*/

#define  KANY  00         /* use any segments */
#define  KSPEC  01        /* use specified segments */
#define  KDUPL  020       /* use duplicate segments */
#define  KCNSC  010       /* consecutive segments required */
#define  KR  02           /* read access on segment (^= KREAD!) */
#define  KRX  06          /* read/execute access */

/*#################### GETSN$, FIND_SEG ####################*/

#define  KDOWN  00        /* allocate decreasing segment #'s */
#define  KUP  01          /* allocate increasing segment #'s */
#define  KUPC  02         /* allocate increasing consec. segs */
#define  KDWNC  04        /* allocate decreasing consec. segs */

/*#################### ATCH$$ #######################*/
               /*##### KEY    ######*/
#define  KIMFD  00        /* ufd is in mfd */
#define  KICUR  02        /* ufd is in current ufd */
               /*##### KEYMOD ######*/
#define  KSETC  00        /* set current ufd (do not set home) */
#define  KSETH  01        /* set home ufd (as well as current) */
               /*##### NAME   ######*/
#define  KHOME  00        /* return to home ufd (key=KIMFD) */
               /*##### LDISK  ######*/
#define  KALLD  0100000   /* search all disks */
/*#define  KCURR  0177777   /* search mfd of current disk */

/*#################### AC$SET #######################*/

/*#define  KANY  00         /* do it regardless */
#define  KCREA  01        /* create new acl (error if already exists) */
#define  KREP  02         /* replace existing acl (error if does not exist) */

/*#################### SGDR$$ #######################*/
               /*##### KEY    ######*/
#define  KSPOS  01        /* position to entry number in segdir */
#define  KGOND  02        /* position to end of segdir */
#define  KGPOS  03        /* return current entry number */
#define  KMSIZ  04        /* make segdir given nr of entries */
#define  KMVNT  05        /* move file entry to different position */
#define  KFULL  06        /* position to next non-empty entry */
#define  KFREE  07        /* position to next free entry */

/*#################### RDEN$$ #######################*/
               /*##### KEY    ######*/
/*#define  KREAD  01        /* read next entry */
#define  KRSUB  02        /* read next sub-entry */
/*#define  KGPOS  03        /* return current position in ufd */
#define  KUPOS  04        /* position in ufd */
#define  KNAME  05        /* read entry specified by name */

/*#################### DIR$RD #######################*/

/*#define  KREAD  01        /* read next entry */
#define  KINIT  02        /* initialize directory (read header) */

/*#################### SATR$$ #######################*/
               /*##### KEY    ######*/
#define  KPROT  01        /* set protection */
#define  KDTIM  02        /* set date/time modified */
#define  KDMPB  03        /* set dumped bit */
#define  KRWLK  04        /* set per file read/write lock */
#define  KSOWN  05        /* set owner field on file */
#define  KSDL  06         /* set acl/delete switch on file */
#define  KLTYP  07        /* set logical file type */
#define  KDTLS  010       /* set date/time last saved */
#define  KTRUN  011       /* set truncated by fix_disk bit */
               /*##### RWLOCK ######*/
#define  KDFLT  00        /* use system default value */
#define  KEXCL  01        /* n readers or one writer */
#define  KUPDT  02        /* n readers and one writer */
#define  KNONE  03        /* n readers and n writers */

/*#################### ERRPR$ #######################*/
               /*##### KEY    ######*/
#define  KNRTN  00        /* never return to user */
#define  KSRTN  01        /* return after start command */
#define  KIRTN  02        /* immediate return to user */

/*#################### LIMIT$ #######################*/
               /*##### KEY    ######*/
/*#define  KREAD  00        /* returns information */
/*#define  KWRIT  01        /* sets information */
               /*##### SUBKEY ######*/
#define  KCPLM  0400      /* cpu time in seconds */
#define  KLGLM  01000     /* login time in minutes */


/*#################### GPATH$ #######################*/
               /*##### KEY    ######*/
#define  KUNIT  01        /* pathname of unit returned */
#define  KCURA  02        /* pathname of current attach point */
#define  KHOMA  03        /* pathname of home attach point */
#define  KINIA  04        /* pathname of initial attach point */

/*#################### MSG$ST #######################*/

#define  KACPT  0         /* accept msgs (also mgset) */
#define  KDEFR  1         /* defer msgs  (also mgset) */
#define  KRJCT  2         /* reject msgs (also mgset) */

/*#################### FNSID$ #######################*/

#define  KLIST  1         /* return entire list */
#define  KADD  2          /* add to existing list */
#define  KSRCH  3         /* search for specific node */

/*######### KEYS FOR RESUME FUNCTIONALITY FOR EPFS ##########*/
/*#################### STR$AL, STR$FR #######################*/

#define  KPROC  1         /* storage types 0  per process */
#define  KLEVL  2         /* per level */
#define  KPROG  2         /* per program */
#define  KSYST  4         /* per system */
#define  KFRBK  5         /* free a block of storage */
#define  KANYW  -1        /* base the storage block anywhere */
#define  KZERO  0         /* base the storage block at word 0 */

/*################ R$MAP, R$INIT, R$ALLC #####################*/
/*################ R$RUN, R$INVK, R$DEL  #####################*/

#define  KCOPY  1         /* copy epf file into temp segs */
#define  KDBG  2          /* map dbg info epf into memory */
#define  KINAL  1         /* init all of the epf's linkage */
#define  KREIN  2         /* only init reinit epf linkage */
#define  KINVK  0         /* invoke and delete epf from memory */
#define  KIVND  1         /* invoke and do not delete epf from mem. */
#define  KREST  2         /* do not invoke epf, just restore */

/*################## DYNAMIC STORAGE MANAGER #################*/

/*#define  KPROC  1         /* storage types: per process */
/*#define  KLEVL  2         /* per level */
#define  KUSER  3         /* per user */
/*#define  KSYST  4         /* per system */

/*############### FNCHK$, TNCHK$, IDCHK$, PWCHK$ #############*/

#define  KUPRC  1         /* mask string to uppercase */
#define  KWLDC  2         /* allow wildcards (not PWCHK$) */
#define  KNULL  4         /* allow null names */
#define  KNUM  8          /* allow numeric names (FNCHK$ only) */
#define  KGRP  8          /* check group name (IDCHK$ only) */

/*#################### Q$SET ########################*/

#define  KSMAX  1         /* set max quota */

/*#################### LGINI$ #######################*/

#define  KLOF  0          /* os logging on */
#define  KNLOF  1         /* net logging off */
#define  KLON  2          /* os logging on */
#define  KNLON  3         /* net logging on */
#define  KLONP  4         /* turn sys logging on, use prev file */
#define  KNLOP  5         /* turn net logging on, use prev file */
#define  KST$S  6         /* return system logging status */
#define  KST$N  7         /* return network logging status */

/*#################### LDISK$ #######################*/

#define  KALL  0          /* return all disks */
#define  KLOCL  1         /* local disks only */
#define  KREM  2          /* remote disks only */
#define  KSYS  3          /* disks from a specified system */

/*#################### SW$INT #######################*/

/*#define  KREAD  1         /* read present status */
#define  KON  2           /* turn on interrupt(s) */
#define  KOFF  3          /* turn off interrupt(s) */
#define  KRDON  4         /* read present status and */
                           /* turn on interrupt(s) */
#define  KRDOF  5         /* read present status and */
                           /* turn off interrupt(s) */
#define  KRDAL  6         /* read present status of all interrupts */
#define  KALON  7         /* turn on all interrupts */
#define  KALOF  8         /* turn off all interrupts */
#define  KRAON  9         /* read present status and */
                           /* turn on all interrupts */
#define  KRAOF  10        /* read present status and */
                           /* turn off all interrupts */

/*#################### DIR$CR #######################*/

#define  KSAME  0         /* create directory of parent's type */
#define  KPWD  1          /* create password directory */

/*###################################################*/
#endif
