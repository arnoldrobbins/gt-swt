/* memory.h --- declare mem* functions */

/*  File   : memory.h
    Author : Richard A. O'Keefe.
    Updated: 1 June 1984
    Purpose: Header file for the System V "memory(3C)" package.

    Edited for GT-C by Arnold Robbins, 1 August 1984

    All the functions in this package are the original work  of  Richard
    A. O'Keefe.   Any resemblance between them and any functions in AT&T
    or other licensed software is due entirely to my use of the System V
    memory(3C) manual page as a specification.
*/

#ifndef _MEM_
#define _MEM_ 1

extern  int     memcmp(/*char^,char^,int*/);
extern  char    *memcpy(/*char^,char^,int*/);
extern  char    *memccpy(/*char^,char^,char,int*/);
extern  char    *memset(/*char^,char,int*/);
extern  char    *memchr(/*char^,char,int*/);

#endif
