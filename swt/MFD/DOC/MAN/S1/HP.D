.hd hp "Reverse Polish Notation calculator" 03/20/80
hp  { <expression elements> }
.ds
'Hp' is a desk calculator program using the Reverse Polish Notation
familiar to all stack machine aficionados and users of
Hewlett-Packard calculators.
It accepts expressions composed of operands and operators from
either its argument list or its first standard input and evaluates
them.
.sp
If the expressions to be evaluated are given on the command line,
'hp' prints the resulting value automatically;
otherwise, the user must request printing with the "p" or "P"
commands.
.sp
An acceptable expression consists of a sequence of "constants"
and "commands."
Constants are numeric constants written in the style of Fortran,
and are stored internally as double precision floating-point values.
Commands are single characters that request an arithmetic, stack
control, or control flow operation.
The following commands are currently implemented:
.sp
.in +10
.ta 6
.tc \
.ti -5
p\print the value on the top of the stack.
.sp
.ti -5
P\print all the values currently on the stack.
.sp
.ti -5
d\delete the top value on the stack (throw it away).
.sp
.ti -5
D\empty the stack completely (throw all stacked data away).
.sp
.ti -5
+\add top two items on the stack, place sum on the stack.
.sp
.ti -5
-\subtract top of stack from next to top, place difference on the stack.
.sp
.ti -5
*\multiply top two items on the stack, place product on the stack.
.sp
.ti -5
/\divide next to top of stack by top of stack, place quotient on the stack.
.sp
.ti -5
^\evaluate (next to top of stack) to the (top of stack) power, place
result on the stack.
.sp
.ti -5
<\if next to top of stack is less than top of stack, place a 1 on the
stack; otherwise, place a 0 on the stack.
.sp
.ti -5
=\if next to top of stack equals top of stack, place a 1 on the stack;
otherwise, place a 0 on the stack.
.sp
.ti -5
>\if next to top of stack is greater than top of stack, place a 1 on the
stack; otherwise, place a 0 on the stack.
.sp
.ti -5
&\if next to top of stack is nonzero and top of stack is nonzero, place
a 1 on the stack; otherwise, place a 0 on the stack.
.sp
.ti -5
|\if next to top of stack is nonzero or top of stack is nonzero,
place a 1 on the stack; otherwise, place a 0 on the stack.
.sp
.ti -5
~\if top of stack is nonzero, replace it with a 0; if it is zero,
replace it with a 1 (logical negation).
.sp
.in -10
.es
hp 32.75 4.5 *
hp
1 2 3 4 5 6 7P++++++pd
3.1416 2.7183^ 2.7183 3.1416^>p
.me
.in +5
.ti -5
"stack underflow" if an attempt is made to perform an operation
with insufficient operands on the stack.
.ti -5
"<char>: unrecognized command" if an character not corresponding to
any command appears in an expression.
.in -5
.sa
eval (1), stacc (1)
