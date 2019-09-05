/* setjmp.h --- defines for setjmp and longjmp */

#ifndef setjmp
typedef int jmp_buf[5];

/* the following macro is so that it behaves like the unix call */
#define setjmp(x)    (setjmp1(x),x[4])
#endif
