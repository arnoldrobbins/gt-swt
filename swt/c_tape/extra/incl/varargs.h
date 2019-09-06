/* varargs.h --- portably allow a variable number of arguments */

#ifndef va_alist

#define va_alist  $$1,$$2,$$3,$$4,$$5,$$6,$$7,$$8,$$9,$$10
#define va_dcl    char *$$1,*$$2,*$$3,*$$4,*$$5,*$$6,*$$7,*$$8,*$$9,*$$10;
#define va_list   struct {char *$p; int $f;} *
#define va_start(p)  p=&$$1
#define va_arg(p,t)  (t)?((p++)->$p)
#define va_eol(p)    ((long)p->$p<0)
#define va_end(p)

#endif
