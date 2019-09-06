[cc]mc |
.hd guide "Software Tools Subsystem User's Guides" 08/27/84
[cc]mc
guide  { <option> | <item> }
   <option> ::=  -p
   <item> ::= <guide_name>
.ds
Several of the more complicated or more frequently used
[cc]mc |
Subsystem commands and libraries have additional documentation
beyond that which is available from the reference manual.
[cc]mc
This documentation is in the form of a separate paper
[cc]mc |
on each command or library, but these papers may be combined to form
[cc]mc
the
.ul
Software Tools Subsystem User's Guide.
.sp
The command
.sp
     guide <guide name>
.sp
prints the named guide in a format suitable for reading on a
fast CRT terminal.
.sp
The command
.sp
     guide -p <guide name>
.sp
prints the named guide in a format suitable for the line printer.
.sp
Copies of individual documents may be
printed on one of the on-site line printers by giving the following
command:
.sp
     guide -p <guide name> | os >/dev/lps/f
.sp
where "<guide name>" is one of the following guide names:
.sp 2
.in +5
[cc]mc |
.ne 9
.ti -5
cc
.sp
A copy of the [ul User's Guide for the Georgia Tech C Compiler].
This guide describes the necessary requirements for
compiling programs written in C from the Subsystem.
Refer to [ul The C Programming Language] by Brian Kernighan and
Dennis Ritchie for specific details about the C programming
language.
.bf 100
This guide is only available to customers who have also licensed the
C language compiler package.
.bf 0
.sp 2
.ti -5
ed
.sp
A copy of
.ul
Introduction to the Software Tools Text Editor
is printed.
This paper includes a tutorial on the Subsystem's text editor
that is highly recommended for beginning users, as well as
a command summary and a special section on the Subsystem
screen editor.
.sp 2
.ti -5
fmt
.sp
A copy of the
.ul
Software Tools Subsystem Text Formatter User's Guide
is printed.  This includes tutorial, reference, and applications
information.
One very useful appendix contains all text formatting commands,
arranged alphabetically.
.sp 2
.ti -5
fs
.sp
A copy of
.ul
User's Guide to the Primos File System
is printed.  This paper gives a brief introduction to
the Primos file system as it applies to the use of the
Subsystem.
It explains the structure of the file system, provisions
for security, and how users access files by name.
.sp 2
.ne 5
.ti -5
math
.sp
A copy of the [ul SWT Math Library User's Guide] is printed.
This includes descriptions of the Prime floating point hardware,
the SWT math library, and the tests used to validate the SWT library.
Appendices contain useful programs to help determine where the exponent
is located on your particular machine, determine the amount of loss
of bits in a multiply operation, and calculate hexadecimal constants
for use in mathematical routines.
The addendum documents the routines which used to be in the old,
locally supported, math library "vswtml."
.sp 2
.ne 5
.ti -5
mgr
.sp
A copy of the
.ul
Software Tools Subsystem Manager's Guide
is printed.
This guide is useful for all Subsystem managers and anyone
else interested in the installation, maintenance, and daily
operation of the Subsystem.
.sp 2
.ne 5
.ti -5
ring
.sp
A copy of
.ul
Ring -- The Software Tools Subsystem Network Utility
is printed.
This paper documents the structure and use of 'ring', a
utility which makes it easier for the end user to deal
with Primenet.
.sp 2
.ne 5
.ti -5
rp
.sp
Prints the
.ul
Ratfor Programmer's Guide.
This document includes a detailed description of the Ratfor
programming language as well as instructions for its use
under the Subsystem.
It is essential for anyone hoping to do any significant
amount of programming using the capabilities supplied by
the Subsystem.
.sp 2
.ne 5
.ti -5
sh
.sp
A copy of
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
is printed.  This paper discusses the features of
the Subsystem command interpreter, called the 'shell',
on three levels: a tutorial introduction, a syntax and semantics
reference, and a set of applications notes.
.sp 2
.ne 5
.ti -5
tutorial
.sp
A copy of
.ul
The Software Tools Subsystem Tutorial
is printed.
This tutorial is intended as a user's first
introduction to the Subsystem and covers such essentials as
logging in and out, features of the command language, editing,
online documentation and so forth.
NEW USERS SHOULD READ THIS DOCUMENT FIRST.
.sp 2
.ne 5
.ti -5
v8.1
.sp
A copy of the
.ul
Software Tools Subsystem Version 8 to Version 8.1 Conversion Guide
is printed.  This guide summarizes all user-visible changes
that have been
made between the Version 8 and Version 8.1 Subsystems.
.sp 2
.ne 5
.ti -5
v9
.sp
A copy of the
.ul
Software Tools Subsystem Version 8.1 to Version 9 Conversion Guide
is printed.  This guide summarizes all user-visible changes
that have been
made between the Version 8.1 and Version 9 Subsystems.
[cc]mc
.sp 2
.ti -5
vcg
.sp
A copy of
[ul A Re-Usable Code Generator for Prime 50-Series Computers User's Guide].
'Vcg' is a reusable general-purpose code generator that accepts
[cc]mc |
an "intermediate form" and produces 64V-mode relocatable object code,
or optionally, PMA.
[cc]mc
The V-mode code generator is the back-end for the Georgia
Tech C Compiler.
.bf 100
[cc]mc |
This guide is only available to customers who have also licensed the
[cc]mc
C language compiler package.
.bf 0
.in -5
.es
guide tutorial
guide -p rp | os >/dev/lps/f
.fl
Most of those contained in =doc=/fguide.
.sa
.ul
Software Tools Subsystem Reference Manual
