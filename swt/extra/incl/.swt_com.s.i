* swt_com.s.i --- Software Tools Subsystem Common Block Definition
* Version 9   -- 07/30/84
            NLST

SWT$CM      COMM ;
      TERMBUF(MAXTERMBUF),;
      TERMCP,;
      TERMCOUNT,;
      ECHAR,;
      KCHAR,;
      NLCHAR,;
      EOFCHAR,;
      ESCCHAR,;
      RTCHAR,;
      ISPHANTOM,;
      CPUTYPE,;
      ERRCOD,;
      STDPORTTBL(MAXSTDPORTS),;
      KILLRESP(MAXKILLRESP),;
      FDMEM(FDSIZE*NFILES),;
      RESERVEDIO(846),;
      FDBUF(MAXFDBUF),;
      PASSWD(7),;
      BPLABEL(4),;
      UTEMPTOP,;
      FDLASTFD,;
      PRTDEST(MAXPRTDEST),;
      PRTFORM(MAXPRTFORM),;
      UHASHTB(MAXTEMPHASH),;
      UTEMPBUF(MAXTEMPBUF),;
      RESERVEDOPEN(985),;
      CMDSTAT,;
      COMUNIT,;
      RTLABEL(4),;
      FIRSTUSE,;
      ARGC,;
      ARGV(MAXARGV),;
      TERMATTR(MAXTERMATTR),;
      TERMTYPE(MAXTERMTYPE),;
      LWORD,;
      LSHO,;
      LSTOP,;
      LSNA,;
      LSREF(MAXLSBUF),;
      RESERVEDSHELL(743)

FDDEV       EQU      0  
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
FDVCSTAT1   EQU      8
FDVCSTAT2   EQU      9
FDOPSTAT1   EQU     10
FDOPSTAT2   EQU     11
FDOPSTAT3   EQU     12

            LIST
