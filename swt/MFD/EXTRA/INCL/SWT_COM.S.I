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
      RESERVEDSHELL(743),;
      TSSTATE,;
      TSGT,;
      TSAT,;
      TSEOS,;
      TSUN(MAXLEV),;
      TSPS(MAXLEV),;
      TSBF(MAXDIRENTRY*MAXLEV),;
      TSPW(3*MAXLEV),;
      TSPATH(MAXPATH),;
      RESERVEDTSCAN(680),;
      NEWSCR(MAXCOLS*MAXROWS),;
      RESERVEDNEWSCR(785),;
      CURSCR(MAXCOLS*MAXROWS),;
      RESERVEDCURSCR(785),;
      TCCLEARSCR(SEQSIZE),;
      TCCLEARTOEOL(SEQSIZE),;
      TCCLEARTOEOS(SEQSIZE),;
      TCCURSORHOME(SEQSIZE),;
      TCCURSORLEFT(SEQSIZE),;
      TCCURSORRIGHT(SEQSIZE),;
      TCCURSORUP(SEQSIZE),;
      TCCURSORDOWN(SEQSIZE),;
      TCABSPOS(SEQSIZE),;
      TCVERTPOS(SEQSIZE),;
      TCHORPOS(SEQSIZE),;
      TCINSLINE(SEQSIZE),;
      TCDELLINE(SEQSIZE),;
      TCINSCHAR(SEQSIZE),;
      TCDELCHAR(SEQSIZE),;
      TCINSSTR(SEQSIZE),;
      TCSHIFTIN(SEQSIZE),;
      TCSHIFTOUT(SEQSIZE),;
      TCCOORDCHAR,;
      TCSHIFTCHAR,;
      TCCOORDTYPE,;
      TCSEQTYPE,;
      TCDELAYTIME,;
      TCWRAPAROUND,;
      TCCLRLEN,;
      TCCEOSLEN,;
      TCCEOLLEN,;
      TCABSLEN,;
      TCVERTLEN,;
      TCHORLEN,;
      UNPRINTABLECHAR,;
      COLCHGSTART(MAXROWS),;
      COLCHGSTOP(MAXROWS),;
      ROWCHGSTART,;
      ROWCHGSTOP,;
      LASTCHAR(MAXROWS),;
      MAXROW,;
      MAXCOL,;
      CURROW,;
      CURCOL,;
      MSGROW,;
      MSGOWNER(MAXCOLS),;
      PADROW,;
      PADCOL,;
      PADLEN,;
      DISPLAYTIME,;
      FNTAB(CHARSETSIZE*MAXESCAPE),;
      LASTFN,;
      TABS(MAXCOLS),;
      INPUTSTART(MAXROWS),;
      INPUTSTOP(MAXROWS),;
      INBUF(MAXCOLS),;
      LASTCHARSCANNED,;
      INSERTMODE,;
      INVERTCASE,;
      DUPLEX,;
      INPUTWAIT,;
      PBBUF(MAXPB),;
      PBPTR,;
      FNUSED(MAXESCAPE),;
      DEFBUF(MAXDEF),;
      LASTDEF,;
      NESTINGCOUNT,;
      RESERVEDVTHMISC(489)

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
