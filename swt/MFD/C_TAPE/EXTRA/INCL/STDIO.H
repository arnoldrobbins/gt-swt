/* stdio.h --- definitions for the C Standard I/O Library */

#ifndef _NFILES
#define _NFILES    128

typedef struct c$cm00 {
      int  _flag;       /* mode of file access */
      int  _fd;         /* SWT file descriptor */
      int  _errs;       /* error flags */
      char _pbc;        /* pushed back character for ungetc */
      } FILE;

extern FILE c$iocm[_NFILES];

extern long ftell();
extern FILE *fopen(), *fdopen(),  *freopen(), *popen();
extern char *fgets(), *gets();
extern char *strcat(), *strcpy(), *strncpy(), *strpbrk(), *strtok();
extern char *strchr(), *strrchr(), *index(), *rindex();

#define stdin           (&c$iocm[0])
#define stdout          (&c$iocm[1])
#define stderr          (&c$iocm[2])
#define stdin1          stdin
#define stdout1         stdout
#define stdin2          (&c$iocm[_NFILES-3])
#define stdout2         (&c$iocm[_NFILES-2])
#define stdin3          (&c$iocm[_NFILES-4])
#define stdout3         stderr
#define tty             (&c$iocm[_NFILES-1])
#define errin           stdin3
#define errout          stderr

/* values for flag field */
#define _CLOSED         00
/*
 * other values are SWT
 * READ, WRITE, READWRITE
 */
#define _APPEND         010     /* this file opened for appending */
                                /* must be different than READ, WRITE, READWRITE */

/* values for errs field */
#define _IOERR          01      /* an io error has occurred on this file */
#define _IOEOF          02      /* eof has occurred */
#define _NOTATEND       04      /* append mode file not at its end */

#define EOF             (-1)    /* end of file has occurred */

#define NULL            ((char *)0)     /* the empty pointer */
#define BUFSIZ          1024    /* a common and convenient buffer size */

#define TRUE            1
#define FALSE           0

#define L_cuserid       33
#define L_ctermid       9
#define L_tmpnam        18
#define P_tmpdir        "=temp="

#define getchar()       (getc(stdin))
#define putchar(ch)     (putc(ch, stdout))

#define feof(fp)        (((fp)->_errs & _IOEOF) != 0)
#define ferror(fp)      (((fp)->_errs & _IOERR) != 0)
#define clearerr(fp)    ((fp)->_errs &= ~ (_IOERR | _IOEOF))
#define fileno(fp)      ((fp)->_fd)

#define open            c$open
#define close           c$clos
#define mktemp          c$mktemp
#endif
